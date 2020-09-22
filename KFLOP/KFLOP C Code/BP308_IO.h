#ifndef BP308_IO_H
#define BP308_IO_H

// uncomment the next line for operating in the development environment
// #define TESTBED 


// Axis Definitions

#define X_AXIS 0
#define Y_AXIS 1
#define Z_AXIS 2
#define A_AXIS 3
#define SPINDLE_AXIS 7

#define X_ENC_RES 8000  // Encoder resolution * Gear ratio
#define Y_ENC_RES 8000  // Encoder resolution * Gear ratio
#define Z_ENC_RES 8000  // Encoder resolution * Gear ratio
#define SP_ENC_RES 2000  // Encoder resolution * Gear ratio


// Limit Switch Backoff 
#define BACKOFF_STEPS 1250  // 1/20 of an inch - assuming 40u in/step
#define BACKOFF_VEL 5000    // units are encoder ticks per second

// Home Switch Backoff
#define HOME_BACKOFF 25000  // about 1 inch
#define HOME_VEL_1  40000  // Homing velocity    20 ipm, 0.333 ips 
#define HOME_VEL_2  5000  // Homing backoff velocity  7.2 ipm    
#define HOME_VEL_3  1500   // index hunt velocity 0.06 ips

// definitions for the IO ports on the DANALOG Board for the Bridgeport Discovery 308 rebuild
// The DANALOG board looks like both a KANALOG and KONNECT board
// 
// 
// KANALOG Connections
//
// Inputs
#define ESTOP			    128		// ESTOP Switch - OPTO_0
#define SPINDLE_FAULT	    129		// Pins - need to double check the name here - OPTO_1
#define POWER_MODULE_READY  130	// - OPTO_2
#define AXIS_FAULT		    131		// - OPTO_3
#define X_LIMIT			    132		// Normally Closed - OPTO_4
#define X_HOME			    134		// Normally Open - OPTO_6
#define Y_LIMIT			    133		// Normally Closed - OPTO_5
#define Y_HOME			    135		// Normally Open - OPTO_7
#define Z_LIMIT			    136		// Normally Closed - OPTO_8
#define Z_HOME			    138		// Normally Open - OPTO_10
#define OPTO_9			    137		// UNUSED - OPTO_9
#define HEAD_WHITE		    139		// OPTO_11
#define HEAD_RED		    140		// OPTO_12
#define HEAD_GREEN		    141		// OPTO_13
#define HEAD_BLUE		    142		// OPTO_14
#define HEAD_YELLOW		    143		// OPTO_15
#define TOOL_RELEASE        140     // same as red wire.

#define ESTOP_ACTIVE	    1		// Reads 1 when the ESTOP switch is pressed
#define ESTOP_RUN           0
#define ESTOP_OK            0
#define SPINDLE_FAULTED     0       // Double Check all of these!!!
#define SPINDLE_FAULT_OK    1
#define POWER_MODULE_OK     1
#define AXIS_FAULTED        1
#define AXIS_FALT_OK        0
#define X_AT_LIMIT          0
#define X_NO_LIMIT          1
#define X_AT_HOME           1
#define Y_AT_LIMIT          0
#define Y_NO_LIMIT          1
#define Y_AT_LIMIT          0
#define Y_AT_HOME           1
#define Z_AT_LIMIT          0
#define Z_NO_LIMIT          1
#define Z_AT_LIMIT          0
#define Z_AT_HOME           1
#define LIM_AT_LIM          0
#define LIM_NO_LIM          1
#define HOME_AT_HOME        1
#define HOME_NOT_HOME       0
#define INDEX_AT_INDEX      1
#define INDEX_NOT_INDEX     0


// Outputs
// 24V FET drive
#define ESTOP_RELAY		    152		// 24V FET 0
#define SPINDLE_ENABLE 	    153 	// 24V FET 1
#define RELAY3			    154		// 24V FET 2
#define Z_BRAKE			    155		// 24V FET 3
#define FET4			    156
#define FET5			    157
#define FET6			    158
#define FET7			    159

// Isolated AC Control
// the first four AC controls are 110V
#define OIL_LUBE		    160		// AC0 Bijur oiler
#define FLOOD_MOTOR		    161		// AC1 Flood coolant relay control
#define DOOR_FAN		    162		// AC2 electronic cabinet door fan
#define AC3_110			    163		// available				
// the other 4 AC controls are 220V
#define AC4_220			    164		// no triac installed
#define AC5_220			    165		// no triac installed
#define AC6_220			    166		// available
#define AC7_220			    167		// available

// Other Kanalog Connections
// Analog Outputs
// DAC 0 - X_AXIS
// DAC 1 - Y_AXIS
// DAC 2 - Z_AXIS
// DAC 3 - A_AXIS - currently not connected to anything
// DAC 4 - open
// DAC 5 - open
// DAC 6 - open
// DAC 7 - SPINDLE

// Analog Inputs
// ADC 0 - 8 currently unused

// Encoder inputs
// Encoder 0 X_Axis
// Encoder 1 Y_Axis
// Encoder 2 Z_Axis
// Encoder 3 A_Axis - currently not connected
// Encoder 4 NU
// Encoder 5 NU
// Encoder 6 NU
// Encoder 7 SPINDLE

// KONNECT Connections
// 32 Inputs
// Board 0 addresses
// Extended IO
#define ENC_X_R		    1024	// X_Axis Index
#define ENC_Y_R		    1025	// Y_Axis Index
#define ENC_Z_R		    1026	// Z_Axis Index
#define ENC_A_R		    1027	// A_Axis Index - currently not connected
#define ENC_CH4_R	    1028	// B_Axis Index - currently not connected
#define ENC_CH5_R	    1029	// C_Axis Index - currently not connected
#define ENC_CH6_R	    1030	// D_Axis Index - currently not connected
#define SPINDLE_R	    1031	// Spindle Index
#define MPG_A		    1032	//
#define MPG_B		    1033	//
#define KON_IN_1034	    1034	//
#define KON_IN_1035	    1035	//
#define KON_IN_1036	    1036	//
#define KON_IN_1037	    1037	//
#define KON_IN_1038	    1038	//
#define KON_IN_1039	    1039	//
#define AUX_ISO_0	    1040	//
#define AUX_ISO_1	    1041	//
#define AUX_ISO_2	    1042	//
#define AUX_ISO_3	    1043	//
#define LUBE_MON	    1044	// Lube Oil level
#define COOLANT_MON	    1045	// Coolant motor relay monitor
#define AIR_MON		    1046	// Air input PSI monitor
#define AUX_ISO_7	    1047	//
#define KON_IN_1048     1048
#define KON_IN_1049     1049
#define KON_IN_1050     1050
#define KON_IN_1051     1051
#define KON_IN_1052     1052
#define KON_IN_1053     1053
#define KON_IN_1054     1054
#define KON_IN_1055     1055

// 16 Konnect outputs 
// Board 0 addresses
#define KON_OUT_48      48
#define KON_OUT_49      49
#define KON_OUT_50      50
#define KON_OUT_51      51
#define KON_OUT_52      52
#define KON_OUT_53      53
#define KON_OUT_54      54
#define KON_OUT_55      55
#define KON_OUT_56      56
#define KON_OUT_57      57
#define KON_OUT_58      58
#define KON_OUT_59      59
#define KON_OUT_60      60
#define KON_OUT_61      61
#define KON_OUT_62      62
#define KON_OUT_63      63

#define LUBE_MON_OK     1
#define AIR_MON_OK      1
#define COOLANT_MON_OK  1

// return values for CheckDone
#define CD_AXIS_DISABLED    -1
#define CD_DONE             1
#define CD_NOT_DONE         0

#endif
