******************************************************************************
******************************************************************************
**  
**  Implements a simplified relay block.
**
**  variable     used as    datatype  LSB    offset  class     Description
**  --------------------------------------------------------------------------
**  u            input      Int16     2^-8   0.0     DISP      input signal
**  y            output     Int8      2^0    0.0     DISP      output signal
**  relay_state  work var.  Int8      2^0    0.0     default   relay state (1 or 0)
**  u_on         parameter  Int16     2^-8   0.0     CAL       if u > u_on
**                                                             relay is switched on
**  u_off        parameter  Int16     2^-8   0.0     CAL       if u < u_off 
**                                                             relay is switched off
**  
******************************************************************************
******************************************************************************
**  $Workfile: relay_code.c $ $Revision: 1.3 $ $Date: 2019/03/29 12:54:19CET $
**  $Archive: /sw/TargetLink/Distribution/TargetLink_Base/Demos/tl/custom_blocks/relay_code.c $
**  author: U. Kiffmeier, dSPACE GmbH


##############################################################################
# Enter output vector evaluation code for production code simulation below
##############################################################################

/* fxp_output_begin */
if (u > u_on)
{
   relay_state = 1;
}
else if (u < u_off)
{
   relay_state = 0;
}
y = relay_state;
/* fxp_output_end */

