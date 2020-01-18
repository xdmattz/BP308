#ifndef BP308_PERSIST_H
#define BP308_PERSIST_H

// This head file should be included in any program that accesses the persistant variables in any thread. - common to all threads

#define _BV(X) (1 << X)     // bit shifting macro - from winAVR 

// definitions of the persist variables used in the BP308
//
// can be use like this:
// persist.UserData[P_STATUS] |= (1 << SB_HOME);    - set the home bit in the status word.
// P_XXX means Persist
// SB_XXX means Status Bit

// have to figure out the best place to put these - 

#define P_STATUS            0   // the main status word of the machine
#define P_TLAUX_STATUS      1   // latest status recieved from the TLUX Tool Changer Query
#define P_MPG_STATUS        2   // latest status recieved from the MPG Query 
#define P_DEVICE_STATUS     3   // Some other TBD device status 
#define P_SERIAL_PENDING    4   // flags that indicate a message has been sent to a peripheral device
#define P_TLAUX_MSG_PTR     5   // Contains a pointer to the message to send - from another thread.


// BP308_STATUS bit definitions for P_STATUS
#define SB_ESTOP            0   // ESTOP sense 1 = OK, 0 = in ESTOP - this way it always defaults to ESTOP at startup
#define SB_TLAUX_OK         1   // indicates the summary status of the TLAUX, 1 = TLAUX is OK, 0 = some fault has occured 
                            // - this bit is managed by the TLAUX Query Response
#define SB_TLAUX_PRES       2   // The TLAUX is responding to querys, 1 = TLAUX present, 0 = TLAUX doesn't answer 
#define SB_MPG_OK           3
#define SB_MPG_PRES         4   // 1 = MPG present, 0 = MPG not present
#define SB_DEVICE_OK        5   
#define SB_DEVICE_PRES      6   // 1 = Device present, 0 = Device not present
#define SB_OIL_OK           7   // 1 = Oil OK, 0 = Oil low
#define SB_AIR_OK           8   // 1 = Air OK, 0 = Air pressure low
#define SB_FLOOD_MOTOR_OK   9   // 1 = motor switch tested OK
#define SB_PWR_MODULE_OK    10  // power module 1 = OK, 0 = not ready fault
#define SB_AXIS_OK          11  // Axis Fault 1 = AXIS OK, 0 = AXIS Fault
#define SB_SPINDLE_OK       12  // Spindle fault 1 = OK, 0 = fault
#define SB_HOME             13  // 1 = machine has been homed, 0 = not yet homed
#define SB_X_LIMIT          14  // 1 = on X_Limit, 0 = normal
#define SB_Y_LIMIT          15  // 1 = on Y_Limit, 0 = normal
#define SB_Z_LIMIT          16  // 1 = on Z_Limit, 0 = normal



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
// | NC | Timeout | ESTOP |                       | EN_SW | off | Axis | Rate |
// | 15 |    14   |  13   | 12 | 11 | 10 | 9 | 8  |  7    |  6  | 5-3  | 2-0  | 
#define MPG_FAULT_MASK          0x06000

#define MPG_STATUS_OFF_POS          6
#define MPG_STATUS_ESTOP_POS        13
#define MPG_STATUS_ENSW_POS         7
#define MPG_STATUS_AXIS_POS         3
#define MPG_STATUS_AXIS_MASK    0x0038
#define MPG_STATUS_AXIS_X       0x0008
#define MPG_STATUS_AXIS_Y       0x0010
#define MPG_STATUS_AXIS_Z       0x0018
#define MPG_STATUS_AXIS_A       0x0020
#define MPG_STATUS_RATE_MASK    0x0007
#define MPG_STATUS_RATE_X1      0x0001
#define MPG_STATUS_RATE_X10     0x0002
#define MPG_STATUS_RATE_X100    0x0003

   



#endif
