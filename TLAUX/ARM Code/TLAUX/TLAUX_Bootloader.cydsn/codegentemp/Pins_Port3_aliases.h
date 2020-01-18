/*******************************************************************************
* File Name: Pins_Port3.h  
* Version 2.20
*
* Description:
*  This file contains the Alias definitions for Per-Pin APIs in cypins.h. 
*  Information on using these APIs can be found in the System Reference Guide.
*
* Note:
*
********************************************************************************
* Copyright 2008-2015, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_PINS_Pins_Port3_ALIASES_H) /* Pins Pins_Port3_ALIASES_H */
#define CY_PINS_Pins_Port3_ALIASES_H

#include "cytypes.h"
#include "cyfitter.h"


/***************************************
*              Constants        
***************************************/
#define Pins_Port3_0			(Pins_Port3__0__PC)
#define Pins_Port3_0_INTR	((uint16)((uint16)0x0001u << Pins_Port3__0__SHIFT))

#define Pins_Port3_1			(Pins_Port3__1__PC)
#define Pins_Port3_1_INTR	((uint16)((uint16)0x0001u << Pins_Port3__1__SHIFT))

#define Pins_Port3_2			(Pins_Port3__2__PC)
#define Pins_Port3_2_INTR	((uint16)((uint16)0x0001u << Pins_Port3__2__SHIFT))

#define Pins_Port3_3			(Pins_Port3__3__PC)
#define Pins_Port3_3_INTR	((uint16)((uint16)0x0001u << Pins_Port3__3__SHIFT))

#define Pins_Port3_4			(Pins_Port3__4__PC)
#define Pins_Port3_4_INTR	((uint16)((uint16)0x0001u << Pins_Port3__4__SHIFT))

#define Pins_Port3_5			(Pins_Port3__5__PC)
#define Pins_Port3_5_INTR	((uint16)((uint16)0x0001u << Pins_Port3__5__SHIFT))

#define Pins_Port3_6			(Pins_Port3__6__PC)
#define Pins_Port3_6_INTR	((uint16)((uint16)0x0001u << Pins_Port3__6__SHIFT))

#define Pins_Port3_7			(Pins_Port3__7__PC)
#define Pins_Port3_7_INTR	((uint16)((uint16)0x0001u << Pins_Port3__7__SHIFT))

#define Pins_Port3_INTR_ALL	 ((uint16)(Pins_Port3_0_INTR| Pins_Port3_1_INTR| Pins_Port3_2_INTR| Pins_Port3_3_INTR| Pins_Port3_4_INTR| Pins_Port3_5_INTR| Pins_Port3_6_INTR| Pins_Port3_7_INTR))

#endif /* End Pins Pins_Port3_ALIASES_H */


/* [] END OF FILE */
