#ifndef BP308_HARDWARE_H
#define BP308_HARDWARE_H



#define QUERY_TIMEOUT 0.020         // 20 millisecond timeout
#define FLOOD_QUERY_TIMEOUT 0.200   // 200 millisecond timeout
#define ESTOP_DELAY_TIMEOUT 1.2     // 1200 ms delay to wait for axis ready after estop
#define PWR_MOD_READY_TIMEOUT 1.0   // give the power module 2 seconds to get ready after coming out of ESTOP_DELAY_TIMEOUT
#define SPINDLE_READY_TIMEOUT 0.5   // 0.5 second delay for monitoring a Spindle Fault on powerup
#define MS_Timeout            0.001 // 1 ms


// Test Points for debug etc
#define TP1 25    // Pin 16 of KFLOP J4 connector. convienent test point
#define TP2 24    // Pin 15 of KFLOP J4 connector. convienent test point  


void Init_BP308_Hardware(void);

void Init_Kanalog_IO(void);
void Init_Konnect_IO(void);

// functions that determine the hardware status of the BP308

void HardwareQuery(void);
void TLAUX_Query(void);
void MPG_Query(void);
void CheckHW(int Mask, int HW_IO_Addr, int IO_state, float timeout);
void Limit_Check(void);
void Limit_Check2(void);
void Init_Spindle(void);
void Init_TestPoints(void);

void Fault_Check(void);
void Warning_Check(void);

#endif
