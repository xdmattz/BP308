#pragma TI_COMPILER // (optimization) or (optimization, size)
// of course use the TI Compiler!
// 
// BP308_Home
// this program contains all the functions that don't run all the time, but run once and terminate.
// it is intended that this program run in Thread 2, but if thread 1 gets too big, it may be
// necessary to run it in Thread 3 and let Thread 1 overrun Thread 2's code space. 

#include "KMotionDef.h"

#include "BP308_Home.h"
#include "BP308_IO.h"
#include "BP308_Persist.h"

#include "BP308_MoreSpindle.c"

int main()
{
    int msg = persist.UserData[P_NOTIFY]; // get the Notify command

    printf("Thread 2 Notify Call - Message %d\n", msg);

    switch((msg & CMD_MASK))
    {
        case T2_STATUS : StatusRead();
                    break;
        case T2_TEST_MSG : Test_Msg(msg);
                    break;
        case T2_SER_TEST_MSG : Serial_Msg_Test(msg);
                    break;
        case T2_ZERO_AXIS : Zero_Axis(msg);
                    break;
        case T2_HOME_AXIS : Home_All_Axis(msg);
                    break;
        case T2_HOME_Y : 
                    break;
        case T2_HOME_Z : 
                    break;
        case T2_HOME_A : 
                    break;
        case T2_LIMIT_BACKOFF : Limit_Backoff(msg);
                    break;
        case T2_SEL_TOOL :  Select_Tool(msg);
                    break;
        case T2_TOOL_CLAMP : Tool_Clamp(msg);
                    break;  
        case T2_SPINDLE : SpindleCmd(msg);
                    break;                  
        default: break;
    }

    return 0;
}


// Testing
void Test_Msg(int pmsg)
{
    printf("Test Message pmsg = %4X\n", pmsg);
}

void Serial_Msg_Test(int pmsg)
{

}

void StatusRead(void)
{
    printf("Status byte Value: %4X\n", persist.UserData[P_STATUS]);
}

// Zeroing & Homing Routines

void Zero_Axis(int Axis)
{
    int pAxis;

    switch (Axis)
    {
        case T2_ZERO_X : pAxis = X_AXIS; break;
        case T2_ZERO_Y : pAxis = Y_AXIS; break;
        case T2_ZERO_Z : pAxis = Z_AXIS; break;
        case T2_ZERO_A : pAxis = A_AXIS; break;
        default : pAxis = -1; break;
    }
    if(pAxis != -1)
    {
        if(CheckDone(pAxis) != CD_AXIS_DISABLED)
        {
            DisableAxis(pAxis);
            EnableAxisDest(pAxis,chan[pAxis].Position);
            persist.UserData[P_MPG_RESYNC] = TRUE;
            // printf("%d Axis Zeroed!\n");
        }
    }
}


void Home_All_Axis(int pmsg)
{
    // start by checking the limit switches. If any limit switch is active then don't home
    if((ReadBit(X_LIMIT) == LIM_AT_LIM) || (ReadBit(Y_LIMIT) == LIM_AT_LIM) || (ReadBit(Z_LIMIT) == LIM_AT_LIM))
    {
        printf("Axis on Limit! cannot Proceede\nClear Limit and retry\n");
        persist.UserData[P_NOTIFY] = 0; // clear the Notify cmd
    } else
    {
        persist.UserData[P_MPG_RESYNC] = TRUE;
        // start with the Z axis, then do the Y axis and finally the X axis
        Home_Axis(Z_AXIS, Z_HOME, ENC_Z_R);
        Zero(Z_AXIS);   // Zero Axis
        Home_Axis(Y_AXIS, Y_HOME, ENC_Y_R);
        Zero(Y_AXIS);   // Zero Axis
        Home_Axis(X_AXIS, X_HOME, ENC_X_R);
        Zero(X_AXIS);   // Zero Axis
        // set the home bit!
        persist.UserData[P_STATUS] &= _BV(SB_HOME);
    }
    persist.UserData[P_NOTIFY] = 0; // clear the command.
}

void Home_Axis(int Axis, int Home, int Index)
{
    double home_pos;
    // is the axis on the Home Switch?
    if(ReadBit(Home)== HOME_AT_HOME)
    {
        MoveRelAtVel(Axis, -(HOME_BACKOFF), HOME_VEL_1);        // if so then back up 1 inch.
        while(CheckDone(Axis) != CD_DONE)
        {
            WaitNextTimeSlice();
        }
    }
    Jog(Axis, HOME_VEL_1);
    while(ReadBit(Home) == HOME_NOT_HOME)       // move until Home switch detects.
    {
        WaitNextTimeSlice();
    }
    Jog(Axis, 0);
    Jog(Axis, -(HOME_VEL_2));   // backup until off the home switch
    while(ReadBit(Home) == HOME_AT_HOME)
    {
        WaitNextTimeSlice();
    }
    Jog(Axis, (HOME_VEL_3));    // move slowly until Index is set.
    while(ReadBit(Index) == INDEX_NOT_INDEX)
    {
        WaitNextTimeSlice();
    }
    home_pos = chan[Axis].Dest;     // record the index location
    Jog(Axis,0);    // stop the motion
    MoveAtVel(Axis, home_pos, HOME_VEL_3);
    while(CheckDone(Axis) != CD_DONE)    // move to the index location
    {
        WaitNextTimeSlice();
    }
    // is Index set again?
}


void Home_X(void)
{
    // always start with Z
    // then Y
    // then X
}

void Home_Y(void)
{

}

void Home_Z(void)
{

}

void Home_A(void)
{

}

void Limit_Backoff(int pmsg)
{
    // check the axis
        int pAxis;
        double pDir;
        int LimSwitch;

    switch (pmsg)
    {
        case T2_LIM_XP : pAxis = X_AXIS; pDir = -1.0; LimSwitch = X_LIMIT; break;
        case T2_LIM_XN : pAxis = X_AXIS; pDir = 1.0;  LimSwitch = X_LIMIT; break;
        case T2_LIM_YP : pAxis = Y_AXIS; pDir = -1.0;  LimSwitch = Y_LIMIT; break;
        case T2_LIM_YN : pAxis = Y_AXIS; pDir = 1.0;  LimSwitch = Y_LIMIT; break;
        case T2_LIM_ZP : pAxis = Z_AXIS; pDir = -1.0;  LimSwitch = Z_LIMIT; break;
        case T2_LIM_ZN : pAxis = Z_AXIS; pDir = 1.0;  LimSwitch = Z_LIMIT; break;
        default : pAxis = -1; break;
    }
    if(pAxis != -1)
    {
        if(CheckDone(pAxis) != CD_AXIS_DISABLED)    // skip if axis is disabled
        {
            if(ReadBit(LimSwitch) == LIM_AT_LIM)    // check to make sure that the limit switch is triggered
            {
                ClearStopImmediately();             // stop the feed hold
                int BackoffCnt = 0;
                while(ReadBit(LimSwitch) == LIM_AT_LIM)
                {
                    int LimitOptions = chan[pAxis].LimitSwitchOptions;  // save the existing limit switch settings
                    chan[pAxis].LimitSwitchOptions = 0;                 // Disable limit switch action - very dangerous!
                    MoveRelAtVel(pAxis, (pDir * (BACKOFF_STEPS)), BACKOFF_VEL); // Look up MPG slowest rate.
                    while(CheckDone(pAxis) != CD_DONE)
                    {
                        WaitNextTimeSlice();
                    }
                    chan[pAxis].LimitSwitchOptions = LimitOptions;  // restore the original limit switch settings
                    BackoffCnt++;
                    if(BackoffCnt > 5)
                    {
                        printf("Can't move off limit switch\n");
                        break;
                    }
                }
                persist.UserData[P_MPG_RESYNC] = TRUE;         // restart the MPG
            }
        }
    }
    persist.UserData[P_NOTIFY] = 0;     // clear the P_NOTIFY cmd so it can't accidently be called twice  
}

// Tool Changer routines

void Select_Tool(int pmsg)
{

}

void Tool_Clamp(int pmsg)
{
    // wait for the remote command bit to clear
    while(persist.UserData[P_REMOTE_CMD] != 0)
    {
        WaitNextTimeSlice();
        // check for a timeout? so not to get hung up here
    }
    persist.UserData[P_REMOTE_CMD] = (RC_TLAUX_CLAMP_CMD & CMD_MASK) | (pmsg & ARG_MASK);   // remote command 
}



// Spindle Control
void SpindleCmd(int pmsg)
{
    switch (pmsg)
    {
        case T2_SPINDLE_EN : SpindleEnable();
                    break;
        case T2_SPINDLE_DIS : SpindleDisable();
                    break;
        case T2_SPINDLE_CW : break;
        case T2_SPINDLE_CCW : break;
        case T2_SPINDLE_STOP : break;
        case T2_SPINDLE_HOME : break;
        case T2_SPINDLE_ZERO : break;
        case T2_SPINDLE_PID : SetSyncSpindle();
                    break;
        case T2_SPINDLE_RPM : SetRPMSpindle();
                    break;
        default : break;
    }
    persist.UserData[P_NOTIFY] = 0; // indicate that the command has compleated

}