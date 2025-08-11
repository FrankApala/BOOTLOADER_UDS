/**
 * PINS Generated Driver Header File 
 * 
 * @file      pins.h
 *            
 * @defgroup  pinsdriver Pins Driver
 *            
 * @brief     The Pin Driver directs the operation and function of 
 *            the selected device pins using dsPIC MCUs.
 *
 * @skipline @version   Firmware Driver Version 1.0.2
 *
 * @skipline @version   PLIB Version 1.3.1
 *
 * @skipline  Device : dsPIC33CK256MP508
*/

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

#ifndef PINS_H
#define PINS_H
// Section: Includes
#include <xc.h>

// Section: Device Pin Macros

/**
 * @ingroup  pinsdriver
 * @brief    Sets the RE5 GPIO Pin which has a custom name of IO_RE5 to High
 * @pre      The RE5 must be set as Output Pin             
 * @param    none
 * @return   none  
 */
#define IO_RE5_SetHigh()          (_LATE5 = 1)

/**
 * @ingroup  pinsdriver
 * @brief    Sets the RE5 GPIO Pin which has a custom name of IO_RE5 to Low
 * @pre      The RE5 must be set as Output Pin
 * @param    none
 * @return   none  
 */
#define IO_RE5_SetLow()           (_LATE5 = 0)

/**
 * @ingroup  pinsdriver
 * @brief    Toggles the RE5 GPIO Pin which has a custom name of IO_RE5
 * @pre      The RE5 must be set as Output Pin
 * @param    none
 * @return   none  
 */
#define IO_RE5_Toggle()           (_LATE5 ^= 1)

/**
 * @ingroup  pinsdriver
 * @brief    Reads the value of the RE5 GPIO Pin which has a custom name of IO_RE5
 * @param    none
 * @return   none  
 */
#define IO_RE5_GetValue()         _RE5

/**
 * @ingroup  pinsdriver
 * @brief    Configures the RE5 GPIO Pin which has a custom name of IO_RE5 as Input
 * @param    none
 * @return   none  
 */
#define IO_RE5_SetDigitalInput()  (_TRISE5 = 1)

/**
 * @ingroup  pinsdriver
 * @brief    Configures the RE5 GPIO Pin which has a custom name of IO_RE5 as Output
 * @param    none
 * @return   none  
 */
#define IO_RE5_SetDigitalOutput() (_TRISE5 = 0)

/**
 * @ingroup  pinsdriver
 * @brief    Sets the RE9 GPIO Pin which has a custom name of IO_RE9 to High
 * @pre      The RE9 must be set as Output Pin             
 * @param    none
 * @return   none  
 */
#define IO_RE9_SetHigh()          (_LATE9 = 1)

/**
 * @ingroup  pinsdriver
 * @brief    Sets the RE9 GPIO Pin which has a custom name of IO_RE9 to Low
 * @pre      The RE9 must be set as Output Pin
 * @param    none
 * @return   none  
 */
#define IO_RE9_SetLow()           (_LATE9 = 0)

/**
 * @ingroup  pinsdriver
 * @brief    Toggles the RE9 GPIO Pin which has a custom name of IO_RE9
 * @pre      The RE9 must be set as Output Pin
 * @param    none
 * @return   none  
 */
#define IO_RE9_Toggle()           (_LATE9 ^= 1)

/**
 * @ingroup  pinsdriver
 * @brief    Reads the value of the RE9 GPIO Pin which has a custom name of IO_RE9
 * @param    none
 * @return   none  
 */
#define IO_RE9_GetValue()         _RE9

/**
 * @ingroup  pinsdriver
 * @brief    Configures the RE9 GPIO Pin which has a custom name of IO_RE9 as Input
 * @param    none
 * @return   none  
 */
#define IO_RE9_SetDigitalInput()  (_TRISE9 = 1)

/**
 * @ingroup  pinsdriver
 * @brief    Configures the RE9 GPIO Pin which has a custom name of IO_RE9 as Output
 * @param    none
 * @return   none  
 */
#define IO_RE9_SetDigitalOutput() (_TRISE9 = 0)

/**
 * @ingroup  pinsdriver
 * @brief    Sets the RE13 GPIO Pin which has a custom name of IO_RE13 to High
 * @pre      The RE13 must be set as Output Pin             
 * @param    none
 * @return   none  
 */
#define IO_RE13_SetHigh()          (_LATE13 = 1)

/**
 * @ingroup  pinsdriver
 * @brief    Sets the RE13 GPIO Pin which has a custom name of IO_RE13 to Low
 * @pre      The RE13 must be set as Output Pin
 * @param    none
 * @return   none  
 */
#define IO_RE13_SetLow()           (_LATE13 = 0)

/**
 * @ingroup  pinsdriver
 * @brief    Toggles the RE13 GPIO Pin which has a custom name of IO_RE13
 * @pre      The RE13 must be set as Output Pin
 * @param    none
 * @return   none  
 */
#define IO_RE13_Toggle()           (_LATE13 ^= 1)

/**
 * @ingroup  pinsdriver
 * @brief    Reads the value of the RE13 GPIO Pin which has a custom name of IO_RE13
 * @param    none
 * @return   none  
 */
#define IO_RE13_GetValue()         _RE13

/**
 * @ingroup  pinsdriver
 * @brief    Configures the RE13 GPIO Pin which has a custom name of IO_RE13 as Input
 * @param    none
 * @return   none  
 */
#define IO_RE13_SetDigitalInput()  (_TRISE13 = 1)

/**
 * @ingroup  pinsdriver
 * @brief    Configures the RE13 GPIO Pin which has a custom name of IO_RE13 as Output
 * @param    none
 * @return   none  
 */
#define IO_RE13_SetDigitalOutput() (_TRISE13 = 0)

/**
 * @ingroup  pinsdriver
 * @brief    Sets the RE14 GPIO Pin which has a custom name of IO_RE14 to High
 * @pre      The RE14 must be set as Output Pin             
 * @param    none
 * @return   none  
 */
#define IO_RE14_SetHigh()          (_LATE14 = 1)

/**
 * @ingroup  pinsdriver
 * @brief    Sets the RE14 GPIO Pin which has a custom name of IO_RE14 to Low
 * @pre      The RE14 must be set as Output Pin
 * @param    none
 * @return   none  
 */
#define IO_RE14_SetLow()           (_LATE14 = 0)

/**
 * @ingroup  pinsdriver
 * @brief    Toggles the RE14 GPIO Pin which has a custom name of IO_RE14
 * @pre      The RE14 must be set as Output Pin
 * @param    none
 * @return   none  
 */
#define IO_RE14_Toggle()           (_LATE14 ^= 1)

/**
 * @ingroup  pinsdriver
 * @brief    Reads the value of the RE14 GPIO Pin which has a custom name of IO_RE14
 * @param    none
 * @return   none  
 */
#define IO_RE14_GetValue()         _RE14

/**
 * @ingroup  pinsdriver
 * @brief    Configures the RE14 GPIO Pin which has a custom name of IO_RE14 as Input
 * @param    none
 * @return   none  
 */
#define IO_RE14_SetDigitalInput()  (_TRISE14 = 1)

/**
 * @ingroup  pinsdriver
 * @brief    Configures the RE14 GPIO Pin which has a custom name of IO_RE14 as Output
 * @param    none
 * @return   none  
 */
#define IO_RE14_SetDigitalOutput() (_TRISE14 = 0)

/**
 * @ingroup  pinsdriver
 * @brief    Initializes the PINS module
 * @param    none
 * @return   none  
 */
void PINS_Initialize(void);



#endif
