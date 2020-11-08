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
        case T2_HOME_AXIS : Home_AxisCmd(msg);
                    break;
        case T2_AXIS_CMD : Axis_Cmd(msg);
                    break;
        case T2_HOME_SPINDLE : Spindle_Home();
                    break;
        case T2_LIMIT_BACKOFF : Limit_Backoff(msg);
                    break;
        case T2_SEL_TOOL : Select_Tool(msg);
                    break;
        case T2_TOOL_CLAMP : Tool_Clamp(msg);
                    break;  
        case T2_SPINDLE : Spindle_Cmd(msg);
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

void Home_AxisCmd(int pmsg)
{

    #ifdef TESTBED
    if((persist.UserData[P_STATUS] & SB_LIMIT_MASK) != SB_LIMIT_MASK)
    {
        printf("Axis on Limit! cannot Proceed\nClear Limit and retry\n");
        persist.UserData[P_NOTIFY] = 0; // clear the Notify cmd
    } else
    #else

    // start by checking the limit switches. If any limit switch is active then don't home
    if((ReadBit(X_LIMIT) == LIM_AT_LIM) || (ReadBit(Y_LIMIT) == LIM_AT_LIM) || (ReadBit(Z_LIMIT) == LIM_AT_LIM))
    {
        printf("Axis on Limit! cannot Proceed\nClear Limit and retry\n");
        persist.UserData[P_NOTIFY] = 0; // clear the Notify cmd
    } else

    #endif
    {

        switch(pmsg)
        {
            case T2_HOME_X : Home_Axis(X_AXIS, X_HOME, ENC_X_R);
                            Zero(X_AXIS);   // Zero Axis
                            break;
            case T2_HOME_Y : Home_Axis(Y_AXIS, Y_HOME, ENC_Y_R);
                            Zero(Y_AXIS);   // Zero Axis
                            break;
            case T2_HOME_Z : Home_Axis(Z_AXIS, Z_HOME, ENC_Z_R);
                            Zero(Z_AXIS);   // Zero Axis
                            break;
        //    case T2_HOME_A : Home_Axis(A_AXIS, A_HOME, ENC_A_R);
        //                    Zero(A_AXIS);   // Zero Axis
        //                    break;  
            case T2_HOME_SPINDLE : Spindle_Home();
                            break; 
            case T2_HOME_ALL : Home_All_Axis();
                            break;
            default : break;

        }  
        if((persist.UserData[P_STATUS] & HOME_STATUS_MASK) == 0) 
        {
            SetPStatusBit(SB_HOME); //persist.UserData[P_STATUS] |= _BV(SB_HOME);  // if all the bits are cleared then set the SB_HOME Bit to indicate homed
        }   
        persist.UserData[P_NOTIFY] = 0; // clear the command. 
    }


}

void Home_All_Axis(void)
{
    printf("Home All\n");
    persist.UserData[P_MPG_RESYNC] = TRUE;
    // start with the Z axis, then do the Y axis and finally the X axis
    Home_Axis(Z_AXIS, Z_HOME, ENC_Z_R);
    Zero(Z_AXIS);   // Zero Axis
    Home_Axis(Y_AXIS, Y_HOME, ENC_Y_R);
    Zero(Y_AXIS);   // Zero Axis
    Home_Axis(X_AXIS, X_HOME, ENC_X_R);
    Zero(X_AXIS);   // Zero Axis
    Spindle_Home();
    SpindleDisable();   // disable the spindle after homing. - do this here because Spindle home is also used for tool changing 
}

void Home_Axis(int Axis, int Home, int Index)
{

    // Skip if the axis is disabled!
    if(CheckDone(Axis) != CD_AXIS_DISABLED)    // skip if axis is disabled
    {
        #ifdef TESTBED
            // just clear the appropriate bit in the P_STATUS variable - 1 = not homed, 0 = homed
            persist.UserData[P_STATUS] &= ~(1 << (Axis + 16));
            printf("Axis %d Homed\n", Axis);
        #else

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
        // clear the appropriate bit in the P_STATUS variable - 1 = not homed, 0 = homed
        ClearPStatusBit(Axis + SB_HOME_POS); // persist.UserData[P_STATUS] &= ~(1 << (Axis + 16));
        // is Index set again?
        #endif
    }
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
            #ifdef TESTBED
                switch (pAxis)
                {
                    case X_AXIS : persist.UserData[P_STATUS] |= _BV(SB_X_LIMIT); break;
                    case Y_AXIS : persist.UserData[P_STATUS] |= _BV(SB_Y_LIMIT); break;
                    case Z_AXIS : persist.UserData[P_STATUS] |= _BV(SB_Z_LIMIT); break;
                    default : break;
                }
                printf("Limit Backoff axis %d status: %4X\n", pAxis, persist.UserData[P_STATUS]);
            #else
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
            #endif
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
void Spindle_Cmd(int pmsg)
{
    switch (pmsg)
    {
        case T2_SPINDLE_EN : SpindleEnable();
                    break;
        case T2_SPINDLE_DIS : SpindleDisable();
                    break;
        case T2_SPINDLE_CW : Spindle_CW(persist.UserData[P_NOTIFY_ARGUMENT]);
                    break;
        case T2_SPINDLE_CCW : Spindle_CCW(persist.UserData[P_NOTIFY_ARGUMENT]);
                    break;
        case T2_SPINDLE_STOP : Spindle_Stop();
                    break;
        //case T2_SPINDLE_HOME : break;
        case T2_SPINDLE_ZERO : Spindle_Home(); 
                    break;
        case T2_SPINDLE_PID : SetSyncSpindle();
                    break;
        case T2_SPINDLE_RPM : SetRPMSpindle();
                    break;
        default : break;
    }
    persist.UserData[P_NOTIFY] = 0; // indicate that the command has compleated
}

// Axis Commands
void Axis_Cmd(int pmsg)
{
    switch(pmsg)
    {
        case T2_X_AXIS_EN : EnableAxis(X_AXIS); break;
        case T2_X_AXIS_DIS : DisableAxis(X_AXIS); break;
        case T2_Y_AXIS_EN : EnableAxis(X_AXIS); break;
        case T2_Y_AXIS_DIS : DisableAxis(X_AXIS); break;
        case T2_Z_AXIS_EN : SetBit(Z_BRAKE);    // release the Z Brake and enable the axis
                        EnableAxis(Z_AXIS); 
                        break; 
        case T2_Z_AXIS_DIS : ClearBit(Z_BRAKE); // set the Z Brake and disable the axis
                        DisableAxis(Z_AXIS); 
                        break;
        case T2_A_AXIS_EN : EnableAxis(X_AXIS); break;
        case T2_A_AXIS_DIS : DisableAxis(X_AXIS); break;
        case T2_B_AXIS_EN : EnableAxis(X_AXIS); break;
        case T2_B_AXIS_DIS : DisableAxis(X_AXIS); break;
        case T2_C_AXIS_EN : EnableAxis(X_AXIS); break;
        case T2_C_AXIS_DIS : DisableAxis(X_AXIS); break;
        default : break;
    }
    persist.UserData[P_NOTIFY] = 0; // indicate that the command has compleated
}

