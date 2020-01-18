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
#include "project.h"

#define USBFS_DEVICE 0

CY_ISR(Blink_Isr)
{
    Timer_1_ReadStatusRegister();   // clear the interrupt
    Pin_LED_Write(~(Pin_LED_Read()));    // toggle the LED
}

int main(void)
{
    CyGlobalIntEnable; /* Enable global interrupts. */
    isr_Blink_StartEx(Blink_Isr);
    Timer_1_Start();    // start the timer
    
    USBFS_Start(USBFS_DEVICE, USBFS_5V_OPERATION);

    /* Place your initialization/startup code here (e.g. MyInst_Start()) */
    // set all the port bits low
    Pins_Port3_DR = 0;  
    Bootloader_Start();
    for(;;)
    {
        /* Place your application code here. */
    }
}

/* [] END OF FILE */
