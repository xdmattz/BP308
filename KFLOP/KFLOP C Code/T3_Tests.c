#pragma TI_COMPILER // (optimization) or (optimization, size)
// of course use the TI Compiler!
// 
// BP308_Home
// this program contains all the functions that don't run all the time, but run once and terminate.
// it is intended that this program run in Thread 2, but if thread 1 gets too big, it may be
// necessary to run it in Thread 3 and let Thread 1 overrun Thread 2's code space. 

#include "KMotionDef.h"
#include "T3_Tests.h"

int main()
{
    if(persist.UserData[0] == 0)
    {
        if(persist.UserData[99] != 0xffffffff)
        {
            // if here then [99] must have a valid RPM number
            printf("S code RPM = %f\n", *(float *)&persist.UserData[99]);
            persist.UserData[99] = 0xffffffff;
        } else {
            // look in userdata 100
            printf("In Thread from M119 UserData = %d\n", persist.UserData[100]);
            persist.UserData[100] = 0;
        }
    } else if(persist.UserData[0] == 100)
    {
        printf("Thread 3 Init!\n");
        persist.UserData[99] == 0xffffffff; // set [99] to some number that could never be RPM
    } else 
    {
    printf("In Thread 3\n");
    printf("1:%d 2:%f 3:%f\n", 
    persist.UserData[0],
    *(float *)&persist.UserData[1], 
    *(float *)&persist.UserData[2]);

    // clear the persist user data variables
    persist.UserData[0] = 0;
    persist.UserData[1] = 0;
    persist.UserData[2] = 0;
    }
    
    return 0;

}