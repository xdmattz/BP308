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
#ifndef SERIAL_IO_H
#define SERIAL_IO_H
    
#include <stdint.h>
#include "cytypes.h"    
#include "project.h"    


#define SER_PutChar(X)  UART_WriteTxData(X) 
#define SER_GetChar()   UART_GetChar()
    
void Init_Serial_IO(void);   
// void SER_PutChar(uint8 c);
// uint8 SER_GetChar(void);
void SER_PutStr(uint8 *msg);
uint8 SER_CheckForRx(void);


#endif

/* [] END OF FILE */
