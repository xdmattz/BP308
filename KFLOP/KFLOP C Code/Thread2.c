#include "KMotionDef.h"

// Defines axis 0, 1, 2 as simple step dir outputs
// enables them
// sets them as an xyz coordinate system for GCode

int main() 
{
	float a;
	int b = 0;
	// do something simple -- forever
	a = Time_sec();
	for(;;)
	{
		WaitNextTimeSlice(); 
		if(Time_sec() > (a + 2.0))
		{
			printf("In Thread 2\n");
			a = Time_sec();
		}
	}

    return 0;
}
