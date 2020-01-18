#ifndef BP308_SERIAL_H
#define BP308_SERIAL_H

#include "KMotionDef.h"

char MsgTest1[] = { 0x0A, 0x02, 0x02, 0x43, 0x4D, 0x44, 0x20, 0x23, 0x31 };
char MsgTest2[] = { 0x0A, 0x02, 0x02, 0x43, 0x4D, 0x44, 0x20, 0x23, 0x32 };

char StatusQuery[] = { 0x04, 0x02, 0x03 };

#define MSG_RET_START_CMD 0xe2
#define SERIAL_MSG_LEN 32


typedef struct 
{
	int msg_cnt;
	int msg_cntr;
	char msg[SERIAL_MSG_LEN];
} SerMsg;

SerMsg RxMsg;

// functions for serial communications
void Init_BP308_Serial(void)
{
 	EnableRS232Cmds(RS232_BAUD_115200);
	DoRS232Cmds = FALSE;  // turn off processing RS232 input as commands   
	
	// initialize the serial message parsing structure.
	RxMsg.msg_cnt = 0;
	RxMsg.msg_len = 0;
	RxMsg.crc = 0;
}


void Send_Serial_Query(char *msg)
{
    char msg_len;
    char CheckSum;

    RS232_PutChar(0xe1);    // start with the command header
    msg_len = (*msg);
    CheckSum = 0;

    char i = 1;
 //   for(int i = 1; i < (int)msg_len; i++)
    while(i++ < msg_len)  
    {
        CheckSum += *msg;
        RS232_PutChar(*(msg++));
    }
    RS232_PutChar(~(CheckSum));
}

void SerMsgParse(void)
{
	int checksum = 0;
	int i;
	for(i = 1; i < RxMsg.msg_cnt; i ++)
	{
		checksum += RxMsg.msg[i];
	}
	checksum = ~checksum;	// invert 
	if(RxMsg.msg[RxMsg.msg_cnt] != (checksum & 0xff)) // and compare
	{
		printf("Bad Checksum!\n"); // hopefully this will be a rare occurance and not overrun the buffer.
		return;
	}
	// based on the return message address 
	switch (RxMsg.msg[ADDRESS_INDEX])
	{
		case TLAUX_ADDRESS 	:
				Parse_TLAUX_Msg();
				break;
		case MPG_ADDRESS	:
				Parse_MPG_Msg();
				break;
		default				:
				break;
		
	}
}

void Parse_TLAUX_Msg(void)
{
}

void Parse_MPG_Msg(void)
{
}

#endif
