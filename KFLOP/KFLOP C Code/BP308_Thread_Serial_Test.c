#pragma TI_COMPILER // (optimization) or (optimization, size)


#include "KMotionDef.h"
#include "BP308_Persist.h"

main()
{

// format a string
char msg_str1[] = { 0x05, 0x02, 0x1, 0x04};
persist.UserData[P_TLAUX_MSG_PTR] = msg_str1;               // set the persists flag to the address of the string
persist.UserData[P_SERIAL_PENDING] |= SP_TLAUX_MSG_READY;   // set the bit in the persist status
while((persist.UserData[P_SERIAL_PENDING] & ~(SP_TLAUX_MSG_READY)) != 0)
{
    WaitNextTimeSlice();
}
// wait for the status bit to clear
// done

}
