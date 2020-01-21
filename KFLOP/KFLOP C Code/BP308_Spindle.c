#include "KMotionDef.h"
#include "BP308_Spindle.h"

void ServiceSpindleCount(void)
{
    // do nothing for now...
}

void Tool_Change(void)
{
    // make sure nothing is in motion and the spindle is not moving
    // if the HostStatus bit is active then don't do anything with the MPG
    if((HostStatus & HOST_JOB_ACTIVE_BIT) == 0)
    {
  //      if(ReadBit(To))
    }
}
