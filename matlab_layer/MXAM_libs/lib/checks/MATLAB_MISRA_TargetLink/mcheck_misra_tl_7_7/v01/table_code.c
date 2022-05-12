******************************************************************************
******************************************************************************
**
**  Implements a look-up table block. The table search and interpolation
**  function is implemented in table.c, which is linked to this custom code
**  block by means of a TargetLink Addfile block.
**
**  variable   used as    datatype   LSB    offset  class     Description
**  --------------------------------------------------------------------------
**  u          input      Int16      2^-8   0.0     default   input signal
**  y          output     Int16      2^4    0.0     DISP      output signal
**  u_vec      parameter  Int16      2^-8   0.0     default   x-axis vector
**  y_vec      parameter  Int16      2^4    0.0     default   y-axis vector
**  n          parameter  UInt16     2^0    0.0     default   number of points 
**
******************************************************************************
******************************************************************************
**  $Workfile: table_code.c $ $Revision: 1.3 $ $Date: 2019/03/29 12:54:19CET $
**  $Archive: /sw/TargetLink/Maintenance/Release_1_3/Distribution/TargetLink_Base_Update_1_3_1/Demos/tl/custom_blocks/table_code.c $
**  author: C. Witte, dSPACE GmbH


##############################################################################
# Enter initialization code for floating-point simulation below
##############################################################################
/* flp_init_begin */
//nclude "table.h"
#ifdef MATLAB_MEX_FILE

/* we check the x-axis vector if it is really strictly monotonically increasing */
int k = 0;
while(k < n-2)
{
   if(u_vec[k] >= u_vec[k+1])
   {
      ssSetErrorStatus(_tl_S,"x-axis vector must be strictly montonically increasing!");
      return;
   }
   else
   {
      k++;
   }
}

#endif /* MATLAB_MEX_FILE */

/* flp_init_end */


##############################################################################
# Enter output vector evaluation code for floating-point simulation below
##############################################################################
/* flp_output_begin */
//nclude "table1.h"
y = float_table_fcn(u, u_vec, y_vec, (UInt16)n);   
/* flp_output_end */


##############################################################################
# Enter output vector evaluation code for production code simulation below
##############################################################################
/* fxp_decl_begin */
//nclude "table1.h"
* fxp_decl_end */
/* fxp_output_begin */
y = int_table_fcn(u, u_vec, y_vec, n);
/* fxp_output_end */

/* flp_restart_begin */

/* hallo */

/* flp_restart_end */

