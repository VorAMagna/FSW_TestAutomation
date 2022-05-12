******************************************************************************
******************************************************************************
**  
**  Implements a variable saturation
**
**  variable    used as  datatype  LSB    offset  class     Description
**  --------------------------------------------------------------------------
**  y           output   Int16     2^-8   0.0     DISP      output signal
**  u           input    Int16     2^-8   0.0     DISP      input signal
**  limit_flag  output   Int8      2^0    0.0     default   = 1 if u > upper_limit
**                                                          = 0 if u within limits
**                                                          =-1 if u < lower_limit
**  upper_limit          Int16     2^-8   0.0     default   upper limit
**  lower_limit          Int16     2^-8   0.0     default   lower limit
**  
******************************************************************************
******************************************************************************
**  $Workfile: varsat_code.c $ $Revision: 1.3 $ $Date: 2019/03/29 12:54:19CET $
**  $Archive: /sw/TargetLink/Distribution/TargetLink_Base/Demos/tl/custom_blocks/varsat_code.c $
**  author: U. Kiffmeier, dSPACE GmbH


##############################################################################
# Enter output vector evaluation code for floating-point simulation below
##############################################################################

/*  flp_output_begin */
if (u > upper_limit) {
   y = upper_limit;
   limit_flag = 1;
} else if (u < lower_limit) {
   y = lower_limit;
   limit_flag = -1;
} else {
   y = u;
   limit_flag = 0;
}
/*  flp_output_end */


#################################################
# code for fixed-point simulation
#################################################

/*  fxp_output_begin */
if (u > upper_limit) {
   y = upper_limit;
   limit_flag = 1;
} else if (u < lower_limit) {
   y = lower_limit;
   limit_flag = -1;
} else {
   y = u;
   limit_flag = 0;
}
/*  fxp_output_end */
