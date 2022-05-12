******************************************************************************
******************************************************************************
**
**  Block implements a transport delay of nDelay sample steps.
**
**  variable    used as     datatype  LSB    offset  class     Description
**  --------------------------------------------------------------------------
**  u           input       Int16     2^-8   0.0     default   input signal
**  y           output      Int16     2^-8   0.0     default   output signal
**  buf[256]    work var.   Int16     2^0    0.0     default   buffer
**  idx         work var.   UInt8     2^0    0.0     default   index
**  nDelays     parameter   UInt8     2^0    0.0     default   delay divided
**                                                             by sample time
**
******************************************************************************
******************************************************************************
**  $Workfile: delay_code.c $ $Revision: 1.3 $ $Date: 2019/03/29 12:54:19CET $
**  $Archive: /sw/TargetLink/Distribution/TargetLink_Base/Demos/tl/custom_blocks/delay_code.c $
**  author: C. Witte, dSPACE GmbH


##############################################################################
# Enter declaration code for production code simulation below
##############################################################################
#include "table.h"
/* fxp_decl_begin(top,common) */
#define DBUFLENGTH 255
/* fxp_decl_end */


##############################################################################
# Enter restart code for production code simulation below
# (executed when the application is (re-)started)
##############################################################################
/* fxp_restart_begin */
UInt16 i;
idx = 0;
for(i=0;i<=DBUFLENGTH;i++) {
   buf[i] = 0;
}
/* fxp_restart_end */


##############################################################################
# Enter initialization code for production code simulation below
# (executed when states are re-initialized for enabled subsystems)
##############################################################################
/* fxp_init_begin */
UInt16 i;
idx = 0;
for(i=0;i<=DBUFLENGTH;i++) {
   buf[i] = 0;
}
/* fxp_init_end */


##############################################################################
# Enter output vector evaluation code for production code simulation below
##############################################################################

/* fxp_output_begin */
y = buf[(UInt8)(idx-nDelays)];
/* fxp_output_end */


##############################################################################
# Enter update code for production code simulation below
##############################################################################
/* fxp_update_begin */
buf[idx++] = u;
/* fxp_update_end */


