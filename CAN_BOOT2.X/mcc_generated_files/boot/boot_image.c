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
        .startAddress = 0xD000
    },
    {
        .startAddress = 0x1C000
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


/* 
 * Copy keys used to unlock the flash write/erase operations.  Two keys are used
 * so that invalid jumps (due to bad code, miss-execution, etc.) have a lowered
 * risk of being able to perform the write/erase operation.  See the 
 * "Flash Erase/Write Operation Security" in the help file located in the 
 * MCC: Bootloader-16: Bootloader module for more details about how these two 
 * keys are used to reduce risk of invalid flash writes/erases.
 */
#define COPY_KEY_PART_1 (FLASH_UNLOCK_KEY + COPY_KEY_PART_2)
#define COPY_KEY_PART_2 (0x91C2B473u)
#define COPY_KEY_LOCK   (0u)

static volatile uint32_t copyKey = COPY_KEY_LOCK;



void BOOT_CopyLock(void)
{
    copyKey = COPY_KEY_LOCK;
}

void BOOT_CopyUnlock(void)
{
    copyKey = COPY_KEY_PART_1;
}

static bool EraseImage(uint32_t imageAddress, uint32_t key)
{
    uint32_t dataOffset;
    bool status = true;

    for(dataOffset=0; dataOffset<BOOT_IMAGE_SIZE; dataOffset+=FLASH_ERASE_PAGE_SIZE_IN_PC_UNITS)
    {
        if (FLASH_PageErase(imageAddress + dataOffset, key) != FLASH_NO_ERROR)
        {
            status = false;
            break;
        }
    }

    return status;
}

static bool ImageDataCopy(uint32_t imageAddressTo, uint32_t imageAddressFrom, uint32_t key)
{
    uint32_t instructionToCopy[MINIMUM_WRITE_BLOCK_SIZE/sizeof(uint32_t)];
    uint32_t dataOffset;
    bool status = true;

    for(dataOffset=0; dataOffset<BOOT_IMAGE_SIZE; dataOffset+=(MINIMUM_WRITE_BLOCK_SIZE/2))
    {
        FLASH_Read(imageAddressFrom + dataOffset, 1, instructionToCopy);
        FLASH_Read(imageAddressFrom + dataOffset + 2, 1, &instructionToCopy[1]);
        if ( FLASH_WordWrite(imageAddressTo + dataOffset, instructionToCopy, key) != FLASH_NO_ERROR)
        {
            status = false;
            break;
        }
    }

    return status;
}

bool BOOT_ImageCopy(enum BOOT_IMAGE destinationImage, enum BOOT_IMAGE sourceImage)
{
    bool status;

    if((sourceImage >= BOOT_IMAGE_COUNT) || 
       (destinationImage >= BOOT_IMAGE_COUNT) ||
       (sourceImage == destinationImage))
    {
        status = false;
    }
    else
    {
        status = EraseImage(images[destinationImage].startAddress, copyKey - COPY_KEY_PART_2);
        if(status == true)
        {
            status = ImageDataCopy(images[destinationImage].startAddress, images[sourceImage].startAddress, copyKey - COPY_KEY_PART_2);
        }
    }

    return status;
}

bool BOOT_ImageErase(enum BOOT_IMAGE image)
{
    bool status;

    if(image >= BOOT_IMAGE_COUNT)
    {
        status = false;
    }
    else
    {
        status = EraseImage(images[image].startAddress, copyKey - COPY_KEY_PART_2);
    }

    return status;
}
