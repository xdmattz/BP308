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
#include "BP308_Notify_Cmds.h"
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
        case T2_SEL_TOOL : Select_Tool(msg);    // carousel rotate
                    break;
        case T2_TOOL_CLAMP : Tool_Clamp(msg);   // all other TLAUX functions
                    break;  
        case T2_SPINDLE : Spindle_Cmd(msg);
                    break;  
        case T2_PROBE : Probe_Cmd(msg);
        default: break;
    }
    persist.UserData[P_NOTIFY] = 0; // clear the Notify cmd - Indicates that the thread is done. only do this here! - all others have been commented out.
    printf("Thread 2 Done msg = %4X\n", msg);
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
//        persist.UserData[P_NOTIFY] = 0; // clear the Notify cmd
    } else
    #else

    // start by checking the limit switches. If any limit switch is active then don't home
    if((ReadBit(X_LIMIT) == LIM_AT_LIM) || (ReadBit(Y_LIMIT) == LIM_AT_LIM) || (ReadBit(Z_LIMIT) == LIM_AT_LIM))
    {
        printf("Axis on Limit! cannot Proceed\nClear Limit and retry\n");
//        persist.UserData[P_NOTIFY] = 0; // clear the Notify cmd
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
//        persist.UserData[P_NOTIFY] = 0; // clear the command. 
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
            WaitAxis(Axis); // wait for the move to finish
        }
        Jog(Axis, HOME_VEL_1);
        while(ReadBit(Home) == HOME_NOT_HOME)       // move until Home switch detects.
        {
            WaitNextTimeSlice();
        }
        Jog(Axis, 0);
        WaitAxis(Axis); // wait for the stop
        Jog(Axis, -(HOME_VEL_2));   // backup until off the home switch ie. until it undetects
        while(ReadBit(Home) == HOME_AT_HOME)
        {
            WaitNextTimeSlice();
        }
        Jog(Axis, 0);
        WaitAxis(Axis);
        Jog(Axis, HOME_VEL_2);  // move back to the home switch slowly - at HOME_VEL_2 until it detects again.
        // there seems to be about 0.09" hysteresis on the switches.
        while(ReadBit(Home) == HOME_NOT_HOME)
        {
            WaitNextTimeSlice();
        }
        Jog(Axis, 0); // stop the axis
        WaitAxis(Axis);
        Jog(Axis, (HOME_VEL_3));    // move slowly until Index is set.
        while(ReadBit(Index) == INDEX_NOT_INDEX)
        {
            WaitNextTimeSlice();
        }
        home_pos = chan[Axis].Dest;     // record the index location
        Jog(Axis,0);    // stop the motion
        WaitAxis(Axis);
        MoveAtVel(Axis, home_pos, HOME_VEL_3);
        WaitAxis(Axis);
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
    	printf("In Limit Backoff\nAxis = %d, Dir = %f, LimSwitch = %d\n", pAxis, pDir, LimSwitch);
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
                    WaitAxis(pAxis);
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
//    persist.UserData[P_NOTIFY] = 0;     // clear the P_NOTIFY cmd so it can't accidently be called twice  
}

// Tool Changer routines

void Select_Tool(int pmsg)
{
    // wait for the remote command bit to clear
    if(WaitForRemoteDone(2.0) == TRUE)
    {
        persist.UserData[P_REMOTE_CMD] = (RC_TLAUX_CAROUSEL_CMD & CMD_MASK) | (pmsg & ARG_MASK); // remote command to rotate tool carousel
    }
}

void Tool_Clamp(int pmsg)
{
    // wait for the remote command bit to clear
    if(WaitForRemoteDone(2.0) == TRUE)
    {
       persist.UserData[P_REMOTE_CMD] = (RC_TLAUX_CLAMP_CMD & CMD_MASK) | (pmsg & ARG_MASK);   // remote command to TLAUX
    }
}

int WaitForRemoteDone(double delay)
{
    double elapsed_time;
    elapsed_time = Time_sec() + delay;
    while(persist.UserData[P_REMOTE_CMD] != 0)
    {
        WaitNextTimeSlice();
        if(Time_sec() > elapsed_time)
        { return FALSE; }
    }
    return TRUE;
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
        case T2_SPINDLE_ZERO : xSpindle_Home(); 
                    break;
        case T2_SPINDLE_PID : xSpindle_PID(); // a little more checking here?
                    break;
        case T2_SPINDLE_RPM : xSpindle_RPM(); 
                    break;
        default : break;
    }
//    persist.UserData[P_NOTIFY] = 0; // indicate that the command has compleated
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
//    persist.UserData[P_NOTIFY] = 0; // indicate that the command has compleated
}

// Probe Commands
void Probe_Cmd(int pmsg)
{
    // clear the probe status bits
    persist.UserData[P_STATUS] &= ~(SB_PROBE_STATUS_MASK);

    switch(pmsg)
    {
        case T2_PROBE_X : Probe_Axis(X_AXIS); break;
        case T2_PROBE_Y : Probe_Axis(Y_AXIS); break;
        case T2_PROBE_Z : Probe_Axis(Z_AXIS); break;
        case T2_PROBE_A : Probe_Axis(A_AXIS); break;
        case T2_PROBE_XYZ : Probe_XYZ(); break;
        case T2_TOOLSET : ToolSet(); break;
        default : break;
    }
}

// the probe command will move (Jog) in the Axis direction at the rate passed in P_NOTIFY_ARGUMENT1 
// until either the probe detects, or the timeout - passed in P_NOTIFY_ARGUMENT4 expires.
// it is the responsibility of the calling function on the PC program to determine the velocity and 
// direction (+/-) and the timeout - which also determines the max distance 
// on probe detect the motion stops, backs up, and probes again slowly (double touch) ending up right
// at the touch point.
//  when completed, the status bit SB_PROBE or SB_PROBE_TIMEOUT are set in the status register 

void Probe_Axis(int Axis)
{
    // jog at the velocity indicated. 
    // move until timeout or probe detect. 
    float JogSpeed = *(float *)&persist.UserData[P_NOTIFY_ARGUMENT1];
    float Timeout = *(float *)&persist.UserData[P_NOTIFY_ARGUMENT4];
    double ProbePos;

// print out the speed and timeout
    printf("speed = %f, Timeout = %f\n", JogSpeed, Timeout);
    double printtime = Time_sec() + 1.0;
    printf("Current Time = %lf\n", Time_sec());

    if(ReadBit(TOUCH_PROBE) != TOUCH_NORMAL)
    {
        ClearPStatusBit(SB_PROBE_DETECT);   // probe not detected
        persist.UserData[P_NOTIFY_ARGUMENT1] = 0;
        persist.UserData[P_NOTIFY_ARGUMENT4] = 0; 
        printf("Probe not connected\n");
        return;
    }

    double TimeoutTime = Time_sec() + (double)Timeout;
    Jog(Axis, (double)JogSpeed);

    while(ReadBit(TOUCH_PROBE) != TOUCH_ACTIVE)  // check the probe bit to activate
    {
        int count = 0;
        WaitNextTimeSlice();
        if(Time_sec() > TimeoutTime)
        {
            if(Time_sec() > printtime)
            {
                count++;
                printtime += 1.0;
                printf("In waiting, time = %d\n", count);
            }
            Jog(Axis, 0);   // stop the axis
            printf("Jog stopped\n");
            SetPStatusBit(SB_PROBE_TIMEOUT); // set the timeout bit
            return; //
        }
    }
    Jog(Axis, 0);
    WaitAxis(Axis); // wait for it to stop.
    printf("Detected\n");
    Jog(Axis, (double) (-JogSpeed));
    while(ReadBit(TOUCH_PROBE) != TOUCH_NORMAL) // move till the probe un-detects - normal operation
    {
        WaitNextTimeSlice();
    }
    Delay_sec(BACKUP_TIME); // let it move just a little bit more...
    Jog(Axis, 0);
    WaitAxis(Axis);
    if(JogSpeed > 0)
    {
        if(Axis == Z_AXIS)
        {Jog(Axis, HOME_VEL_Z);}
        else {Jog(Axis, HOME_VEL_3);}   // different rate for the Z axis
    } else
    {
        if(Axis == Z_AXIS)
        {Jog(Axis, -HOME_VEL_Z);}
        else {Jog(Axis, -HOME_VEL_3);}  // different rate for the Z axis
    }

    TimeoutTime = Time_sec() + RETOUCH_TIME;
    while(ReadBit(TOUCH_PROBE) != TOUCH_ACTIVE)
    {
        WaitNextTimeSlice();
        if(Time_sec() > TimeoutTime)
        {
            ClearPStatusBit(SB_PROBE_DETECT);
            SetPStatusBit(SB_PROBE_TIMEOUT);
            Jog(Axis,0);    // stop the motion
            // clear out the notify arguments so the command doesn't repeat accidently.
            persist.UserData[P_NOTIFY_ARGUMENT1] = 0;
            persist.UserData[P_NOTIFY_ARGUMENT4] = 0;
            return;
        }
    }
    ProbePos = chan[Axis].Dest;
    Jog(Axis, 0);
    WaitAxis(Axis);
    Move(Axis,ProbePos);
    WaitAxis(Axis);
    SetPStatusBit(SB_PROBE_DETECT);
    // clear out the notify arguments so the command doesn't repeat accidently.
    persist.UserData[P_NOTIFY_ARGUMENT1] = 0;
    persist.UserData[P_NOTIFY_ARGUMENT4] = 0;
}

void Probe_XYZ(void)
{

    if(ReadBit(TOUCH_PROBE) != TOUCH_NORMAL)
    {
        ClearPStatusBit(SB_PROBE_DETECT);   // probe not detected
        persist.UserData[P_NOTIFY_ARGUMENT1] = 0;
        persist.UserData[P_NOTIFY_ARGUMENT2] = 0;
        persist.UserData[P_NOTIFY_ARGUMENT3] = 0;
        persist.UserData[P_NOTIFY_ARGUMENT4] = 0; 
        printf("Probe not connected\n");
        return;
    }
    // jog at the velocity indicated. 
    // move until timeout or probe detect. 
    float JogSpeed_X = *(float *)&persist.UserData[P_NOTIFY_ARGUMENT1];
    float JogSpeed_Y = *(float *)&persist.UserData[P_NOTIFY_ARGUMENT2];
    float JogSpeed_Z = *(float *)&persist.UserData[P_NOTIFY_ARGUMENT3];
    float Timeout = *(float *)&persist.UserData[P_NOTIFY_ARGUMENT4];
    double ProbePosX, ProbePosY, ProbePosZ;

    double TimeoutTime = Time_sec() + (double)Timeout;
    Jog(X_AXIS, (double)JogSpeed_X);
    Jog(Y_AXIS, (double)JogSpeed_Y);
    Jog(Z_AXIS, (double)JogSpeed_Z);
    while(ReadBit(TOUCH_PROBE) != TOUCH_ACTIVE)  // check the probe bit to activate - !!!*** need to figure out polarity of this  ***!!!
    {
        WaitNextTimeSlice();
        if(Time_sec() > TimeoutTime)
        {
            Jog(X_AXIS, 0);   // stop all axis
            Jog(Y_AXIS, 0);
            Jog(Z_AXIS, 0);
            SetPStatusBit(SB_PROBE_TIMEOUT); // set the timeout bit
            return; //
        }
    }
    Jog(X_AXIS, 0);   // stop all axis
    Jog(Y_AXIS, 0);
    Jog(Z_AXIS, 0);
    WaitAxis(X_AXIS); // wait for all axis to be stopped
    WaitAxis(Y_AXIS); 
    WaitAxis(Z_AXIS); 
    Jog(X_AXIS, (double) (-JogSpeed_X/2));
    Jog(Y_AXIS, (double) (-JogSpeed_Y/2));
    Jog(Z_AXIS, (double) (-JogSpeed_Z/2));

    while(ReadBit(TOUCH_PROBE) != TOUCH_NORMAL) // move till the probe un-detects
    {
        WaitNextTimeSlice();
    }
    Delay_sec(BACKUP_TIME); // let it move just a little bit more...
    Jog(X_AXIS, 0);   // stop all axis
    Jog(Y_AXIS, 0);
    Jog(Z_AXIS, 0);
    WaitAxis(X_AXIS); // wait for all axis to be stopped
    WaitAxis(Y_AXIS); 
    WaitAxis(Z_AXIS); 
    Jog(X_AXIS, (double) (JogSpeed_X / 8)); // jog back at 1/8 speed
    Jog(Y_AXIS, (double) (JogSpeed_Y / 8));
    Jog(Z_AXIS, (double) (JogSpeed_Z / 8));

    TimeoutTime = Time_sec() + RETOUCH_TIME;
    while(ReadBit(TOUCH_PROBE) != TOUCH_ACTIVE)
    {
        WaitNextTimeSlice();
        if(Time_sec() > TimeoutTime)
        {
            ClearPStatusBit(SB_PROBE_DETECT);
            SetPStatusBit(SB_PROBE_TIMEOUT);
            Jog(X_AXIS,0);    // stop the motion
            Jog(Y_AXIS,0);    // stop the motion
            Jog(Z_AXIS,0);    // stop the motion
            // clear out the notify arguments so the command doesn't repeat accidently.
            persist.UserData[P_NOTIFY_ARGUMENT1] = 0;
            persist.UserData[P_NOTIFY_ARGUMENT2] = 0;
            persist.UserData[P_NOTIFY_ARGUMENT3] = 0;
            persist.UserData[P_NOTIFY_ARGUMENT4] = 0;
            return;
        }
    }
    ProbePosX = chan[X_AXIS].Dest;
    ProbePosY = chan[Y_AXIS].Dest;
    ProbePosZ = chan[Z_AXIS].Dest;
    Jog(X_AXIS, 0);   // stop all axis
    Jog(Y_AXIS, 0);
    Jog(Z_AXIS, 0);
    WaitAxis(X_AXIS); // wait for all axis to be stopped
    WaitAxis(Y_AXIS); 
    WaitAxis(Z_AXIS);

    MoveXYZABC(ProbePosX, ProbePosY, ProbePosZ, 0, 0, 0);
    WaitAxis(X_AXIS); // wait for all axis to be stopped
    WaitAxis(Y_AXIS); 
    WaitAxis(Z_AXIS);

    SetPStatusBit(SB_PROBE_DETECT);

    // clear out the notify arguments so the command doesn't repeat accidently.
    persist.UserData[P_NOTIFY_ARGUMENT1] = 0;
    persist.UserData[P_NOTIFY_ARGUMENT2] = 0;
    persist.UserData[P_NOTIFY_ARGUMENT3] = 0;
    persist.UserData[P_NOTIFY_ARGUMENT4] = 0;
}
void ToolSet(void)
{
    // move in the -Z direction until the tool setter is activated
    // This assumes that the X and Y positions of the TOOL setter are already at the correct location
    // and that the Z axis has been moved to an appropriate height above the tool setter.
    // Z direction and timeout are passed in the P_NOTIFY_ARGUMENT variables.

    float JogSpeed = *(float *)&persist.UserData[P_NOTIFY_ARGUMENT1];
    float Timeout = *(float *)&persist.UserData[P_NOTIFY_ARGUMENT4];

    // first make sure the tool setter is plugged in
    if(ReadBit(TOOL_SETTER) != TOOL_SETTER_NORMAL)
    {
        // Clear the persist variables
        persist.UserData[P_NOTIFY_ARGUMENT1] = 0;
        persist.UserData[P_NOTIFY_ARGUMENT2] = 0;
        persist.UserData[P_NOTIFY_ARGUMENT3] = 0;
        persist.UserData[P_NOTIFY_ARGUMENT4] = 0;
        ClearPStatusBit(SB_PROBE_DETECT);   
        return;
    }

    double TimeoutTime = Time_sec() + (double)Timeout;
    double ToolPosition;

    // move until the tool setter detects
    Jog(Z_AXIS, (double)JogSpeed);
    while(ReadBit(TOOL_SETTER) != TOOL_SETTER_ACTIVE)
    {
        WaitNextTimeSlice();
        if(Time_sec() > TimeoutTime)
        {
            Jog(Z_AXIS, 0);
            SetPStatusBit(SB_PROBE_TIMEOUT); // set the timeout bit
            return; //
        }
    }
    Jog(Z_AXIS, 0);
    WaitAxis(Z_AXIS);
    Jog(Z_AXIS, (double)(-JogSpeed));
    while(ReadBit(TOOL_SETTER) != TOOL_SETTER_NORMAL)   // back up until switch releases
    {
        WaitNextTimeSlice();
    }
    Delay_sec(BACKUP_TIME);   // let it move just a little bit more
    Jog(Z_AXIS, 0);
    WaitAxis(Z_AXIS);
    Jog(Z_AXIS, -HOME_VEL_Z); 

    TimeoutTime = Time_sec() + RETOUCH_TIME;
    while(ReadBit(TOOL_SETTER) != TOOL_SETTER_ACTIVE)
    {
        WaitNextTimeSlice();
        if(Time_sec() > TimeoutTime)
        {
            Jog(Z_AXIS, 0);   // stop the Z axis
            SetPStatusBit(SB_PROBE_TIMEOUT); // set the timeout bit
            return; //
        }        
    }
    ToolPosition = chan[Z_AXIS].Dest;
    Jog(Z_AXIS, 0);
    WaitAxis(Z_AXIS);
    Move(Z_AXIS, ToolPosition);
    WaitAxis(Z_AXIS);
    
    SetPStatusBit(SB_PROBE_DETECT);
    
    // clear out the notify arguments so the command doesn't repeat accidently.
    persist.UserData[P_NOTIFY_ARGUMENT1] = 0;
    persist.UserData[P_NOTIFY_ARGUMENT4] = 0;

}

