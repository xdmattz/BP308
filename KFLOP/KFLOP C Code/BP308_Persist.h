#ifndef BP308_PERSIST_H
#define BP308_PERSIST_H

// *** This header file should be included in any program that accesses the persistant variables in any thread ***
// ie. it is common to all threads



// definitions of the persist variables used in the BP308
//
// can be use like this:
// persist.UserData[P_STATUS] |= (1 << SB_HOME);    - set the home bit in the status word.
// P_XXX means Persist
// SB_XXX means Status Bit

 // persistant variable map
 // the KFLOP communicates between threads and with the PC via "persist variables"  
 // there are 200 UserData variables defined in KMotionDef.h 
 // Each user data is described in various sections of the KFLOP documentation.
 // 0 - 99  MACH3 User DROs 1 - 50 - 2 words each 
 //     5   MACH3 
 //     6   MACH3 notify message
 //     50-61 MACH3 Current positions of the defined axes.
 //     62  MACH3 Probe Status
 //     
 //
 // 100 - 107 PC_COMM_PERSIST - defined in PC-DSP.h  Special Vars constanty loaded with Bulk Status 
 // 110 - 114 PC_COMM_CSS Mode - Constant Surface Speed variables.
 //
 // Changing this because it doesn't seem very efficient.
 // putting the status into the PC_Comm variables because they automatically get sent to KMotion_dotNet.dll
 // the other variables appear to take much longer to read so I don't want to put them into the timer loop.
 // from the KmotionDef.h file, it appears that the values 104 - 107 are not used by KMotionCNC but are still
 // passed in the MainStatus report.

 // old definitions
 // 120 - 129 BP308 status variables
 //     120     P_STATUS - BP308 status 
 //     121     P_TLAUX_STATUS - BP308 tool changer status
 //     122     P_MPG_STATUS - BP308 MPG status
 //     123     P_DEVICE_STATUS - some future device?
 //     124     P_SERIAL_PENDING
 //     125     P_MSG_PTR
 //     126     P_MSG_PTR_H
 //     127     P_RESYNC_MPG    - flag to cause MPG Resync

 // 
 // new definitions
 //     104     P_STATUS - BP308 status
 //     119     P_HOME_STATUS - 
 // 
 // 130 - 139  BP308 Home routines (Thread 2) communications
 //     130     Notify Command Message - similar to MACH3 Notify Message ie the command to execute   
 //     131     Notify Argument - any data that may accompany a message - 
// #define P_HOME_STATUS       119   // bits are set when an axis is homed. pushed these bits into the upper 16 bits of P_STATUS
#define P_STATUS            120   // the main status word of the machine
#define P_STATUS_REPORT     104   // the reported main status word of the machine copy status to this persist variable when done computing.
#define P_TLAUX_STATUS      121   // latest status recieved from the TLUX Tool Changer Query
#define P_MPG_STATUS        122   // latest status recieved from the MPG Query 
#define P_DEVICE_STATUS     123   // Some other TBD device status 
#define P_SERIAL_PENDING    124   // flags that indicate a message has been sent to a peripheral device
#define P_MSG_PTR           125   // Contains a pointer to the message to send - from another thread. - low bytes
#define P_MSG_PTR_H         126   // High byte
#define P_MPG_RESYNC        127   // making this non zero will cause the MPG to resync 
#define P_SPINDLE_STATUS    128   // 
#define P_SPINDLE_RPM_CMD   129   // commanded spindle speed - float value passed into thread 3 - 
#define P_SPINDLE_RPM       105    // calcualted in spindle monitor - test so it is passed to PC in PC_Comm
#define P_NOTIFY            131     // command to Thread 2 functions
#define P_NOTIFY_ARGUMENT   132     // Argument passed to a Notify Command - this is on an even boundry in case argument is a double
#define P_NOTIFY_ARGUMENT2  133     // Second possible argument passed to a Notify Command 
#define P_REMOTE_CMD        134     // a non zero value here indicates a command from another Thread or the PC
#define P_INGORE_FAULT      135     // temporarily ignore the Z Axis disabled fault that sets the Z Brake 


// BP308_STATUS bit definitions for P_STATUS
// rewrite this!
// new bit definitions
// One 32 bit status word should have plenty of room for all the information needed
#define SB_ACTIVE           0   // this bit should always be set to 1 once the program starts - it can indicate that things are running
#define SB_ESTOP            1   // ESTOP sense 1 = OK, 0 = in ESTOP - this way it always defaults to ESTOP at startup
                                
// The next group of bits should be organized into an "Error" group and a "Warning" group
// Errors should inhibit normal operation
// Warnings should cause some sort of indication but not stop operation  
#define ERROR_STATUS_MASK   0x000002fc            
#define SB_TLAUX_OK         2   // indicates the summary status of the TLAUX, 1 = TLAUX is OK, 0 = some fault has occured - this bit is managed by the TLAUX Query Response
#define SB_TLAUX_PRES       3   // The TLAUX is responding to querys, 1 = TLAUX present, 0 = TLAUX doesn't answer 
#define SB_MPG_OK           4
#define SB_MPG_PRES         5   // 1 = MPG present, 0 = MPG not present
#define SB_DEVICE_OK        6   
#define SB_DEVICE_PRES      7   // 1 = Device present, 0 = Device not present
#define SB_AIR_OK           8   // 1 = Air OK, 0 = Air pressure low
#define SB_PWR_MODULE_OK    9   // power module 1 = OK, 0 = not ready fault
#define SB_AXIS_OK          10  // Axis Fault 1 = AXIS OK, 0 = AXIS Fault

#define WARNING_STATUS_MASK 0x0000f000  // should this really be 0x0000f800 ?
#define SB_OIL_OK           11  // 1 = Oil OK, 0 = Oil low
#define SB_HOME             12  // 1 = machine has been homed, 0 = not yet homed
#define SB_LIMIT_MASK       0x0000e000
#define SB_X_LIMIT          13  // 0 = on X_Limit, 1 = normal
#define SB_Y_LIMIT          14  // 0 = on Y_Limit, 1 = normal
#define SB_Z_LIMIT          15  // 0 = on Z_Limit, 1 = normal

// these are the home status bit definitions for P_HOME_STATUS
// inorder to simplify testing, these bits are set at initialization, and cleared when the axis is homed.
// that way if(P_STATUS & HOME_STATUS_MASK == 0) the machine is all homed. 
#define HOME_STATUS_MASK    0x00870000
#define SB_HOME_POS        16    // Position of the first bit of the home status bits - should be the same as SB_X_HOME
#define SB_X_HOME           16   // 1 = not yet homed, 0 = homed
#define SB_Y_HOME           17
#define SB_Z_HOME           18
#define SB_A_HOME           19   // not yet implemented - since I don't have an A axis yet.
#define SB_SPIN_HOME        23
#define SB_SPINDLE_OK       24  // Spindle fault 1 = OK, 0 = fault
#define SB_SPINDLE_RPM      25  // Spindle Mode RPM if set
#define SB_SPINDLE_PID      26  // Spindle Mode PID if set - if both are set then there is some sort of error. if both are cleared then not yet initialzied
#define SB_SPINDLE_ON       27  // Spindle ON = 1, Spindle OFF = 0
#define SB_SPINDLE_CW       28
#define SB_SPINDLE_CCW      29


#define _BV(X) (1 << X)     // bit shifting macro
#define SetPStatusBit(X) persist.UserData[P_STATUS] |= _BV(X)
#define ClearPStatusBit(X) persist.UserData[P_STATUS] &= ~(_BV(X))
#define SetPBit(X,Y) persist.UserData[X] |= _BV(Y)
#define ClearPBit(X,U) persist.UserData[X] &= ~(_BV(Y))
#define PStatusBitIsSet(X) (persist.UserData[P_STATUS] & _BV(X)) // usage if(PStatusBitIsSet(X) == true) where true is non zero

// P_SERIAL_PENDING bit definitions
#define SP_TLAUX_QUERY      _BV(0)   // TLAUX query sent
#define SP_MPG_QUERY        _BV(1)   // MPG query sent
#define SP_DEVICE_QUERY     _BV(2)   // Device query sent
#define SP_TLAUX_MSG_READY  _BV(3)   // Message to send from another thread

// P_TLUX_STATUS bit definitions
// Tool Changer Status Query 
// Current state of the tool changer
// 16 LSBs contain the status of the tool changer
// 
//      |         Fault Bits         |  Clamp Relays   |     ARM Bits      | Carousel Bits         |
// | NC | Timeout | ESTOP | 24V | AC | UnClamp | Clamp | Arm Out |  ARM In | Car Motion | Tool Pos |
// | 15 |    14   |  13   |  12 | 11 |    10   |   9   |    8    |    7    |     6      |  5 - 0   | 

#define TLAUX_FAULT_MASK    0x07800
#define TLAUX_SOMETHING     0x0000

// P_MPG_STATUS bit definitions
// MPG Status Query
// Switch state of the Manual Pulse Generator
// 16 bits contain the state of the selector switches
//
//      |      Fault Bits |       open            | Selector Switches
// | NC | Timeout | ESTOP |              |SW2| SW1| EN_SW | off | Axis | Rate |
// | 15 |    14   |  13   | 12 | 11 | 10 | 9 | 8  |  7    |  6  | 5-3  | 2-0  | 
#define MPG_FAULT_MASK          0x06000

#define MPG_STATUS_OFF_POS          6
#define MPG_STATUS_ESTOP_POS        13
#define MPG_STATUS_ENSW_POS         7
#define MPG_STATUS_AXIS_POS         3
#define MPG_STATUS_SW2_POS          9
#define MPG_STATUS_SW1_POS          8
#define MPG_STATUS_AXIS_MASK    0x0038
#define MPG_STATUS_AXIS_X       0x0008
#define MPG_STATUS_AXIS_Y       0x0010
#define MPG_STATUS_AXIS_Z       0x0018
#define MPG_STATUS_AXIS_A       0x0020
#define MPG_STATUS_RATE_MASK    0x0007
#define MPG_STATUS_RATE_X1      0x0001
#define MPG_STATUS_RATE_X10     0x0002
#define MPG_STATUS_RATE_X100    0x0003

// Remote Commands 

#define RC_TLAUX_CLAMP_CMD  0x0100
#define RC_TLAUX_CLAMP_AIR  0x0101
#define RC_TLAUX_CLAMP_RELA 0x0102
#define RC_TLAUX_CLAMP_REL  0x0103
#define RC_TLAUX_CLAMP_GRAB 0x0104
#define RC_TLAUX_ARM_IN     0x0105
#define RC_TLAUX_ARM_OUT    0x0106

#endif
