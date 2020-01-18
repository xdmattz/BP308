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

#include "U_HW.h"
#include "CLI.h"
#include "State_Machine.h"
#include "Serial.h"



int main(void)
{
 
    Init_HW();
   
    Init_StateMachine();
    
    CyGlobalIntEnable; /* Enable global interrupts. */
    Init_CLI();
    
    Init_MPG();
    
    SerialStartup();
    
    for(;;)
    {
        CLI();
        Serial_Rx();        
        State_Machine();
        //CyWdtClear();   // clear the watchdog
    }
}

/* [] END OF FILE */
