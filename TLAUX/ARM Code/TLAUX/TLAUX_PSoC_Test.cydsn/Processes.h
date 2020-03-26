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
        
void InitCountProcess(void);    
void CountProcess(void); 
void InitAlphaProcess(void);  
void AlphaProcess(void); 

void BlinkProcess(void);

void InitStatusMon(void);
void StatusMon(void);


// Tool changer states
#define TC_STATE_IDLE           1
#define TC_STATE_ARM_IN_START   2
#define TC_STATE_ARM_IN         3
#define TC_STATE_ARM_OUT_START  4
#define TC_STATE_ARM_OUT        5
#define TC_STATE_BRAKE          6
#define TC_STATE_CAROUSEL_START  7
#define TC_STATE_CAROUSEL        8
#define TC_STATE_AIR_BLAST      9
#define TC_STATE_CLAMP          10
#define TC_STATE_FAULT          11
#define TC_STATE_TEST           12
#define TC_STATE_HOME_ARM       13
#define TC_STATE_HOME_CAROUSEL  14



// tool changer state machine
void Init_TC_StateMachine(void);
void TC_StateMachine(void);
// state machine states
void TC_IDLE(void);
void TC_Arm_Move_In_Start(void);
void TC_Arm_Move_In(void);
void TC_Arm_Move_Out_Start(void);
void TC_Arm_Move_Out(void);
void TC_Motor_Brake(void);
void TC_Carousel_Moving_Start(void);
void TC_Carousel_Moving(void);
void TC_Clamp_AirBlast(void);
void TC_Clamp(void);
void TC_Fault(void);
void TC_Test_Delay(void);
void TC_Home_Arm(void);
void TC_Home_Carousel(void);
void TC_Home_Delay(void);


// helper functions
void TC_Set_Delay(uint32 delay);
void Motors_Off(void);
uint8 Get_Current_Tool(void);
void Set_Current_Tool(uint8 tool);
void Set_Target_Tool(uint8 targ, int8 dir);
void TC_Status(void);
int At_Home(void);
int In_Fault(void);
void RunningTooLong(void);
    
#endif
/* [] END OF FILE */
 