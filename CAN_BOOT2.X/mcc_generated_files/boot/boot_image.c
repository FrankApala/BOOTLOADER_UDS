/**
 * Generated 16-bit Bootloader Source File
 * 
 * @file     boot_image.c
 * 
 * @brief    Boot loader file responsible for handling addressing application
 *           image(s).
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

#include <stdint.h>
#include <stdbool.h>
#include <string.h>

#include "../flash/flash.h" 
#include "boot_private.h"
#include "boot_image.h"
#include "boot_config.h"


struct IMAGE {
    uint32_t startAddress;
};

const static struct IMAGE images[] = 
{
    {
        .startAddress = 0xC000
    },
};

#define FLASH_ERASE_MASK32 (~((FLASH_ERASE_PAGE_SIZE_IN_INSTRUCTIONS*2UL) - 1)) 

static bool IsLegalAddress(uint32_t addressToCheck)
{
   return ( (addressToCheck >= EXECUTABLE_IMAGE_FIRST_ADDRESS) && (addressToCheck <= EXECUTABLE_IMAGE_LAST_ADDRESS) );
}


bool IsLegalRange(uint32_t startRangeToCheck, uint32_t endRangeToCheck)
{
    return ( IsLegalAddress(startRangeToCheck) && IsLegalAddress(endRangeToCheck - 2u) );
}


NVM_RETURN_STATUS BOOT_BlockWrite(uint32_t deviceAddress, uint32_t lengthInBytes, uint8_t *sourceData, uint32_t key)
{
    uint32_t count = 0;
    enum NVM_RETURN_STATUS response = NVM_SUCCESS;
    
    if ((lengthInBytes % MINIMUM_WRITE_BLOCK_SIZE) == 0u)
    {
        if ( IsLegalRange(deviceAddress, deviceAddress + (lengthInBytes/2u)) ) 
        {

            for (count = 0; count < lengthInBytes; count += MINIMUM_WRITE_BLOCK_SIZE)
            {
                uint32_t flashData[MINIMUM_WRITE_BLOCK_SIZE/sizeof(uint32_t)];
                uint32_t physicalWriteAddress = BOOT_ImageAddressGet(DOWNLOAD_IMAGE_NUMBER, deviceAddress + (count/2u));

                memcpy(&flashData[0], &sourceData[count], MINIMUM_WRITE_BLOCK_SIZE);
                if (FLASH_WordWrite(physicalWriteAddress, flashData, key) != FLASH_NO_ERROR)
                {
                    response = NVM_WRITE_ERROR;
                    break;
                }
            }
        }
        else
        {
            response = NVM_INVALID_ADDRESS;
        }
    }
    else
    {
        response = NVM_INVALID_LENGTH;
    }
    
    return response;
}

NVM_RETURN_STATUS BOOT_BlockRead (uint8_t *destinationData, uint32_t lengthInBytes, uint32_t nvmAddress)
{
    uint32_t count;
    uint32_t flashData;
    enum NVM_RETURN_STATUS response = NVM_SUCCESS;
    
    if ((lengthInBytes % 4u) == 0u)
    {
        if (IsLegalRange(nvmAddress, nvmAddress + (lengthInBytes/2u))) 
        {
            for (count = 0u; count < lengthInBytes; count += 4u)
                {
                    uint32_t physicalReadAddress = BOOT_ImageAddressGet(DOWNLOAD_IMAGE_NUMBER, nvmAddress + (count/2u));
                    FLASH_Read(physicalReadAddress, 1, &flashData);
                    memcpy(&destinationData[count], &flashData, 4u);
                }
        }
        else
        {
            response = NVM_INVALID_ADDRESS;
        }
    } else
    {
        response = NVM_INVALID_LENGTH;
    }
 
    return response;
}


NVM_RETURN_STATUS BOOT_BlockErase (uint32_t nvmAddress, uint32_t lengthInPages, uint32_t key)
{
    enum NVM_RETURN_STATUS lastResponse = NVM_SUCCESS;
    uint32_t eraseAddress = nvmAddress;
    
    // check to make sure page is aligned here.
    if ( (eraseAddress & FLASH_ERASE_MASK32) != eraseAddress)
    {
        lastResponse = NVM_INVALID_ADDRESS;
    }
    
    #define ERASE_SIZE_REQUESTED ((uint32_t)(lengthInPages) * FLASH_ERASE_PAGE_SIZE_IN_PC_UNITS)

    while ((lastResponse == NVM_SUCCESS) && (eraseAddress < (nvmAddress +  ERASE_SIZE_REQUESTED ) ))
    {
        if (IsLegalRange(eraseAddress, eraseAddress+FLASH_ERASE_PAGE_SIZE_IN_PC_UNITS))  
        {
            uint32_t physicalEraseAddress = BOOT_ImageAddressGet(DOWNLOAD_IMAGE_NUMBER, eraseAddress);
            if ( FLASH_PageErase(physicalEraseAddress,  key) != FLASH_NO_ERROR)
            {
                lastResponse = NVM_INVALID_ADDRESS;
            }
            eraseAddress += FLASH_ERASE_PAGE_SIZE_IN_PC_UNITS;
        }
        else
        {
            lastResponse = NVM_INVALID_ADDRESS;
        }
    }

    if ((lastResponse != NVM_SUCCESS) || (eraseAddress != (nvmAddress + ERASE_SIZE_REQUESTED)))
    {
        lastResponse = NVM_INVALID_ADDRESS;
    } 
    
    return lastResponse;
}

uint32_t BOOT_ImageAddressGet(enum BOOT_IMAGE image, uint32_t addressInExecutableImage)
{
    uint32_t offset = addressInExecutableImage - images[BOOT_IMAGE_0].startAddress;
    return images[image].startAddress + offset;
}

uint16_t BOOT_EraseSizeGet()
{
    return (FLASH_ERASE_PAGE_SIZE_IN_INSTRUCTIONS * 2u);
}

NVM_RETURN_STATUS BOOT_Read32Data (uint32_t *destinationData,  uint32_t nvmAddress)
{
    uint32_t flashData;

    FLASH_Read(nvmAddress, 1, &flashData);
    *destinationData = flashData & 0xFFFFu;

    FLASH_Read(nvmAddress + 2, 1, &flashData);
    *destinationData += (flashData & 0xFFFFu) << 16;
    
   
    return NVM_SUCCESS;
}

NVM_RETURN_STATUS BOOT_Read16Data (uint16_t *destinationData,  uint32_t nvmAddress)
{
    uint32_t flashData;

    FLASH_Read(nvmAddress, 1, &flashData);
    *destinationData = flashData & 0xFFFFu;

    return NVM_SUCCESS;
}


