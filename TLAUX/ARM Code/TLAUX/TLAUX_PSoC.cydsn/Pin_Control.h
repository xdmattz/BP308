/* ========================================
 *
 * Copyright YOUR COMPANY, THE YEAR
 * All Rights Reserved
 * UNPUBLISHED, LICENSED SOFTWARE.
 *
 * CONFIDENTIAL AND PROPRIETARY INFORMATION
 * WHICH IS THE PROPERTY OF your company.
 *
 * ========================================
*/
#ifndef PIN_CONTROL_H
#define PIN_CONTROL_H
    
#include <cytypes.h>

// new definitions for setting, clearing and toggling pins for PSOC4     
//     
#define CY_SYS_PINS_SET_PINX(portDR, pin) ( *(reg32 *)(portDR + 0x40) = (CY_SYS_PINS_PC_DATAOUT << (pin)) )    
#define CY_SYS_PINS_CLEAR_PINX(portDR, pin) ( *(reg32 *)(portDR + 0x44) = (CY_SYS_PINS_PC_DATAOUT << (pin)) )
#define CY_SYS_PINS_TOGGLE_PINX(portDR, pin) ( *(reg32 *)(portDR + 0x48) = (CY_SYS_PINS_PC_DATAOUT << (pin)) )  

#define CY_SYS_PINS_SET_PINS(portDR, pins) ( *(reg32 *)(portDR + 0x40) = (pins) )    
#define CY_SYS_PINS_CLEAR_PINS(portDR, pins) ( *(reg32 *)(portDR + 0x44) = (pins) )
#define CY_SYS_PINS_TOGGLE_PINS(portDR, pins) ( *(reg32 *)(portDR + 0x48) = (pins) )  
    
    
#endif    

/* [] END OF FILE */
