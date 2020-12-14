#pragma TI_COMPILER // (optimization) or (optimization, size)
// of course use the TI Compiler!

#include "KMotionDef.h"
#include "PC-DSP.h"
#include "BP308_Persist.h"
#include "BP308_IO.h"
#include "BP308_Notify_Cmds.h"
#include "BP308_Thread3_S_Cmd.h"


 main()
{
    printf("In Thread 3\n");
    printf("Spindle Speed = %f, or %d RPM\n", *(float *)&persist.UserData[P_SPINDLE_RPM_CMD], (int)(persist.UserData[P_SPINDLE_RPM_CMD]));   // get the speed variable
    // if the spindle is already running then
    if((persist.UserData[P_STATUS] & _BV(SB_SPINDLE_CW)) != 0)
    {
    // if CW Call Thread 2 with CW command
        persist.UserData[P_NOTIFY] = T2_SPINDLE_CW;
        StartThread(2);

        // wait for P_NOTIFY to clear
        WaitForT2Done(3.0); // wait for up to 3 seconds.
    }
    else if((persist.UserData[P_STATUS] & _BV(SB_SPINDLE_CCW)) != 0)
    {
    // if CCW Call Thead 3 with CCW command
        persist.UserData[P_NOTIFY] = T2_SPINDLE_CCW;
        StartThread(2);

        // wait for P_NOTIFY to clear
        // So why do this here? shouldn't we already be done? 
        // I think that doing this will help prevent the command from being sent more than once.
        WaitForT2Done(3.0); // wait for up to 3 seconds.
    }
}

int WaitForT2Done(double WaitTime)
{
    double elapsedTime;
    elapsedTime = Time_sec() + WaitTime;
    while(persist.UserData[P_NOTIFY] != 0)
    {
        if (Time_sec() > elapsedTime)
        {
            printf("Waiting for T2 Timeout!");
            return FALSE;
        }
        WaitNextTimeSlice();
    }
    return TRUE;
}
