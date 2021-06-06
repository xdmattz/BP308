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
#include "Serial.h"
#include "project.h"
#include "U_HW.h"
#include <stdio.h>
#include <stdbool.h>
#include "Serial_IO.h"
#include "SerMessages.h"


char msgs[50];

uint8 SerMsg[SERIAL_MSG_LEN];

void Serial_Rx(void)
{
    static uint8 MsgCounter = 0;
    static uint8 MsgCnt = 0;
    uint8 rc;
    if(UART_GetRxBufferSize() != 0)
    {
        rc = UART_ReadRxData();
        // use the MsgCounter to manage the message reception / a non-zero MsgCounter means that we are in a message
        if(MsgCounter == 0)
        {
            if(rc == MSG_START_CMD)     // check for a command start
            {
                MsgCounter = 1;
            }
        }
       else if (MsgCounter == 1)
        {
            MsgCnt = rc;    // get the message count - first byte in the message
            if(MsgCnt >= SERIAL_MSG_LEN)
            {   

                MsgCounter = 0; // MsgCount too big! restart the message - reset the message counter
            } 
            else
            {
                SerMsg[MsgCounter++] = rc;
            }
         }   
        else if(MsgCounter < MsgCnt)
        {
            SerMsg[MsgCounter++] = rc;  // get the message content and put it in the SerMsg buffer
        }
        else if (MsgCounter == MsgCnt)
        {
            SerMsg[MsgCounter] = rc;    // get the checksum
            if(SerMsgParse() == false)  // Parse the message
            {
            }
            MsgCounter = 0; // reset the Message Counter 
        }
        else
        {
            MsgCounter = 0;
        }
    }
}

bool SerMsgParse(void)
{
    uint8 checksum = 0;
    uint8 MsgLen = SerMsg[CNT_INDEX];   // get the message length
    // check the checksum
    for(uint8 i = 1; i < MsgLen; i++)
    {
        checksum += SerMsg[i];  // sum up the message
    }
    checksum = ~checksum;
    if(SerMsg[MsgLen] != checksum)   
    {
        // if the checksum is wrong then return false
        sprintf(msgs, "Bad CheckSum = %X Should Be %X\r", checksum, ~(SerMsg[MsgLen])); 
        PutStr(msgs);
        return false;
    }
    if(SerMsg[ADDR_INDEX] == MY_SLAVE_ADDR)
    {
        for(uint8 i = 0; i < NUMOFSERCMDS; i++)   // scan through the command list
        {
            if(SerMsg[CMD_INDEX] == SerCmdParseTable[i].Cmd)
            {
                if( SerCmdParseTable[i].func(SerMsg) == 0)
                {
                    return true;
                }
            }
        }
        return true;
    }
    return false;
}


void SerialStartup(void)
{
 //   SER_PutStr((uint8 *)"\rSerial Is Working!\r");
}


void SerResponseMsg(uint8 cnt, uint8 *msg)
{
    uint8 checksum = 0;
    // assemble the return message
    SER_PutChar(MSG_RESP_CMD);
    checksum = cnt + SER_MSG_OVERHEAD;
    SER_PutChar(cnt + SER_MSG_OVERHEAD);
    checksum += MY_SLAVE_ADDR;
    SER_PutChar(MY_SLAVE_ADDR);
    for(uint8 i = 0; i < cnt; i++)
    {
        checksum += msg[i];     // send the data
        SER_PutChar(msg[i]);
    }
    SER_PutChar(~(checksum));   // followed by the checksum.
    SER_PutChar(0x00);
}

// Serial Commands

/* [] END OF FILE */
