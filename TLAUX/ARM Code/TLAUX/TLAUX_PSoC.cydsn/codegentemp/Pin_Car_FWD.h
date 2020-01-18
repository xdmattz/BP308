/*******************************************************************************
* File Name: Pin_Car_FWD.h  
* Version 2.20
*
* Description:
*  This file contains Pin function prototypes and register defines
*
* Note:
*
********************************************************************************
* Copyright 2008-2015, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_PINS_Pin_Car_FWD_H) /* Pins Pin_Car_FWD_H */
#define CY_PINS_Pin_Car_FWD_H

#include "cytypes.h"
#include "cyfitter.h"
#include "cypins.h"
#include "Pin_Car_FWD_aliases.h"

/* APIs are not generated for P15[7:6] */
#if !(CY_PSOC5A &&\
	 Pin_Car_FWD__PORT == 15 && ((Pin_Car_FWD__MASK & 0xC0) != 0))


/***************************************
*        Function Prototypes             
***************************************/    

/**
* \addtogroup group_general
* @{
*/
void    Pin_Car_FWD_Write(uint8 value);
void    Pin_Car_FWD_SetDriveMode(uint8 mode);
uint8   Pin_Car_FWD_ReadDataReg(void);
uint8   Pin_Car_FWD_Read(void);
void    Pin_Car_FWD_SetInterruptMode(uint16 position, uint16 mode);
uint8   Pin_Car_FWD_ClearInterrupt(void);
/** @} general */

/***************************************
*           API Constants        
***************************************/
/**
* \addtogroup group_constants
* @{
*/
    /** \addtogroup driveMode Drive mode constants
     * \brief Constants to be passed as "mode" parameter in the Pin_Car_FWD_SetDriveMode() function.
     *  @{
     */
        #define Pin_Car_FWD_DM_ALG_HIZ         PIN_DM_ALG_HIZ
        #define Pin_Car_FWD_DM_DIG_HIZ         PIN_DM_DIG_HIZ
        #define Pin_Car_FWD_DM_RES_UP          PIN_DM_RES_UP
        #define Pin_Car_FWD_DM_RES_DWN         PIN_DM_RES_DWN
        #define Pin_Car_FWD_DM_OD_LO           PIN_DM_OD_LO
        #define Pin_Car_FWD_DM_OD_HI           PIN_DM_OD_HI
        #define Pin_Car_FWD_DM_STRONG          PIN_DM_STRONG
        #define Pin_Car_FWD_DM_RES_UPDWN       PIN_DM_RES_UPDWN
    /** @} driveMode */
/** @} group_constants */
    
/* Digital Port Constants */
#define Pin_Car_FWD_MASK               Pin_Car_FWD__MASK
#define Pin_Car_FWD_SHIFT              Pin_Car_FWD__SHIFT
#define Pin_Car_FWD_WIDTH              1u

/* Interrupt constants */
#if defined(Pin_Car_FWD__INTSTAT)
/**
* \addtogroup group_constants
* @{
*/
    /** \addtogroup intrMode Interrupt constants
     * \brief Constants to be passed as "mode" parameter in Pin_Car_FWD_SetInterruptMode() function.
     *  @{
     */
        #define Pin_Car_FWD_INTR_NONE      (uint16)(0x0000u)
        #define Pin_Car_FWD_INTR_RISING    (uint16)(0x0001u)
        #define Pin_Car_FWD_INTR_FALLING   (uint16)(0x0002u)
        #define Pin_Car_FWD_INTR_BOTH      (uint16)(0x0003u) 
    /** @} intrMode */
/** @} group_constants */

    #define Pin_Car_FWD_INTR_MASK      (0x01u) 
#endif /* (Pin_Car_FWD__INTSTAT) */


/***************************************
*             Registers        
***************************************/

/* Main Port Registers */
/* Pin State */
#define Pin_Car_FWD_PS                     (* (reg8 *) Pin_Car_FWD__PS)
/* Data Register */
#define Pin_Car_FWD_DR                     (* (reg8 *) Pin_Car_FWD__DR)
/* Port Number */
#define Pin_Car_FWD_PRT_NUM                (* (reg8 *) Pin_Car_FWD__PRT) 
/* Connect to Analog Globals */                                                  
#define Pin_Car_FWD_AG                     (* (reg8 *) Pin_Car_FWD__AG)                       
/* Analog MUX bux enable */
#define Pin_Car_FWD_AMUX                   (* (reg8 *) Pin_Car_FWD__AMUX) 
/* Bidirectional Enable */                                                        
#define Pin_Car_FWD_BIE                    (* (reg8 *) Pin_Car_FWD__BIE)
/* Bit-mask for Aliased Register Access */
#define Pin_Car_FWD_BIT_MASK               (* (reg8 *) Pin_Car_FWD__BIT_MASK)
/* Bypass Enable */
#define Pin_Car_FWD_BYP                    (* (reg8 *) Pin_Car_FWD__BYP)
/* Port wide control signals */                                                   
#define Pin_Car_FWD_CTL                    (* (reg8 *) Pin_Car_FWD__CTL)
/* Drive Modes */
#define Pin_Car_FWD_DM0                    (* (reg8 *) Pin_Car_FWD__DM0) 
#define Pin_Car_FWD_DM1                    (* (reg8 *) Pin_Car_FWD__DM1)
#define Pin_Car_FWD_DM2                    (* (reg8 *) Pin_Car_FWD__DM2) 
/* Input Buffer Disable Override */
#define Pin_Car_FWD_INP_DIS                (* (reg8 *) Pin_Car_FWD__INP_DIS)
/* LCD Common or Segment Drive */
#define Pin_Car_FWD_LCD_COM_SEG            (* (reg8 *) Pin_Car_FWD__LCD_COM_SEG)
/* Enable Segment LCD */
#define Pin_Car_FWD_LCD_EN                 (* (reg8 *) Pin_Car_FWD__LCD_EN)
/* Slew Rate Control */
#define Pin_Car_FWD_SLW                    (* (reg8 *) Pin_Car_FWD__SLW)

/* DSI Port Registers */
/* Global DSI Select Register */
#define Pin_Car_FWD_PRTDSI__CAPS_SEL       (* (reg8 *) Pin_Car_FWD__PRTDSI__CAPS_SEL) 
/* Double Sync Enable */
#define Pin_Car_FWD_PRTDSI__DBL_SYNC_IN    (* (reg8 *) Pin_Car_FWD__PRTDSI__DBL_SYNC_IN) 
/* Output Enable Select Drive Strength */
#define Pin_Car_FWD_PRTDSI__OE_SEL0        (* (reg8 *) Pin_Car_FWD__PRTDSI__OE_SEL0) 
#define Pin_Car_FWD_PRTDSI__OE_SEL1        (* (reg8 *) Pin_Car_FWD__PRTDSI__OE_SEL1) 
/* Port Pin Output Select Registers */
#define Pin_Car_FWD_PRTDSI__OUT_SEL0       (* (reg8 *) Pin_Car_FWD__PRTDSI__OUT_SEL0) 
#define Pin_Car_FWD_PRTDSI__OUT_SEL1       (* (reg8 *) Pin_Car_FWD__PRTDSI__OUT_SEL1) 
/* Sync Output Enable Registers */
#define Pin_Car_FWD_PRTDSI__SYNC_OUT       (* (reg8 *) Pin_Car_FWD__PRTDSI__SYNC_OUT) 

/* SIO registers */
#if defined(Pin_Car_FWD__SIO_CFG)
    #define Pin_Car_FWD_SIO_HYST_EN        (* (reg8 *) Pin_Car_FWD__SIO_HYST_EN)
    #define Pin_Car_FWD_SIO_REG_HIFREQ     (* (reg8 *) Pin_Car_FWD__SIO_REG_HIFREQ)
    #define Pin_Car_FWD_SIO_CFG            (* (reg8 *) Pin_Car_FWD__SIO_CFG)
    #define Pin_Car_FWD_SIO_DIFF           (* (reg8 *) Pin_Car_FWD__SIO_DIFF)
#endif /* (Pin_Car_FWD__SIO_CFG) */

/* Interrupt Registers */
#if defined(Pin_Car_FWD__INTSTAT)
    #define Pin_Car_FWD_INTSTAT            (* (reg8 *) Pin_Car_FWD__INTSTAT)
    #define Pin_Car_FWD_SNAP               (* (reg8 *) Pin_Car_FWD__SNAP)
    
	#define Pin_Car_FWD_0_INTTYPE_REG 		(* (reg8 *) Pin_Car_FWD__0__INTTYPE)
#endif /* (Pin_Car_FWD__INTSTAT) */

#endif /* CY_PSOC5A... */

#endif /*  CY_PINS_Pin_Car_FWD_H */


/* [] END OF FILE */
