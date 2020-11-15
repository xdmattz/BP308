#ifndef BP308_NOTIFY_CMDS_H
#define BP308_NOTIFY_CMDS_H

// Thread 2 Notify Commands
// the bottom 16 bits of the command is separated into two bytes
// upper byte is the command, lower byte is the argument
#define CMD_MASK 0xff00
#define ARG_MASK 0x00ff
//
#define T2_NO_CMD       0x0000;
//
#define T2_STATUS       0x0100
#define T2_TEST_MSG     0x0200
#define T2_SER_TEST_MSG 0x0300

// Zeroing Commands - command byte 0x0400
#define T2_ZERO_AXIS    0x0400
#define T2_ZERO_X       0x0400
#define T2_ZERO_Y       0x0401
#define T2_ZERO_Z       0x0402
#define T2_ZERO_A       0x0403

// Axis Enable / Disable Commands - command byte 0x0600;
#define T2_AXIS_CMD     0x0600
#define T2_X_AXIS_EN    0x0601
#define T2_X_AXIS_DIS   0x0602
#define T2_Y_AXIS_EN    0x0603
#define T2_Y_AXIS_DIS   0x0604
#define T2_Z_AXIS_EN    0x0605
#define T2_Z_AXIS_DIS   0x0606
#define T2_A_AXIS_EN    0x0607
#define T2_A_AXIS_DIS   0x0608
#define T2_B_AXIS_EN    0x0609
#define T2_B_AXIS_DIS   0x060a
#define T2_C_AXIS_EN    0x060b
#define T2_C_AXIS_DIS   0x060c
// Spindle commands are in command 0x0500


// Homing Commands - command byte 0x00800
#define T2_HOME_AXIS    0x0800
#define T2_HOME_X       0x0801
#define T2_HOME_Y       0x0802
#define T2_HOME_Z       0x0803
#define T2_HOME_A       0x0804
#define T2_HOME_SPINDLE 0x0807
#define T2_HOME_ALL     0x080f

// Limit Commands   - command byte 0x0a00
#define T2_LIMIT_BACKOFF 0x0a00
#define T2_LIM_XP       0x0a01
#define T2_LIM_XN       0x0a02
#define T2_LIM_YP       0x0a03
#define T2_LIM_YN       0x0a04
#define T2_LIM_ZP       0x0a05
#define T2_LIM_ZN       0x0a06

// Tool changer commands - command bytes 0x0c00, 0x0d00 and 0x0e00
#define T2_SEL_TOOL     0x0c00
#define T2_TOOL_CLAMP   0x0d00
#define T2_TOOL_AIR     0x0d01
#define T2_TOOL_RELA    0x0d02
#define T2_TOOL_REL     0x0d03
#define T2_TOOL_GRAB    0x0d04
#define T2_TOLL_ARM     0x0E00

// Spindle commands - command byte 0x0500
#define T2_SPINDLE      0x0500
#define T2_SPINDLE_EN   0x0501
#define T2_SPINDLE_DIS  0x0502
#define T2_SPINDLE_CW   0x0503
#define T2_SPINDLE_CCW  0x0504
#define T2_SPINDLE_STOP 0x0505
// #define T2_SPINDLE_HOME 0x0506 // - this was moved to the Homing section
#define T2_SPINDLE_ZERO 0x0507
#define T2_SPINDLE_PID  0x0510
#define T2_SPINDLE_RPM  0x0511

#endif
