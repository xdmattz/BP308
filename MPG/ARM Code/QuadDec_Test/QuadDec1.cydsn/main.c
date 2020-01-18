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

static volatile uint8 OutMPG_Cnt;

CY_ISR(Inc1_ISR)
{
    OutMPG_Cnt++;
    Control_Reg_1_Write(OutMPG_Cnt);
       
}

CY_ISR(Dec1_ISR)
{
    OutMPG_Cnt--;
    Control_Reg_1_Write(OutMPG_Cnt);
}

int main(void)
{
    
    OutMPG_Cnt = 0;
    isr_Inc1_StartEx(Inc1_ISR);
    isr_Dec1_StartEx(Dec1_ISR);
    
    CyGlobalIntEnable; /* Enable global interrupts. */

    /* Place your initialization/startup code here (e.g. MyInst_Start()) */

    for(;;)
    {
        /* Place your application code here. */
    }
}

/* [] END OF FILE */
