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

// functions for serial IO
#include "Serial_IO.h"
#include "project.h"

// buffers for serial communications
#define SERIAL_BUFF_SIZE 32

uint8 TX_BUFF[SERIAL_BUFF_SIZE];
uint8 RX_BUFF[SERIAL_BUFF_SIZE];

volatile uint8 *TX_HeadPtr;
volatile uint8 *TX_TailPtr;
volatile uint8 *RX_HeadPtr;
volatile uint8 *RX_TailPtr;
    

// UART Transmit interrupt
CY_ISR(TX_ISR)
{
    // toggle the test point
  
}

// UART Receive interrupt
CY_ISR(RX_ISR)
{
    // interrupt says there is a character in the RX Buffer
    *RX_HeadPtr++ = UART_RXDATA_REG;
    // *RX_HeadPtr++ = UART_ReadRxData();  // get data from the buffer and incrememnt the Head Pointer
    if(RX_HeadPtr >= (RX_BUFF + SERIAL_BUFF_SIZE))   // check for circular buffer wraparound
    {
        RX_HeadPtr = RX_BUFF;   
    }
}

// Init Serial IO

void Init_Serial_IO(void)
{
    UART_Start();
}

/*
void SER_PutChar(uint8 c) 
{
    UART_WriteTxData(c);
}

uint8 SER_GetChar(void)
{
    return (UART_GetChar());
}
*/


void SER_PutStr(uint8 *msg)
{
    while(*msg != 0x00)
    {
        SER_PutChar(*msg++);
    }
}

// check for Rx - returns 0 if the buffer is empty, non zero if data in the buffer
uint8 SER_CheckForRx(void)
{
//    UART_ReadRxStatus();
    return((uint8)UART_GetRxBufferSize());
}
/* [] END OF FILE */
