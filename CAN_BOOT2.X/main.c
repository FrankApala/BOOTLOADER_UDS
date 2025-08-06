/*
© [2025] Microchip Technology Inc. and its subsidiaries.

    Subject to your compliance with these terms, you may use Microchip 
    software and any derivatives exclusively with Microchip products. 
    You are responsible for complying with 3rd party license terms  
    applicable to your use of 3rd party software (including open source  
    software) that may accompany Microchip software. SOFTWARE IS ?AS IS.? 
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

#define FCY 40000000UL  // Par exemple pour 40 MHz
#include <libpic30.h>
#include <xc.h>

#include "mcc_generated_files/boot/boot_demo.h"
#include "mcc_generated_files/system/system.h"
#include "mcc_generated_files/can/can1.h"
#include "mcc_generated_files/timer/sccp2.h"
#include "mcc_generated_files/system/pins.h"

/*
    Main application
*/
char* itoa(int num, char* str, int base);
void UART1_WriteString(const char *str);
static void PrintDemoFeaturesMessage(void);
static uint8_t CAN_DlcToDataBytesGet(const enum CAN_DLC dlc);
static void printCanDatainHex(struct CAN_MSG_OBJ *rxCanMsg);
static void PrintCanMsgObjStruct(struct CAN_MSG_OBJ *rxCanMsg);


int main(void)

{  
    SYSTEM_Initialize();
    BOOT_DEMO_Initialize();
    
        for (int i = 0; i < 3; i++)
    {
        IO_RE14_SetHigh();
        __delay_ms(200);
        IO_RE14_SetLow();
        __delay_ms(200);
    }

 uint8_t txData[8] = {0x55, 0xAA, 0x55, 0xAA, 0x55, 0xAA, 0x55, 0xAA};

struct CAN_MSG_OBJ canMsg, rxMsg;
  
canMsg.msgId=0x55;
canMsg.field.idType=CAN_FRAME_STD;
canMsg.field.dlc=DLC_8;
canMsg.field.frameType=CAN_FRAME_DATA;
canMsg.field.brs=CAN_NON_BRS_MODE;
canMsg.field.formatType= CAN_2_0_FORMAT;

canMsg.data=txData; 


 
CAN1.Transmit(CAN1_TXQ, &canMsg);
      while(1)
    
    {
        BOOT_DEMO_Tasks();
      }


 
    }    



        
volatile uint32_t system_millis=0;

void __attribute__ ( ( interrupt, no_auto_psv ) ) _CCT2Interrupt (void)
{
   
   system_millis++;
    IFS1bits.CCT2IF = 0;
}




void __attribute__((__interrupt__, no_auto_psv)) _C1RXInterrupt(void)
{
  

    // Clear RX interrupt flags
   C1INTLbits.RXIF = 0;
    IFS1bits.C1RXIF = 0;

    //Optionally disable interrupts if processing will take time
    C1INTHbits.RXIE = 0;
    IEC1bits.C1RXIE = 0;
    C1FIFOCON1Lbits.TFNRFNIE = 0;
}




/*==============================================================================
  Helper Functions (itoa, UART1_WriteString, CAN print?)
==============================================================================*/

char* itoa(int num, char* str, int base) {
    int i = 0;
    int isNegative = 0;

    if (num == 0) {
        str[i++] = '0';
        str[i] = '\0';
        return str;
    }

    if (num < 0 && base == 10) {
        isNegative = 1;
        num = -num;
    }

    while (num != 0) {
        int rem = num % base;
        str[i++] = (rem > 9) ? (rem - 10) + 'a' : rem + '0';
        num /= base;
    }

    if (isNegative)
        str[i++] = '-';

    str[i] = '\0';

    // Reverse
    for (int start = 0, end = i - 1; start < end; start++, end--) {
        char temp = str[start];
        str[start] = str[end];
        str[end] = temp;
    }

    return str;
}

void UART1_WriteString(const char *str)
{
    while (*str != '\0') {
        UART1_Write(*str++);
    }
}
static void PrintDemoFeaturesMessage(void)
{
    printf("\r\n");
    printf("*******************************************************\r\n");
    printf("dsPIC33CK Curiosity CAN 2.0 Demo\r\n");
    printf("*******************************************************\r\n");
    
    printf("* CAN-2.0 communication using the on-chip CAN peripheral in dsPIC33CK256MP508\r\n");
    printf("* Loopback CAN data frame if received  message ID is 0x64 or 0x65 from the bus\r\n");
    printf("* Green LED will blink if data message  with 0x64 or 0x65 is received and\r\n transmitted back successfully\r\n\r\n");

}

static uint8_t CAN_DlcToDataBytesGet(const enum CAN_DLC dlc)
{
    static const uint8_t dlcByteSize[] = {0U, 1U, 2U, 3U, 4U, 5U, 6U, 7U, 8U, 12U, 16U, 20U, 24U, 32U, 48U, 64U};
    return dlcByteSize[dlc];
}

static void printCanDatainHex(struct CAN_MSG_OBJ *rxCanMsg)
{
    uint8_t i=0;
    for(i=0;i<CAN_DlcToDataBytesGet(rxCanMsg->field.dlc);i++)
    {
        printf("0x%X ",rxCanMsg->data[i]);
    }
    printf("\r\n");
}

static void PrintCanMsgObjStruct(struct CAN_MSG_OBJ *rxCanMsg)
{
    printf("------------------------------------------------------------------\r\n");
    printf("[*] Msg ID: 0x%lX\r\n", rxCanMsg->msgId);
    printf("[*] Msg Data:");
    printCanDatainHex(rxCanMsg);
    printf("[*] DLC: 0x%X\r\n", CAN_DlcToDataBytesGet(rxCanMsg->field.dlc));
    printf("[*] IdType: %s\r\n", rxCanMsg->field.idType == CAN_FRAME_STD ? "CAN_FRAME_STD" : "CAN_FRAME_EXT");
    printf("[*] FrameType: %s\r\n", rxCanMsg->field.frameType == CAN_FRAME_DATA ? "CAN_FRAME_DATA" : "CAN_FRAME_RTR");
    printf("[*] FormateType: %s\r\n", rxCanMsg->field.formatType == CAN_2_0_FORMAT ? "CAN_2_0_FORMAT" : "CAN_FD_FORMAT");
    printf("------------------------------------------------------------------\r\n");
}

