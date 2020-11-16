#include "KMotionDef.h"
#include "PC-DSP.h"

#include "BP308_IO.h"
#include "BP308_Hardware.h"
#include "BP308_Persist.h"
#include "BP308_Serial.h"


void Init_BP308_Hardware(void)
{
    Init_TestPoints();
    // initialize all the IO
    // Init_Kanalog_IO();  // initialize the IO   - these should already be defined as inputs and outputs
    // Init_Konnect_IO();

    // get the current status and set the status register
    HardwareQuery();

    // enable the oiler
    SetBit(OIL_LUBE);

    // if everything is OK - or at lease acceptable
    // Engage the ESTOP relay
    // pause
    // look for axis fault from the Siemens Drive
    // initialize axis
    // home the tool holder
    // what do we do if on the limit switches?
    // release the z-brake
    // now the MPG should be able to be active, and grab and release tools, but not access tools untill after a home routine has run.
}

void HardwareQuery(void)
{
    // Don't clear the user status !
    // persist.UserData[P_STATUS] &= 0;
    TLAUX_Query();
    // test it!
    if ((persist.UserData[P_STATUS] & _BV(SB_TLAUX_PRES)) == 0) printf(" No TLAUX Present\n");
    else printf(" TLAUX Response!\n");
    if((persist.UserData[P_STATUS] & _BV(SB_TLAUX_OK)) == 0) printf(" TLAUX Fault\n");
    else printf(" TLAUX OK!\n");
    
    MPG_Query();
    if ((persist.UserData[P_STATUS] & _BV(SB_MPG_PRES)) == 0) printf(" No MPG Present\n");
    else printf(" MPG Response!\n");
    if ((persist.UserData[P_STATUS] & _BV(SB_MPG_OK)) == 0) printf(" MPG Fault\n");
    else printf(" MPG OK!\n");


    CheckHW(SB_AIR_OK, AIR_MON, AIR_MON_OK ,MS_Timeout);   // Air sensor check
    if ((persist.UserData[P_STATUS] & _BV(SB_AIR_OK)) == 0) printf(" No Air Pressure\n");
    else printf(" Air OK\n");

    CheckHW(SB_OIL_OK, LUBE_MON, LUBE_MON_OK, MS_Timeout);  // Oil level check
    if ((persist.UserData[P_STATUS] & _BV(SB_OIL_OK)) == 0) printf(" Oil LOW\n");
    else printf(" Oil OK\n");

    // check to see if on the limit switches.
    Limit_Check();

    SetBit(ESTOP_RELAY);        // turn on the ESTOP relay
    CheckHW(SB_ESTOP, ESTOP, ESTOP_OK, ESTOP_DELAY_TIMEOUT);
    if((persist.UserData[P_STATUS] & _BV(SB_ESTOP)) == 0)
    {
        printf("ESTOP ERROR - ESTOP Relay Disabled!\n");
        ClearBit(ESTOP_RELAY);
    }
    else printf("ESTOP OK\n");

    CheckHW(SB_PWR_MODULE_OK, POWER_MODULE_READY, POWER_MODULE_OK ,PWR_MOD_READY_TIMEOUT);  // check the power module ready 
    if((persist.UserData[P_STATUS] & _BV(SB_PWR_MODULE_OK)) == 0) printf(" Power Module Fault!\n");
    else printf("Power Module OK\n");

    SetBit(SPINDLE_ENABLE);
    // pause for a few ms
    Delay_sec(0.15);
    CheckHW(SB_SPINDLE_OK, SPINDLE_FAULT, SPINDLE_FAULT_OK, SPINDLE_READY_TIMEOUT);
    if((persist.UserData[P_STATUS] & _BV(SB_SPINDLE_OK)) == 0) printf("Spindle Module Fault\n");
    else printf("Spinlde Module OK\n");
    ClearBit(SPINDLE_ENABLE);

}

void TLAUX_Query(void)
{
    float ElapsedTime;
    SetPBit(P_SERIAL_PENDING, SP_TLAUX_QUERY); // persist.UserData[P_SERIAL_PENDING] |= (_BV(SP_TLAUX_QUERY));    // set the query pending bit - to be cleared by the query message handler
    persist.UserData[P_TLAUX_STATUS] = 0;
    ClearPStatusBit(SB_TLAUX_PRES); // persist.UserData[P_STATUS] &= ~(_BV(SB_TLAUX_PRES));    // clear the TLAUX Present Bit
    Send_Serial(TLAUX_StatusQuery);  // send a TLAUX status query
    ElapsedTime = Time_sec() + QUERY_TIMEOUT;
    SetBit(TP1);
    while(Time_sec() < ElapsedTime)
    {
        WaitNextTimeSlice();    // only  run once per cycle
        SerialPort_Manager();   
        if((persist.UserData[P_SERIAL_PENDING] & _BV(SP_TLAUX_QUERY)) == 0) // if the pending bit has been cleared the query response was recieved
        {
            // persist.UserData[P_STATUS] |= _BV(SB_TLAUX_PRES);
            break;
        }
    }
    ClearBit(TP1);
    printf("TLAUX Query %4X, status = %4X\n", persist.UserData[P_TLAUX_STATUS], persist.UserData[P_STATUS]);
}

void MPG_Query(void)
{
    float ElapsedTime;
    // send a MPG status query
    SetPBit(P_SERIAL_PENDING, SP_MPG_QUERY); // persist.UserData[P_SERIAL_PENDING] |= (_BV(SP_MPG_QUERY));  // flag set here - cleared by query received function
    ClearPStatusBit(SB_MPG_PRES); // persist.UserData[P_STATUS] &= ~(_BV(SB_MPG_PRES));  // clear the present bit
    Send_Serial(MPG_StatusQuery);
    ElapsedTime = Time_sec() + QUERY_TIMEOUT;
    SetBit(TP1);
    while(Time_sec() < ElapsedTime)
    {
        WaitNextTimeSlice();
        SerialPort_Manager();

        if((persist.UserData[P_SERIAL_PENDING] & _BV(SP_MPG_QUERY)) == 0)
        {
            // persist.UserData[P_STATUS] |= _BV(SB_MPG_PRES); // set the present bit
            break;
        }
    }
    ClearBit(TP1);
    printf("MPG Query %4X, status = %4X\n", persist.UserData[P_MPG_STATUS], persist.UserData[P_STATUS]);
}

void CheckHW(int Mask, int HW_IO_Addr, int IO_state, float timeout)
{
    float ElapsedTime = Time_sec() + timeout;
    while(Time_sec() < ElapsedTime)
    {
        WaitNextTimeSlice();    // only once per time slice
        ClearPStatusBit(Mask); // persist.UserData[P_STATUS] &= ~(Mask);
        if(ReadBit(HW_IO_Addr) == IO_state)
        {
            SetPStatusBit(Mask); // persist.UserData[P_STATUS] |= Mask;
            break;
        }
    }
}

void Limit_Check(void)
{
    printf("Limit Test:\n");
    persist.UserData[P_STATUS] |= SB_LIMIT_MASK;    // set the limit bits in the P_STATUS variable
    if(ReadBit(X_LIMIT) == X_AT_LIMIT)
    {
        ClearPStatusBit(SB_X_LIMIT); // persist.UserData[P_STATUS] &= ~(_BV(SB_X_LIMIT));   // clear the bit if on the limit
        printf(" X on the Limit Switch\n");
    } else printf(" X OK\n");
    if(ReadBit(Y_LIMIT) == Y_AT_LIMIT)
    {
        ClearPStatusBit(SB_Y_LIMIT); // persist.UserData[P_STATUS] &= ~(_BV(SB_Y_LIMIT));
        printf(" Y on the Limit Switch\n");
    } else printf (" Y OK\n");
    if(ReadBit(Z_LIMIT) == Z_AT_LIMIT)
    {
        ClearPStatusBit(SB_Z_LIMIT); // persist.UserData[P_STATUS] &= ~(_BV(SB_Z_LIMIT));
        printf(" Z on the Limit Switch\n");
    } else printf(" Z OK\n");
}

void Limit_Check2(void)
{

    #ifdef TESTBED  
        // don't do anything here... don't look at the real limit switches.
    #else
    persist.UserData[P_STATUS] |= SB_LIMIT_MASK;    // set the limit bits in the P_STATUS variable
       
    if(ReadBit(X_LIMIT) == X_AT_LIMIT)
    {
        ClearPStatusBit(SB_X_LIMIT); // persist.UserData[P_STATUS] &= ~(_BV(SB_X_LIMIT));   // clear the bit if on the limit
    } 
    if(ReadBit(Y_LIMIT) == Y_AT_LIMIT)
    {
        ClearPStatusBit(SB_Y_LIMIT); // persist.UserData[P_STATUS] &= ~(_BV(SB_Y_LIMIT));
    }
    if(ReadBit(Z_LIMIT) == Z_AT_LIMIT)
    {
        ClearPStatusBit(SB_Z_LIMIT); // persist.UserData[P_STATUS] &= ~(_BV(SB_Z_LIMIT));
    }
    #endif
}

// check the machine for the basic faults
void Fault_Check(void)
{
// While these are all improtant, the managment of them has been moved to the PC program.
// Faults that machine needs to stop for:
// Air Pressure Loss
// Motor Drive fault
// Axis Limit
    Limit_Check2();
// Spindle fault
// no MPG response
// no TLAUX response

// how to recover from each of these faults?
}

// check for machine warnings
void Warning_Check(void)
{
    // check home bits - can probably take out the home check here because it as put into the homing test.
    if ((persist.UserData[P_STATUS] & HOME_STATUS_MASK) == 0)
    {
        SetPStatusBit(SB_HOME); // persist.UserData[P_STATUS] |= _BV(SB_HOME); // set the Home bit in status
    }
    else
    {
        ClearPStatusBit(SB_HOME); // persist.UserData[P_STATUS] &= ~(_BV(SB_HOME)); // clear the home bit
    }
    // low oil
    // low coolant
}

/*

#define INPUT 0
#define OUTPUT 1

void Init_Kanalog_IO(void)
{
    // Kanalog Inputs - opto inputs
    SetBitDirection(ESTOP , 0);
    SetBitDirection(SPINDLE_FAULT , 0);
    SetBitDirection(POWER_MODULE_READY , 0);
    SetBitDirection(AXIS_FAULT , 0);
    SetBitDirection(X_LIMIT , 0);
    SetBitDirection(X_HOME , 0);
    SetBitDirection(Y_LIMIT , 0);
    SetBitDirection(Y_HOME , 0);
    SetBitDirection(Z_LIMIT , 0);
    SetBitDirection(Z_HOME , 0);
    SetBitDirection(OPTO_10 , 0);
    SetBitDirection(HEAD_WHITE , 0);
    SetBitDirection(HEAD_RED , 0);
    SetBitDirection(HEAD_GREEN , 0);
    SetBitDirection(HEAD_BLUE , 0);
    SetBitDirection(HEAD_YELLOW , 0);

    // Kanalog Outputs - 24V drive
    SetBitDirection(ESTOP_RELAY , 1);
    SetBitDirection(SPINDLE_ENABLE , 1);
    SetBitDirection(RELAY3 , 1);
    SetBitDirection(Z_BRAKE , 1);
    SetBitDirection(FET4 , 1);
    SetBitDirection(FET5 , 1);
    SetBitDirection(FET6 , 1);
    SetBitDirection(FET7 , 1);

    // Kanalog Outputs - opto AC CTRL outputs
    SetBitDirection(OIL_LUBE , 1);
    SetBitDirection(FLOOD_MOTOR , 1);
    SetBitDirection(DOOR_FAN , 1);
    SetBitDirection(AC3_110 , 1);
    SetBitDirection(AC4_220 , 1);
    SetBitDirection(AC5_220 , 1);
    SetBitDirection(AC6_220 , 1);
    SetBitDirection(AC7_220 , 1);
}

void Init_Konnect_IO(void)
{
    // Konnect inputs - Encoder inputs
    SetBitDirection(ENC_X_R , 0);
    SetBitDirection(ENC_Y_R , 0);
    SetBitDirection(ENC_Z_R , 0);
    SetBitDirection(ENC_A_R , 0);
    SetBitDirection(ENC_CH4_R , 0);
    SetBitDirection(ENC_CH5_R , 0);
    SetBitDirection(ENC_CH6_R , 0);
    SetBitDirection(SPINDLE_R , 0);
    SetBitDirection(MPG_A , 0);
    SetBitDirection(MPG_B , 0);

    // Konnect inputs - AUX Iso inputs
    SetBitDirection(AUX_ISO_0 , 0);
    SetBitDirection(AUX_ISO_1 , 0);
    SetBitDirection(AUX_ISO_2 , 0);
    SetBitDirection(AUX_ISO_3 , 0);
    SetBitDirection(LUBE_MON , 0);
    SetBitDirection(COOLANT_MON , 0);
    SetBitDirection(AIR_MON , 0);
    SetBitDirection(AUX_ISO_7 , 0);
}

*/

void Init_TestPoints(void)
{
    SetBitDirection(TP1, 1);
	SetBitDirection(TP2, 1);
	ClearBit(TP1);
	ClearBit(TP2);
}
