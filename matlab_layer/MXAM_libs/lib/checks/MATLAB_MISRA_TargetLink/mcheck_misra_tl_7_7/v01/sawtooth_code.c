******************************************************************************
******************************************************************************
**
**  Implements a sawtooth signal generator
**
**   variable   used as     datatype  LSB    offset  class     Description
**   -------------------------------------------------------------------------
**    y         output      Int8      2^-3   0.0     DISP      output signal
**    x         state       Int16     2^-11  0.0     default   state
**    ampl      parameter   Int16     2^-11  0.0     CAL       amplitude
**    incr      parameter   Int16     2^-11  0.0     CAL       increment of
**                                                             x in every
**                                                             sample step
**
******************************************************************************
******************************************************************************
**  $Workfile: sawtooth_code.c $ $Revision: 1.3 $ $Date: 2019/03/29 12:54:19CET $
**  $Archive: /sw/TargetLink/Distribution/TargetLink_Base/Demos/tl/custom_blocks/sawtooth_code.c $
**  author: U. Kiffmeier, dSPACE GmbH


##############################################################################
# Enter output vector evaluation code for production code simulation below
##############################################################################

/* fxp_output_begin */
y = (Int8) (x >> 8);
/* fxp_output_end */


##############################################################################
# Enter update code for production code simulation below
##############################################################################

/* fxp_update_begin */
x += incr;
if (x >= ampl) {
   x -= (ampl << 1);
}
/* fxp_update_end */

