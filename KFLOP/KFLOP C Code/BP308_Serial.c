
#include "BP308_Serial.h"
#include "BP308_Persist.h"

//    Communication format betwen KFLOP and Slave Serial Devices
//    Multi byte message:
//    'start' : 'Count' : 'Addr' : 'Command' : 'Data ...'     : 'CheckSum'
//    '  XX'  :  'XX'   : 'XX'   : 'XX'      : 'XX' 'XX' 'XX' : 'XX'

// messages to send 
char MsgTest1[] = { 0x0A, 0x02, 0x02, 0x43, 0x4D, 0x44, 0x20, 0x23, 0x31 };
char MsgTest2[] = { 0x0A, 0x02, 0x02, 0x43, 0x4D, 0x44, 0x20, 0x23, 0x32 };



// #define NUMOFCMDS ARRAY_SIZE(CMD_Parse_Table)

SerMsg RxMsg;	// the structure that contains the serial message

// functions for serial communications
void Init_BP308_Serial(void)
{
 	EnableRS232Cmds(RS232_BAUD_57600);
	// EnableRS232Cmds(RS232_BAUD_115200);	// 115200 is too fast for the KFLOP
	DoRS232Cmds = FALSE;  // turn off processing RS232 input as commands   
	
	// initialize the serial message parsing structure.
	RxMsg.msg_cnt = 0;
	RxMsg.msg_cntr = 0;
	RxMsg.InMessage = FALSE;
}

// Serial Port receive manager
// manages all the incomming  serial messages and processes them
void SerialPort_Manager(void)
{
    // read the serial port 
    while(pRS232RecIn != pRS232RecOut)	// if there is a character in the receive buffer...
    {
		char c = RS232_GetChar();	// get the serial char from the buffer
		if(RxMsg.InMessage == FALSE)	//  if not currently in a message then search for the start of message command
		{
			if((c & 0xff) == MSG_RET_START_CMD)
			{
				RxMsg.msg_cntr = 1;
				RxMsg.InMessage = TRUE;
				RxMsg.msg[0] = MSG_RET_START_CMD;	// put the start cmd into the first location of the message buffer
			}
		}
		else
		{
			if (RxMsg.msg_cntr == 1)	// if this is the second byte of a message then it is the message count
			{
				RxMsg.msg_cnt = (int)(c & 0xff);	// make sure the count doesn't have all the extra bits on it...
				if(RxMsg.msg_cnt >= SERIAL_MSG_LEN)
				{
					RxMsg.InMessage = FALSE;
					printf("Serial Message too long!\n");
					RxMsg.msg_cntr = 0;
					RxMsg.msg_cnt = 0;
				}
				else
				{
					RxMsg.msg[RxMsg.msg_cntr++] = (c & 0xff);
				}
			}
			else if (RxMsg.msg_cntr < RxMsg.msg_cnt)
			{
				RxMsg.msg[RxMsg.msg_cntr++] = (c & 0xff);
			}
			else if(RxMsg.msg_cntr == RxMsg.msg_cnt)
			{
				RxMsg.msg[RxMsg.msg_cntr] = (c & 0xff);
				SerMsgParse(&RxMsg);
				// clear the message
				int i;
				for(i = 0; i <= RxMsg.msg_cnt; i++)
				{
					RxMsg.msg[i] = 0;
				}
				RxMsg.msg_cntr = 0;
				RxMsg.msg_cnt = 0;
				RxMsg.InMessage = FALSE;
			}
			else
			{
				RxMsg.msg_cntr = 0;
				RxMsg.msg_cnt = 0;
				RxMsg.InMessage = FALSE;
			}
		}
    }
}

// build and send a serial message 
// 
void Send_Serial(char *msg)
{
    char msg_len;
    char CheckSum;

    RS232_PutChar(0xe1);    // start with the command header
    msg_len = (*msg);
    CheckSum = 0;

    int i = 1;
     while(i++ < msg_len)  
    {
        CheckSum += *msg;
        RS232_PutChar(*(msg++));
    }
    RS232_PutChar(~(CheckSum));
	RS232_PutChar(0x00);	// stuff a zero on the end for good measure - 05June2021
}

void SerMsgParse(SerMsg *SM)
{
	int checksum = 0;
	int i;
	for(i = 1; i < SM->msg_cnt; i ++)	// calculate the checksum
	{
		checksum += SM->msg[i];
	}
	checksum = ~checksum;	// invert 
	if((SM->msg[i] & 0xff) == (checksum & 0xff)) // and compare
	{
		char DevAddress = SM->msg[ADDRESS_INDEX];	// based on the return message address call a parsing function
		for(i = 0; i < NUM_OF_SER_DEVICES; i++)
		{
			if(DevAddress == DeviceListTable[i].Address)
			{
				DeviceListTable[i].func(SM);	// call the parse device function
			}
		}
	}
	else
	{
		printf("Bad Checksum! = 0x%x 0x%x\n", checksum, SM->msg[i]); // hopefully this will be a rare occurance and not overrun the buffer.
		PrintSerMsg(SM);
	}
}

void TLAUX_Parse(SerMsg *SM)
{
	char cmd = SM->msg[COMMAND_INDEX];
	int i;
	for (i = 0; 0 < NUM_OF_TLAUX_CMDS; i++)
	{
		if(cmd == TLAUX_Cmds[i].Cmd)
		{
			TLAUX_Cmds[i].func(SM);
			return; // or break;
		}
	}
}

void MPG_Parse(SerMsg *SM)
{
	char cmd = SM->msg[COMMAND_INDEX];
	int i;
	for (i = 0; 0 < NUM_OF_MPG_CMDS; i++)
	{
		if(cmd == MPG_Cmds[i].Cmd)
		{
			MPG_Cmds[i].func(SM);
			return; // or break;
		}
	}
}

void Device_Parse(SerMsg *SM)
{
	char cmd = SM->msg[COMMAND_INDEX];
	int i;
	for (i = 0; 0 < NUM_OF_DEVICE_CMDS; i++)
	{
		if(cmd == Device_Cmds[i].Cmd)
		{
			MPG_Cmds[i].func(SM);
			return; // or break;
		}
	}
}

// all that work just to get here!
void TLAUX_Query_Cmd(SerMsg *SM)
{	
//	printf("Y");
	persist.UserData[P_SERIAL_PENDING] &= ~(SP_TLAUX_QUERY);	// clear the status query bit
	persist.UserData[P_STATUS] |= _BV(SB_TLAUX_PRES);	// the TLAUX answered so present bit should be set
//	printf("Good TXLAUX Query! %d\n", qcount);
	// PrintSerMsg(SM);
	// printf("x\n");
	// set the persistant bits for the tool changer
	int tstatus;
	tstatus = (((int)((SM->msg[DATA_INDEX] & 0xff) << 8)) | ((int)((SM->msg[DATA_INDEX + 1] & 0xff))));	// get the status message
	if((tstatus & TLAUX_FAULT_MASK) != 0)	// if there is any fault 
	{
		persist.UserData[P_STATUS] &= ~(_BV(SB_TLAUX_OK));	// clear the tlaux fault bit in the main status register indicates a fault
	}
	else
	{
		persist.UserData[P_STATUS] |= _BV(SB_TLAUX_OK);	// Set the no fault bit.
	}
	persist.UserData[P_TLAUX_STATUS] = tstatus;
}

void TLAUX_CMD2_Cmd(SerMsg *SM)
{
}

void MPG_Query_Cmd(SerMsg *SM)
{
	persist.UserData[P_SERIAL_PENDING] &= ~(SP_MPG_QUERY);	// clear the status query bit
	persist.UserData[P_STATUS] |= _BV(SB_MPG_PRES); // MPG responded with this message so set present bit
	int tstatus;
	tstatus = (((int)((SM->msg[DATA_INDEX] & 0xff) << 8)) | ((int)(SM->msg[DATA_INDEX + 1] & 0xff)));	// get the status message
	if((tstatus & MPG_FAULT_MASK) != 0)	// if there is any fault 
	{
		persist.UserData[P_STATUS] &= ~(_BV(SB_MPG_OK));	// clear the MPG fault bit in the main status register
	}
	else
	{
		persist.UserData[P_STATUS] |= _BV(SB_MPG_OK);	// set the no fault bit.
	}
	persist.UserData[P_MPG_STATUS] = tstatus;
}

void MPG_CMD2_Cmd(SerMsg *SM)
{
}

void Device_Query_Cmd(SerMsg *SM)
{
	persist.UserData[P_SERIAL_PENDING] &= ~(SP_DEVICE_QUERY);	// clear the status query bit
}

void Device_CMD2_Cmd(SerMsg *SM)
{
}

void PrintSerMsg(SerMsg *SM)
{
	int i;
	for(i = 0; i <= SM->msg_cnt; i++)
	{
		printf("0x%x ", (SM->msg[i] & 0xff));
	}
	printf("\n");
	printf("count = 0x%x\n", SM->msg_cnt);
}
