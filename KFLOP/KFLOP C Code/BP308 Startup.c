#include "KMotionDef.h"
#include "BP308 Axis Init.h"
#include "BP308_IO.h"
#include "BP308 Startup.h"
#include "BP308_MPG.h"
#include "BP308 Serial.h"
#include "BP308 Spindle.h"


main()
{

	double P0, P1, P2, P3, P4;
	double Elapsed_Time;
    double MS10_Timer;      // timer for 10ms events

	// Initialize everything

	InitAux();
	AddKonnect(0,&VirtualBits,VirtualBitsEx);	// start the Konnect
	
	printf("Konnect Started!\n");
	Init_BP308_Serial();
	
	
	// Initialize the DAC outputs for all the axis
	
	DAC(X_AXIS, -36);
	DAC(Y_AXIS, -36);
	DAC(Z_AXIS, -36);
	DAC(A_AXIS, -36);
	DAC(SPINDLE_AXIS, -152);
	
	
	
	// Init_X_Axis();

	
    Elapsed_Time = Time_sec();
    MS10_Timer = Time_sec();

    // main loop - where all the action happens - runs forever - or until the universe ends.
	for (;;)
    {
		WaitNextTimeSlice();    // always start on a new time slice
		// check the E-Stop button
        if(ReadBit(ESTOP) == ESTOP_ACTIVE)
        {
            ESTOP_Loop();   // go to the ESTOP Loop.
        }
        else
        {
            // check the serial port for an input
            if(pRS232RecIn != pRS232RecOut)
            {
                // there is a received character! go see what it is!
                SerialPort_Manager();
			}
            if((Time_sec() - MS10_Timer) > MS10_Time)
            {
                MS10_Timer = Time_sec();    // reset the timer
                // do the fucntions that happen every 10ms time tick
                Periodic_Processes();
                //printf("Tick time = %f\n", Time_sec());
            }
            ServiceSpindleCount();  // manage the Spindle encoder count for MACH3 spindle speed display
            ServiceMPG();           // manage the MPG 
            // 
            static int dsp_cnt = 0;
            if((Time_sec() - Elapsed_Time) > 1.0) // print out the current position
            {
                Elapsed_Time = Time_sec();
                P0 = chan[X_AXIS].Position;
                P1 = chan[Y_AXIS].Position;
                P2 = chan[Z_AXIS].Position;
                P3 = chan[A_AXIS].Position;
                P4 = chan[SPINDLE_AXIS].Position;
                printf("C = %d X = %f,  Y = %f,  Z = %f,  A = %f,  SP = %f\n", dsp_cnt++, P0, P1, P2, P3, P4);
            }
        }
    }
}

void ESTOP_Loop(void)
{
    // shut everything down? or at least disable the axis. 
    // If the program is here then something has triggered the ESTOP. On the BP308 this means that the relay has been engaged
    // and the Siemens Drive has been completely disabled. 
    // the only way to recover from this is probably to start over and re-home the machine. 
	printf("*** ESTOP! ***\n");
	// make sure that everything is stopped!
	// the only way out of this is to reset the ESTOP switch and re-run the Init program (RESET in MACH3)!
	if (ch0->Enable) DisableAxis(0);  // axis still enabled?  - Disable it
	if (ch1->Enable) DisableAxis(1);  // ditto
	if (ch2->Enable) DisableAxis(2);  
	if (ch3->Enable) DisableAxis(3);  
	if (ch4->Enable) DisableAxis(4);  
	if (ch5->Enable) DisableAxis(5); 
	if (ch6->Enable) DisableAxis(6);  
	if (ch7->Enable) DisableAxis(7);

    for(;;) // for now, just sit here forever.
    {
        WaitNextTimeSlice();
        if(ReadBit(ESTOP) == ESTOP_RUN)
        {
            // when we come back online after ESTOP then what?
        }
    }
}


// Serial Port receive manager
// manages all the incomming  serial messages and processes them
void SerialPort_Manager(void)
{
    char c;
    // read the serial port 
    while(pRS232RecIn != pRS232RecOut)
    {
        c = RS232_GetChar();

 //       if((c & 0xff) == 0xe2)
 //       {
 //       	printf("Received! 0x%2X\n", c);
 //       }
 
		if(RxMsg.msg_cntr == 0)
		{
			if((c & 0xff) == MSG_RET_START_CMD)
			{
				RxMsg.msg_cntr = 1;
			}
		}
		else if (RxMsg.msg_cntr == 1)
		{
			RxMsg.msg_cnt = (c & 0xff);	// make sure the count doesn't have all the extra bits on it...
			if(RxMsg.msg_cnt >= SERIAL_MSG_LEN)
			{
				RxMsg.msg_cntr = 0;	// reset the count
			}
			else
			{
				RxMsg.msg[RxMsg.msg_cntr++] = (c & 0xff);
			}
		}
		else if (RxMsg.msg_cntr < RxMsg.msg_cnt)
		{
			RxMsg.msg[RxMsg.msg_cntr++] = (c & 0xff);
		}
		else if(RxMsg.msg_cntr == RxMsg.msg_cnt)
		{
			RxMsg.msg[RxMsg.msg_cntr] = (c & 0xff);
			SerMsgParse();
			RxMsg.msg_cntr = 0;
		}
		else
		{
			RxMsg.msg_cntr = 0;
		}
        
 //       RS232_PutChar(c);
 //       if(c == 0xe2)
 //       {
 //       	printf("0x%X\n", c);
 //       }

    }

}

// Periodic Processes
// this gets called every 10ms
void Periodic_Processes(void)
{
    static int ProcessCnt = 0;

//	printf("P_Process Cnt = %ld\n", ProcessCnt);
    // check for pending query responses
    // if it has been too long then flag an error
    // if a particular device has missed more than XX querys, then shut down the device - ie. don't query any more and flag it as disabled
    if(ProcessCnt == 18)
    {
  //  	Send_Serial_Query(MsgTest1);
    }
    if(ProcessCnt == 36)
    {
 //   	Send_Serial_Query(MsgTest2);
    }
    if(ProcessCnt++ >= 99)
    {
        ProcessCnt = 0; // reset the counter 
        Send_Serial_Query(StatusQuery);
    }
    // stagger the querys so that they don't all happen at once.
    // query the MPG every 50ms for the current switch state, and state of its ESTOP button
    // query the TLAUX board every 50 ms to detemine it's state - 
}

