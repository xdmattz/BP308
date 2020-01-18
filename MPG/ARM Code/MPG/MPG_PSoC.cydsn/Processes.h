/* ========================================
 *
 * Copyright YOUR COMPANY, THE YEAR
 * All Rights Reserved
 * UNPUBLISHED, LICENSED SOFTWARE.
 *
 * CONFIDENTIAL AND PROPRIETARY INFORMATION *
 * ========================================
*/
#ifndef PROCESSES_H
#define PROCESSES_H
    
#include "cytypes.h"
#include "State_Machine.h"    
        
void InitCountProcess(void);    
void CountProcess(void); 
void InitAlphaProcess(void);  
void AlphaProcess(void); 

void InitStatusMon(void);
void StatusMon(void);


// MPG states
#define MPG_STATE_IDLE      1
#define MPG_STATE_NORMAL    2
#define MPG_STATE_ESTOP     3
#define MPG_STATE_FAULT     4
#define MPG_STATE_TEST      5


// MPG state machine
void Init_MPG_StateMachine(void);
void MPG_StateMachine(void);
// state machine states
void MPG_IDLE(void);
void MPG_Normal(void);
void MPG_ESTOP(void);
void MPG_Fault(void);
void MPG_Test_Delay(void);

// LED Blink processes

#define BLINK_STATE_NO      1
#define BLINK_STATE_SINGLE  2
#define BLINK_STATE_DOUBLE  3
#define BLINK_STATE_LONG    4
#define BLINK_STATE_LONGSHORT 5
#define BLINK_STATE_FAST    6

void Blink_StateMachine(void);
// Single Blink
void startSingleBlink(void);
void SingleBlink(void);
// double blink
void startDoubleBlink(void);
void DoubleBlink(void);
// long blink - like a heart beat - 
void startLongBlink(void);
void endLongBlink(void);
void LongBlink(void);
// long / short blink - fault blink
void startLongShortBlink(void);
void endLongShortBlink(void);
void LongShortBlink(void);
// fast blink - ESTOP 

void startFastBlink(void);
void endFastBlink(void);
void FastBlink(void);

void NoBlink(void);

// helper functions
void MPG_Set_Delay(uint32 delay, func_ptr NextState);

int In_Fault(void);
void MPG_Status(void);

    
#endif
/* [] END OF FILE */
 