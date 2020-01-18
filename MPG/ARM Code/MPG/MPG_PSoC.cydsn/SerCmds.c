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

#include "SerCmds.h"
#include "Serial_IO.h"
#include "Serial.h"
#include "MPGCmds.h"
// #include "SerMessages.h"

uint8 SerRespMsg[32];

uint32 volatile StatusMSGTime;

extern volatile uint32 MS_Time;

SER_CMD(CmdFunctionName1)
{
    if(SerMsg[CNT_INDEX] != 0)
    {
//        SER_PutStr((uint8 *)"Function 1\r");        // write a text message
        for(uint8_t i = DATA_INDEX; i <= SerMsg[CNT_INDEX]; i++)
        {
            SER_PutChar(SerMsg[i]);
        }
        SER_PutChar('\r');
        return 1;
    }
    return 0;
}

SER_CMD(CmdFunctionName2)
{
    if(SerMsg[CNT_INDEX] != 0)
    {
//        SER_PutStr((uint8 *)"Function 2\r");        // write a text message
        for(uint8_t i = DATA_INDEX; i <= SerMsg[CNT_INDEX]; i++)
        {
            SER_PutChar(SerMsg[i]);
        }
        SER_PutChar('\r');
        return 1;
    }
    return 0;
}

SER_CMD(MPG_StatusCmd)
{
    UNUSED_ARG(SerMsg);
    // get the status
    uint16 status = MPGStatusQuery();
    // format a serial message to send back to KFLOP
    SerRespMsg[0] = MPG_STATUS_QUERY;
    SerRespMsg[1] = (uint8) (status >> 8);  // put the two bytes into the SerRespMsg buffer
    SerRespMsg[2] = (uint8) status;
    SerResponseMsg(3, SerRespMsg);          // send the message
    
    StatusMSGTime = MS_Time;
    
    
    return 0;
}


/* [] END OF FILE */
