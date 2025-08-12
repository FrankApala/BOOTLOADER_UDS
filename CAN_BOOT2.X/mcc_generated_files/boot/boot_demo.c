

/**
 * Generated 16-bit Bootloader Source File
 * 
 * @file     boot_demo.c
 * 
 * @brief    Example boot loader implementation.  This file determines:
 *           - when to stay in boot loader mode
 *           - when/how an application image is verified
 *           - when to jump to an application
 *           - when to load a backup application image
 *           - when to load a newly downloaded image (if there is a separate download image slot) 
 *
 *           It is intended that the user will replace/modify this file to meet their
 *           design needs.  This file provides an example implementation.
 *
 * @skipline @version    16-bit Bootloader - 1.26.0
 *
 * @skipline             Device : dsPIC33CK256MP508
*/
/*
    (c) [2025] Microchip Technology Inc. and its subsidiaries.

    Subject to your compliance with these terms, you may use Microchip 
    software and any derivatives exclusively with Microchip products. 
    You are responsible for complying with 3rd party license terms  
    applicable to your use of 3rd party software (including open source  
    software) that may accompany Microchip software. SOFTWARE IS "AS IS." 
    NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS 
    SOFTWARE, INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT,  
    MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT 
    WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY 
    KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF 
    MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE 
    FORESEEABLE. TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP?S 
    TOTAL LIABILITY ON ALL CLAIMS RELATED TO THE SOFTWARE WILL NOT 
    EXCEED AMOUNT OF FEES, IF ANY, YOU PAID DIRECTLY TO MICROCHIP FOR 
    THIS SOFTWARE.
*/


#include <stdbool.h>
#include <stdint.h>
#include "boot_config.h"
#include "boot_application_header.h"
#include "boot_image.h"
#include "boot_process.h"
#include "boot_private.h"

#include "../flash/flash.h"
#include "../../mcc_generated_files/system/pins.h"
#include "../../iso14229/iso14229.h"

#define DOWNLOADED_IMAGE    1u
#define EXECUTION_IMAGE     0u

static bool inBootloadMode = false;
static bool executionImageRequiresValidation = true;
static bool executionImageValid = false;
static uint32_t downloadAddress = 0;
static uint32_t downloadEnd = 0;
static const uint16_t maxDownloadBlockLen = 130u; // 128 data bytes + SID + block counter



static bool EnterBootloadMode(void);
struct CAN_MSG_OBJ canMsg, rxMsg;

#define VIN_LEN 17

/* no trailing NUL?this is _binary_ data on the wire */
//static uint8_t vin_local[VIN_LEN] = {'T','A','D','S','P','I','C','2','0','2','2','X','X','X','X','0'};


static uint8_t vinw[VIN_LEN] = { 0 };  // mutable

static uint8_t fixed_key[] = {0x12, 0x34, 0x56, 0x78};
static uint8_t fixed_seed[]  = {0x87, 0x65, 0x43, 0x21}; // expected response to fixed_seed


UDSServer_t server;
UDSISOTpC_t isotp_tp;


const UDSISOTpCConfig_t isotp_config = {
    .source_addr = 0x7E8,
    .target_addr = 0x7E0,
    .source_addr_func = 0x7DF,
    .target_addr_func = UDS_TP_NOOP_ADDR
};


/*==============================================================================
 DTC 
==============================================================================*/
#define MAX_DTC_COUNT 10
#define MAX_RECORDS_PER_DTC 10



typedef struct {
    uint32_t code;    // 3-byte DTC code
    uint8_t status;   // ISO14229 status byte
    uint8_t snapshotRecords[MAX_RECORDS_PER_DTC];
    uint8_t numSnapshots;
} DTCEntry_t;

static DTCEntry_t dtc_list[MAX_DTC_COUNT];
static uint8_t dtc_count = 0;

void DTC_Add(uint32_t code, uint8_t status) {
    // Check if already exists
    for (uint8_t i = 0; i < dtc_count; i++) {
        if (dtc_list[i].code == code) {
            dtc_list[i].status |= status;  // Update status bits
            return;
        }
    }

    // Add new if space available
    if (dtc_count < MAX_DTC_COUNT) {
        dtc_list[dtc_count].code = code;
        dtc_list[dtc_count].status = status;
        
        dtc_list[dtc_count].snapshotRecords[0] = 0x01;  // Record number 1
        dtc_list[dtc_count].numSnapshots = 1;

        dtc_count++;
        dtc_count++;
    }
}

/*==============================================================================
 UDS Callback
==============================================================================*/
enum UDSDiagnosticSessionType g_activeSession = kDefaultSession;
static bool g_seed_generated = false;
static bool g_key_validated = false;

// === UDS Application Callback ===
static UDSErr_t uds_callback(UDSServer_t *srv, UDSEvent_t evt, void *data) {
    UDSErr_t ret;
    // printf("callback: \r\n");
    switch (evt) {
  
        case UDS_EVT_DiagSessCtrl:  
       ret= uds_handle_DiagnosticSessions0x10(srv,(UDSDiagSessCtrlArgs_t *)data);
       break;
    
   case UDS_EVT_EcuReset: 
       ret= uds_handle_EcuReset(srv,(UDSECUResetArgs_t *)data);
       break;
   case UDS_EVT_DoScheduledReset: 
            // Only invoked after a real reset type (01?03)
     asm("reset");
      break;
      
     
         case UDS_EVT_ClearDiagInformation: 
             ret= uds_handle_0x14ClearDiagnostic(srv,(UDSClearDTCArgs_t *)data);
             break;


    
         
   case UDS_EVT_ReadDTCInformation: {
      UDSReadDTCInfoArgs_t *args =(UDSReadDTCInfoArgs_t *)data;
        
    uint8_t *res = srv->r.send_buf;

    if (args->subFunction == 0x02) {
        res[0] = args->subFunction;
        uint8_t dtc_status_availability_mask = 0;

    for(uint8_t i = 0; i < dtc_count; i++) {
    dtc_status_availability_mask |= dtc_list[i].status;
}


        res[1] = dtc_status_availability_mask;  // DTCStatusAvailabilityMask
        uint8_t offset = 2;

        for (uint8_t i = 0; i < dtc_count; i++) {
            if ((dtc_list[i].status & args->statusMask) != 0) {
                if (offset + 4 > srv->r.send_buf_size) {
                    ret= UDS_NRC_ResponseTooLong;
                    break;
                }
                uint32_t code = dtc_list[i].code;
                res[offset++] = (code >> 16) & 0xFF;
                res[offset++] = (code >> 8) & 0xFF;
                res[offset++] = code & 0xFF;
                res[offset++] = dtc_list[i].status;
            }
        }

        srv->r.send_len = offset;
        ret= UDS_PositiveResponse;
        break;
    

}
    
    if (args->subFunction == 0x04) {
    uint8_t localRecordList[MAX_RECORDS_PER_DTC];
    uint8_t localRecordCount = 0;

    for (uint8_t i = 0; i < dtc_count; i++) {
        for (uint8_t j = 0; j < dtc_list[i].numSnapshots; j++) {
            uint8_t rec = dtc_list[i].snapshotRecords[j];
            bool alreadyPresent = false;
            for (uint8_t k = 0; k < localRecordCount; k++) {
                if (localRecordList[k] == rec) {
                    alreadyPresent = true;
                    break;
                }
            }
            if (!alreadyPresent) {
                if (localRecordCount >= MAX_RECORDS_PER_DTC) {
                    ret= UDS_NRC_ResponseTooLong; // Avoid buffer overflow                   
                    break;
                }
                localRecordList[localRecordCount++] = rec;
            }
        }
    }

    // Build UDS response
    if (2 + localRecordCount > srv->r.send_buf_size) {
        ret= UDS_NRC_ResponseTooLong;
        break;
    }

    res[0] = args->subFunction;  // 0x04 echo
    res[1] = localRecordCount;
    for (uint8_t i = 0; i < localRecordCount; i++) {
        res[2 + i] = localRecordList[i];
    }
    srv->r.send_len = 2 + localRecordCount;

    ret=UDS_PositiveResponse;
    break;
}
    ret=UDS_NRC_SubFunctionNotSupported;
    break;
} 
       
      
   
       //return uds_handle_0x19ReadDTC(srv, (UDSReadDTCInfoArgs_t *)data);
    
 
     case UDS_EVT_ReadDataByIdent: 
       ret= uds_handle_rdbi(srv,(UDSRDBIArgs_t *)data);
       break;
    
   
       /* case UDS_EVT_SecAccessRequestSeed :, // UDSSecAccessRequestSeedArgs_t *
        case  UDS_EVT_SecAccessValidateKey :, // UDSSecAccessValidateKeyArgs_t **/
   
    case UDS_EVT_SecAccessRequestSeed:
        ret=uds_handle_0x27requestSeed(srv,(UDSSecAccessRequestSeedArgs_t *)data);
        break;
           

    case UDS_EVT_SecAccessValidateKey: 
         ret=uds_handle_0x27validateKey(srv,(UDSSecAccessValidateKeyArgs_t *)data );
         break;

   /* case UDS_EVT_ReadDataByIdent: {
       return uds_handle_rdbi(srv,(UDSRDBIArgs_t *)data);
    }*/
   
   case UDS_EVT_WriteDataByIdent: 
    ret=uds_handle_wdbi(srv,(UDSWDBIArgs_t *)data);
    break;
    
        case  UDS_EVT_RoutineCtrl:
    ret=uds_handle_routine_control(srv,(UDSRoutineCtrlArgs_t *)data);
    break;
    
    case UDS_EVT_RequestDownload: 
        ret = uds_handle_RequestDownload(srv, (UDSRequestDownloadArgs_t *)data);
        break;
    case UDS_EVT_TransferData: 
        ret = uds_handle_TransferData(srv, (UDSTransferDataArgs_t *)data);
        break;

    case UDS_EVT_RequestTransferExit: 
         ret = uds_handle_RequestTransferExit(srv, (UDSRequestTransferExitArgs_t *)data);
        break;
    
       
       
    default:
        ret= UDS_NRC_ServiceNotSupported;
        break;
    
    }
       if (ret == UDS_PositiveResponse) {
        srv->s3_session_timeout_timer = UDSMillis() + srv->s3_ms;
    }
    return ret;
    
    }




/*==============================================================================
 UDS Handles
==============================================================================*/
UDSErr_t uds_handle_RequestDownload(UDSServer_t *srv, UDSRequestDownloadArgs_t *args){

    if (!args) {
        return UDS_NRC_GeneralReject;
    }
  /*  if (srv->sessionType != kProgrammingSession || srv->securityLevel < 0x01) {
        return UDS_NRC_ConditionsNotCorrect;
    }*/

    uint32_t start = ((uint32_t)args->addr) / 2u;
    uint32_t end = start + (args->size / 2u);

    if ((((uintptr_t)args->addr & 1u) != 0u) || (args->size % MINIMUM_WRITE_BLOCK_SIZE) != 0u) {
        return UDS_NRC_RequestOutOfRange;
    }
    if (!IsLegalRange(start, end)) {
        return UDS_NRC_RequestOutOfRange;
    }

    uint32_t pageBytes = BOOT_EraseSizeGet();
    uint32_t pages = (args->size + pageBytes - 1u) / pageBytes;
    if (BOOT_BlockErase(start, pages, FLASH_UNLOCK_KEY) != NVM_SUCCESS) {
        return UDS_NRC_GeneralProgrammingFailure;
    }

    downloadAddress = start;
    downloadEnd = end;
    executionImageValid = false;
    args->maxNumberOfBlockLength = maxDownloadBlockLen;
    return UDS_PositiveResponse;
}

UDSErr_t uds_handle_TransferData(UDSServer_t *srv, UDSTransferDataArgs_t *args){

    if (!args) {
        return UDS_NRC_GeneralReject;
    }
    /*if (srv->sessionType != kProgrammingSession || srv->securityLevel < 0x01) {
        return UDS_NRC_ConditionsNotCorrect;
    }*/
    if (downloadEnd == 0u) {
        return UDS_NRC_RequestSequenceError;
    }
    if ((args->len % MINIMUM_WRITE_BLOCK_SIZE) != 0u) {
        return UDS_NRC_RequestOutOfRange;
    }
    if ((downloadAddress + (args->len / 2u)) > downloadEnd) {
        return UDS_NRC_RequestOutOfRange;
    }
    if (BOOT_BlockWrite(downloadAddress, args->len, (uint8_t *)args->data,
                         FLASH_UNLOCK_KEY) != NVM_SUCCESS) {
        return UDS_NRC_GeneralProgrammingFailure;
    }
    downloadAddress += (args->len / 2u);
    return UDS_PositiveResponse;
}

UDSErr_t uds_handle_RequestTransferExit(UDSServer_t *srv, UDSRequestTransferExitArgs_t *args){
    (void)args;

    /*if (srv->sessionType != kProgrammingSession || srv->securityLevel < 0x01) {
        return UDS_NRC_ConditionsNotCorrect;
    }*/
    if (downloadEnd == 0u) {
        return UDS_NRC_RequestSequenceError;
    }
    if (downloadAddress != downloadEnd) {
        return UDS_NRC_RequestOutOfRange;
    }

    executionImageRequiresValidation = true;
    downloadAddress = 0u;
    downloadEnd = 0u;
    return UDS_PositiveResponse;
}


UDSErr_t uds_handle_DiagnosticSessions0x10(UDSServer_t *srv, UDSDiagSessCtrlArgs_t *args){
    
    if (!args) {
        return UDS_NRC_GeneralReject;
    }
    
   switch (args->type) {
    case kProgrammingSession:
        if (srv->securityLevel < 0x01) {
            return UDS_NRC_SecurityAccessDenied;
        }
        srv->sessionType = kProgrammingSession;
        srv->s3_ms = UDS_SERVER_DEFAULT_S3_MS;
        srv->s3_session_timeout_timer = UDSMillis() + srv->s3_ms;
        args->p2_ms = 50;
        args->p2_star_ms = 500;
        return UDS_PositiveResponse;

    case kExtendedDiagnostic:
    case kDefaultSession:
    case kEngineeringDiagnostic:
    case kProductionDiagnosticSession:
        srv->sessionType = args->type;
        srv->s3_ms = UDS_SERVER_DEFAULT_S3_MS;
        srv->s3_session_timeout_timer = UDSMillis() + srv->s3_ms;
        args->p2_ms = 50;
        args->p2_star_ms = 500;
        return UDS_PositiveResponse;

    default:
        return UDS_NRC_SubFunctionNotSupported;
}   
}


UDSErr_t uds_handle_0x14ClearDiagnostic(UDSServer_t *srv, UDSClearDTCArgs_t *args){
     if (!args) {
        return UDS_NRC_GeneralReject;
    }

    if (args->groupOfDTC == 0xFFFFFF) {
        // Clear all DTCs
        dtc_count = 0;
        return UDS_PositiveResponse;
    }

    return UDS_NRC_RequestOutOfRange;
}



 uds_handle_0x27requestSeed(UDSServer_t *srv, const UDSSecAccessRequestSeedArgs_t *args){
     if (srv->sessionType != kExtendedDiagnostic ) {
        return UDS_NRC_SubFunctionNotSupported;
    }
    if (!args) {
        return UDS_NRC_GeneralReject;
    }
   if (args->level == 0x01) {
       g_seed_generated = true;
        return args->copySeed(srv, fixed_seed, sizeof(fixed_seed));
          } else
          {
                return UDS_NRC_RequestOutOfRange;
            }
 
}

UDSErr_t uds_handle_0x27validateKey(UDSServer_t *srv, const  UDSSecAccessValidateKeyArgs_t *args){
      
    if ( srv->sessionType != kExtendedDiagnostic ) {
        return UDS_NRC_SubFunctionNotSupported;
    }
    
    if (!g_seed_generated) {
        return UDS_NRC_ConditionsNotCorrect; // 0x22
    }
    
    if (!args) {
        return UDS_NRC_GeneralReject;
    }
    if (args->level == 0x01 &&
                args->len == sizeof(fixed_key) &&
                memcmp(args->key, fixed_key, sizeof(fixed_key)) == 0) {
                 srv->securityLevel = args->level;  // ? Grant access level
                  g_seed_generated = false;          // ? Clear seed lock after success
                return UDS_PositiveResponse;
            } else {
                return UDS_NRC_InvalidKey;
            }
 
}




UDSErr_t uds_handle_EcuReset(UDSServer_t *srv, const UDSECUResetArgs_t *resetArgs){
   
    if (srv->sessionType < kProgrammingSession) {
        return UDS_NRC_SubFunctionNotSupported;
    }
    if (!resetArgs) {
        return UDS_NRC_GeneralReject;
    }
    
    switch(resetArgs->type) {
        case kHardReset:  // 0x01
        case kKeyOffOnReset:  // 0x02
            // For all three ?real? resets we schedule the same way:
            srv->ecuResetScheduled = resetArgs->type;
            srv->ecuResetTimer     = UDSMillis() + 500;  // 500 ms delay
            return UDS_PositiveResponse;

        default:
            return UDS_NRC_SubFunctionNotSupported;
    }
}

#define ROUTINE_ID_LED_BLINK  0x0101
#define ROUTINE_ID_PARTITION_SWAP  0x0201

static bool led_blinking = false;

void start_led_blink() {
    led_blinking = true;
  
    IO_RE14_Toggle();
  
     
}

void stop_led_blink() {
    led_blinking = false;
    IO_RE14_SetLow();
}

bool is_led_blinking() {
    return led_blinking;
}
static void SwitchActivePartition(UDSServer_t *srv, uint8_t partitionId)
{
    if (partitionId == 2u)
    {
        NVMCONbits.P2ACTIV = 1;
    }
    else
    {
        NVMCONbits.P2ACTIV = 0;
    }

    srv->ecuResetScheduled = kHardReset;
    srv->ecuResetTimer = UDSMillis() + 100;
}


UDSErr_t uds_handle_routine_control(UDSServer_t *srv,const UDSRoutineCtrlArgs_t *args){
     if (srv->sessionType != kProgrammingSession && 
             srv->sessionType != kExtendedDiagnostic) {
         
        return UDS_NRC_SubFunctionNotSupported;
    }
     
if (args->id == ROUTINE_ID_LED_BLINK ) {  // e.g., LED Blink routine
        switch (args->ctrlType) {
            case kStartRoutine:
                start_led_blink(); // your custom logic
                return UDS_PositiveResponse;

            case kStopRoutine:
                stop_led_blink();
                return UDS_PositiveResponse;

            case kRequestRoutineResults: {
                uint8_t status = is_led_blinking() ? 0x01 : 0x00;
                return args->copyStatusRecord(srv, &status, 1);
            }

            default:
                return UDS_NRC_SubFunctionNotSupported;
        }
}
     
      if (args->id == ROUTINE_ID_PARTITION_SWAP) {
        if (args->ctrlType != kStartRoutine)
        {
            return UDS_NRC_SubFunctionNotSupported;
        }
         if (!args->optionRecord || args->len < 1)
        {
            return UDS_NRC_IncorrectMessageLengthOrInvalidFormat;
        }
        
    uint8_t newPart = args->optionRecord[0];
        if (newPart != 1u && newPart != 2u)
        {
            return UDS_NRC_RequestOutOfRange;
        }

        SwitchActivePartition(srv, newPart);
        return UDS_PositiveResponse;
    }

    return UDS_NRC_RequestOutOfRange;
}


  
UDSErr_t uds_handle_rdbi(UDSServer_t *srv, const UDSRDBIArgs_t *rdbi) {
    if (!rdbi || !rdbi->copy || !srv) {
        return UDS_NRC_GeneralReject;
    }

    switch(rdbi->dataId) {
        case 0xF190: {
            return rdbi->copy(srv, vinw, sizeof(vinw));
        }
         case 0xF1A0: {
            uint8_t partition_id = (NVMCONbits.P2ACTIV) ? 2 : 1;
            return rdbi->copy(srv, &partition_id, 1);
        }
        default:
            return UDS_NRC_RequestOutOfRange;
    }
}
 
 UDSErr_t uds_handle_wdbi(UDSServer_t *srv, const UDSWDBIArgs_t *wdbi) {
    // only allow in programming session or above
    if ( srv->sessionType < kProgrammingSession) {
        return UDS_NRC_SubFunctionNotSupported;
    }
    if (!wdbi || !wdbi->data) {
        return UDS_NRC_GeneralReject;
    }

    switch (wdbi->dataId) {
        case 0xF190: {
            // e.g. use incoming bytes as the new VIN (but must be 17 bytes)
            if (wdbi->len != VIN_LEN) {
                return UDS_NRC_IncorrectMessageLengthOrInvalidFormat;
            }
            // copy into your non-const storage
            memcpy(vinw, wdbi->data, VIN_LEN);
            return UDS_PositiveResponse;
        }
        case 0xF1A0: {
            if (wdbi->len != 1) {
                return UDS_NRC_IncorrectMessageLengthOrInvalidFormat;
            }
            uint8_t newPart = wdbi->data[0];
            if (newPart != 1u && newPart != 2u) {
                return UDS_NRC_RequestOutOfRange;
            }
            SwitchActivePartition(srv, newPart);
            return UDS_PositiveResponse;
        }
        // handle other IDs here...
        default:
            return UDS_NRC_RequestOutOfRange;
    }
}

 
static bool IsUpdateRequired(void)
{
    bool downloadVersionPresent;
    bool downloadImageValid;
    uint32_t downloadVersion;

    bool executionVersionPresent;
    uint32_t executionVersion;

    bool updateRequired = false;

    executionVersionPresent = BOOT_VersionNumberGet(EXECUTION_IMAGE, &executionVersion);
    downloadVersionPresent = BOOT_VersionNumberGet(DOWNLOADED_IMAGE, &downloadVersion);

    downloadImageValid = BOOT_ImageVerify(DOWNLOADED_IMAGE);
    executionImageValid = BOOT_ImageVerify(EXECUTION_IMAGE);

    /* We don't need to validate the execution image unless we update it. */
    executionImageRequiresValidation = false;

    if(downloadImageValid == true)
    {
        if(executionImageValid == false)
        {
                /* the download image is valid and
                 * the execution image is not valid = update. In this case we don't
                 * care about the version numbers since the download image is the
                 * only valid image available. */
                updateRequired = true;
            }
            else
            {
            if(downloadVersionPresent == true )
            {
                if(executionVersionPresent == true)
                {
                    if(downloadVersion > executionVersion)
                    {
                        /* both images are valid, both have version numbers, and
                         * the download has a newer version number = update */
                        updateRequired = true;
                    }
                }
                else
                {
                    /* both images are valid, the download has a version number,
                     * the executable does not (legacy - thus older) = update*/
                    updateRequired = true;
                }
            }
        }
    }

    return updateRequired;
}

static void UpdateFromDownload(void)
{
    BOOT_CopyUnlock();
    if( IsUpdateRequired() == true )
    {
        /* We've updated the application image and now it needs to be copied to the execution space.
           It needs to be re-verified after being copied. */
        executionImageRequiresValidation = true;

        BOOT_ImageCopy(EXECUTION_IMAGE, DOWNLOADED_IMAGE);
    }
    BOOT_CopyLock();
}


void BOOT_DEMO_Initialize(void)
{    
 UDSISOTpCInit(&isotp_tp, &isotp_config);
 UDSServerInit(&server);
 server.tp = &isotp_tp.hdl;
 server.fn = uds_callback;  
}


void BOOT_DEMO_Tasks(void)
{
     static unsigned int counter=0;

    if((counter++ % 0x8000)==0){
            IO_RE13_Toggle();
        }
    
        if (CAN1.Receive(&rxMsg)){
       // PrintCanMsgObjStruct(&rxMsg);
    // Route the frame to the appropriate ISO-TP link (physical or functional)
       if (rxMsg.msgId == isotp_tp.phys_ta) {
           // printf("[ISO-TP] -> Processing physical addressing\r\n");
            isotp_on_can_message(&isotp_tp.phys_link, rxMsg.data, rxMsg.field.dlc);
        } else if (rxMsg.msgId == isotp_tp.func_ta &&
                   isotp_tp.phys_link.receive_status == ISOTP_RECEIVE_STATUS_IDLE) {
            //printf("[ISO-TP] -> Processing functional addressing\r\n");
            isotp_on_can_message(&isotp_tp.func_link, rxMsg.data, rxMsg.field.dlc);
        }
        }
           UDSServerPoll(&server);  
     
    
    if(inBootloadMode == false)
    {
        if( EnterBootloadMode() == true )
        {
            inBootloadMode = true;
        }
        else
        {
               UpdateFromDownload();
            if( executionImageRequiresValidation == true )
            {
                executionImageValid = BOOT_ImageVerify(EXECUTION_IMAGE);
            }

            if(executionImageValid == false)
            {
                inBootloadMode = true;
            }

         if(inBootloadMode == false)
           {
                /* NOTE: Return all interrupt bits to their reset state before
                 * starting an application image. DO NOT disable the global 
                 * interrupt bit. All interrupt bits must be returned to their
                 * reset state.  The global interrupt enable bit resets to
                 * enabled, so should be returned to enabled before starting an
                 * application.  Most peripheral interrupt bits are disabled on
                 * reset.  All of these should be disabled before starting the 
                 * application.  Keep in mind that some software stacks may
                 * pull in and enable additional peripherals (e.g. - timers).  
                 */

                /* NOTE: Disable all peripherals before starting the application.
                 * Any peripheral left running could cause interrupt flags or bits
                 * to be set before the application software is initialized and
                 * can lead to unexpected system issues.
                 */

                #warning "Return device to reset state before starting the application.  Click on this warning for additional information to consider."
				 
               BOOT_StartApplication();
           }
        }
   }
    
   (void)BOOT_ProcessCommand();
}

static bool EnterBootloadMode(void)
{
    #warning "Update this function to return 'true' when you want to stay in the boot loader, and 'false' when you want to allow a release to the application code"
 
    /* NOTE: This might be a a push button status on power up, a command from a peripheral, 
     * or whatever is specific to your boot loader implementation */    
 // If button is pressed (RE13 low), jump to application
    if (IO_RE9_GetValue() == 0)  
    {
        return false;   // Don't stay in bootloader ? run app
    }

   
    //return(IO_RE13_GetValue()==0);
    return true;
}
