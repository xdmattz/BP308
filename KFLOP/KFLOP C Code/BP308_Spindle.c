#include "KMotionDef.h"
#include "BP308_Spindle.h"
#include "BP308_IO.h"

#define SPINDLE_PERIOD 0.200 // calcualte RPM every 200ms

void ServiceSpindleCount(void)
{
  static double Prev_Spindle_Count = 0;
  static double SpindleTime = 0;

    if (Time_sec() > SpindleTime)
    {
      SpindleTime = Time_sec() + SPINDLE_PERIOD;      // check the elapsed time for time tick
      double Spin_Delta = fast_fabs(Prev_Spindle_Count - chan[SPINDLE_AXIS].Position);
      Prev_Spindle_Count = chan[SPINDLE_AXIS].Position;
      double RPM = (Spin_Delta * 60.0) / (SP_ENC_RES * SPINDLE_PERIOD);   // (difference * 60) / (SP_Encoder resolution * Period)  = RPM
      persist.UserData[P_SPINDLE_RPM] = (int) (RPM);

#ifdef TESTBED
    // if on the test bed then derive the spindle RPM from DAC7 value.
    

#endif     

      // write the spindle value to the KMotionCNC screen

    }


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
