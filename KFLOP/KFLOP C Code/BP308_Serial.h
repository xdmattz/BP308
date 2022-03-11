#ifndef BP308_SERIAL_H
#define BP308_SERIAL_H

#include "KMotionDef.h"

#define MSG_RET_START_CMD 0xe2
#define SERIAL_MSG_LEN 64   // changed from 32 on 05June2021 - don't think this is TLAUX_HOME_CMD problem but I'm seeing some strange errors.



// serial message position indicies 
#define COUNT_INDEX     1
#define ADDRESS_INDEX   2
#define COMMAND_INDEX   3
#define DATA_INDEX      4

// device addresses and commands
#define TLAUX_ADDRESS    0x02   // Device Address
#define TLAUX_QUERY      0x03   // Query Command
#define TLAUX_CMD2       0x04   // Returned command from TLAUX
#define TLAUX_ARM_CMD    0x04   // Arm Command. Next byte: 0 = no action, 1 = Arm IN, 2 = Arm OUT.
#define TLAUX_CAR_CMD    0x05   // Tool Carousel Command. Next byte: 0 - no action, 1 - 32 go to tool 
#define TLAUX_CLAMP_CMD  0x06   // Tool Clamp Command. Next byte: 0 - no action, 1 Air Blast, 2 Clamp release with Air, 3 Clamp release no air, 4 Clamp Grab
#define TLAUX_HOME_CMD   0x07   // Home Command - starts in a known position - fault recovery
#define TLAUX_BRAKE_CMD  0x08   // Brake Commnad - to release the brake tool arm motor brake.  0 = brake engaged (not energized), 1 = brake released (energized)

// Arm Command Arguments
#define TLAUX_ARM_IN     0x01
#define TLAUX_ARM_OUT    0x02
// Clamp Command Arguments 
#define TLAUX_CLAMP_AIR  0x01
#define TLAUX_CLAMP_RELA 0x02
#define TLAUX_CLAMP_REL  0x03
#define TLAUX_CLAMP_GRAB 0x04
// Brake Argument Arguments
#define TLAUX_BRAKE_IDLE 0x00
#define TLAUX_BRAKE_RELEASED 0x01


#define MPG_ADDRESS     0x03    // Device Address
#define MPG_QUERY       0x03    // Query Command
#define MPG_CMD2        0x04    // CMD2 Command

#define DEVICE_ADDRESS  0x04
#define DEVICE_QUERY    0x01    // Query Command
#define DEVICE_CMD2     0x02    // CMD2 Command


// serial recieve message structure    
typedef struct 
{
    BOOL InMessage;
    int msg_cntr;   // the index counter
	int msg_cnt;    // the length of the message
	char msg[SERIAL_MSG_LEN];   // the body of the message - everything but the start of command (0xe2)
} SerMsg;


// serial functions - apparently these need to be placed before the structures which reference them...

void Init_BP308_Serial(void);
void SerialPort_Manager(void);
void Send_Serial(char *msg);
void SerMsgParse(SerMsg *SM);
// functions to parse message from each serial device
void TLAUX_Parse(SerMsg *SM);
void MPG_Parse(SerMsg *SM);
void Device_Parse(SerMsg *SM);
// Commands for each device
void TLAUX_Query_Cmd(SerMsg *SM);
void TLAUX_CMD2_Cmd(SerMsg *SM);
void MPG_Query_Cmd(SerMsg *SM);
void MPG_CMD2_Cmd(SerMsg *SM);
void Device_Query_Cmd(SerMsg *SM);
void Device_CMD2_Cmd(SerMsg *SM);

// debug
void PrintSerMsg(SerMsg *SM);



struct DeviceList
{
    char Address;
    void (*func)(SerMsg *);
};

#define ARRAY_SIZE(X) (sizeof(X) / sizeof(X[0]))

#define NUM_OF_SER_DEVICES ARRAY_SIZE(DeviceListTable)

struct DeviceList DeviceListTable[] =
{
    { TLAUX_ADDRESS, TLAUX_Parse},
    { MPG_ADDRESS, MPG_Parse},
    { DEVICE_ADDRESS, Device_Parse}
};

struct CommandList
{
    char Cmd;
    void (*func)(SerMsg *);
};

// Device return data management
// TLAUX command handlers
 #define NUM_OF_TLAUX_CMDS ARRAY_SIZE(TLAUX_Cmds)

struct CommandList TLAUX_Cmds[] =
{
    { TLAUX_QUERY, TLAUX_Query_Cmd},
    { TLAUX_CMD2, TLAUX_CMD2_Cmd}
};

// MPG command handlers
#define NUM_OF_MPG_CMDS ARRAY_SIZE(MPG_Cmds)
struct CommandList MPG_Cmds[] =
{
    { MPG_QUERY, MPG_Query_Cmd},
    { MPG_CMD2, MPG_CMD2_Cmd}
};

// Device command handlers - replace with real device name when it exists
#define NUM_OF_DEVICE_CMDS ARRAY_SIZE(Device_Cmds)
struct CommandList Device_Cmds[] =
{
    { DEVICE_QUERY, Device_Query_Cmd},
    { DEVICE_CMD2, Device_CMD2_Cmd}
};

char TLAUX_StatusQuery[] = { 0x04, TLAUX_ADDRESS, TLAUX_QUERY };


char MPG_StatusQuery[] = { 0x04, MPG_ADDRESS, MPG_QUERY };

#endif
