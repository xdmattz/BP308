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
#include "ToolCmds.h"
// #include "SerMessages.h"

uint8 SerRespMsg[32];

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

SER_CMD(TC_StatusCmd)
{
    UNUSED_ARG(SerMsg);
    // get the status
    uint16 status = ToolStatusQuery();
    // format a serial message to send back to KFLOP
    SerRespMsg[0] = TC_STATUS_QUERY;
    SerRespMsg[1] = (uint8) (status >> 8);  // put the two bytes into the SerRespMsg buffer
    SerRespMsg[2] = (uint8) status;
    SerResponseMsg(3, SerRespMsg);          // send the message
    return 0;
}

SER_CMD(TC_Arm_Cmd)
{
    // get the argument
    uint8 arg = SerMsg[DATA_INDEX];
    Arm_Cmd(arg);    
    return 0;
}

SER_CMD(TC_Carousel_Cmd)
{
    uint8 arg = SerMsg[DATA_INDEX];
    Carousel_Cmd(arg);
    return 0;
}

SER_CMD(TC_Clamp_Cmd)
{
    uint8 arg = SerMsg[DATA_INDEX];
    Clamp_Cmd(arg);
    return 0;
}

SER_CMD(TC_Home_Cmd)
{
    uint8 arg = SerMsg[DATA_INDEX];
    Home_Cmd(arg);
    return 0;
}

SER_CMD(TC_Brake_Cmd)
{
    uint8 arg = SerMsg[DATA_INDEX];
    SBrake_Cmd(arg);
    return 0;
}
/* [] END OF FILE */
