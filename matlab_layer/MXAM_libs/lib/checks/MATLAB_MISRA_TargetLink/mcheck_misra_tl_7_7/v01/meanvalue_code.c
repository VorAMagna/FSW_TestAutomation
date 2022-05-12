******************************************************************************
******************************************************************************
**
**  Block computes mean value over last K input values.
**
**  variable    used as    datatype  LSB    offset  class     Description
**  --------------------------------------------------------------------------
**  u           input      Int16     2^-8   0.0     default   input signal
**  enable      input      UInt8     2^0    0.0     default   enable input
**  reset       input      UInt8     2^0    0.0     default   reset input
**  K           input      UInt8     2^0    0.0     default   number of input
**                                                            values for mean
**                                                            value evaluation
**  y           output     Int16     2^-8   0.0     default   output signal
**  buf[256]    work var.  Int16     2^0    0.0     default   buffer
**  idx         work var.  UInt8     2^0    0.0     default   index variable
**
******************************************************************************
******************************************************************************
**  $Workfile: meanvalue_code.c $ $Revision: 1.3 $ $Date: 2019/03/29 12:54:19CET $
**  $Archive: /sw/TargetLink/Distribution/TargetLink_Base/Demos/tl/custom_blocks/meanvalue_code.c $
**  author: C. Witte, dSPACE GmbH


##############################################################################
# Enter declaration code for production code simulation below
##############################################################################
/* fxp_decl_begin(top,common) */
#define MBUFLENGTH 255
/* fxp_decl_end */


##############################################################################
# Enter restart code for production code simulation below
# (executed when the application is (re-)started)
##############################################################################
/* fxp_restart_begin */
UInt16 i;
idx = 0;
for(i=0;i<=MBUFLENGTH;i++) {
   buf[i] = 0;
}
/* fxp_restart_end */


##############################################################################
# Enter initialization code for floating-point simulation below
# (executed when states are re-initialized for enabled subsystems)
##############################################################################
/* fxp_init_begin */
UInt16 i;
idx = 0;
for(i=0; i<=MBUFLENGTH; i++) {
   buf[i] = 0;
}
/* fxp_init_end */


##############################################################################
# Enter output vector evaluation code for production code simulation below
##############################################################################

/* fxp_output_begin */

y = 0;
if(reset)
{
   UInt8 n;
   /* clear internal buffer */
   for(n=0; n<=MBUFLENGTH; n++) {
      buf[n] = 0;
   }
}
else
{
   UInt8 i, k;
   Int32 sum = 0;
   /* append input to buffer */
   buf[idx] = u;
   if(enable) {
      if(K > 0) {
         /* compute mean value */
         for(i=idx,k=0; k<K; i--,k++) {
            sum += buf[i];
         }
         y = (Int16)(sum/(Int32)K);
      }
   }
   idx++;
}
/* fxp_output_end */

