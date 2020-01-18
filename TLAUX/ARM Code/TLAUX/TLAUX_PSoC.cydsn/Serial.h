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
#ifndef SERIAL_H
#define SERIAL_H
    
#include <stdbool.h> 
#include <cytypes.h>    
#include "SerCmds.h"    


//    Communication format betwen KFLOP and Slave Serial Devices
//    Multi byte message:
//    'start' : 'Count' : 'Addr' : 'Command' : 'Data ...' : 'CheckSum'
//    'XX'  : 'XX'   : 'XX'    : 'XX'      : 'XX' 'XX' 'XX' : 'XX'
  
#define MY_SLAVE_ADDR       0x02  // address of TLAUX
    
#define MSG_START_CMD       0xE1 
#define MSG_RESP_CMD        0xE2    
#define SER_MSG_OVERHEAD    0x03    // this is the number of extra bytes in the message ie Count, Addr and Checksum

#define CNT_INDEX 1
#define ADDR_INDEX 2
#define CMD_INDEX 3
#define DATA_INDEX 4
    
#define SERIAL_MSG_LEN 32
    


    
void Serial_Rx(void);
bool SerMsgParse(void);
void SerialStartup(void);
void SerResponseMsg(uint8 cnt, uint8 *msg);

#endif      // end of MODBUS_H
/* [] END OF FILE */
