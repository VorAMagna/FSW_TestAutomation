% MES check: ds_0099 - Avoidance of Saturation in Integer Arithmetics
%
% function [result,cr_items,r_stats] = mes_ds_0099(system, cmd_s)
%
% RETURN PARAMETERS:
% ==================
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items 
%
% INPUT PARAMETERS:
% =================
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>, for details See also mes_jc_0061
%
% MES CHECK: 
% ==========
% ds_0099 - Avoidance of Saturation in Integer Arithmetics
%
% Saturation in integer arithmetics via the Saturate on Integer overflow 
% option should be avoided through the use of data types with sufficient 
% bit lengths for outputs as well as intermediate results. 
%
% exceptions can only be made for blocks, where it can be assured that
% the saturation is not carried out on intermediate results but only 
% on the final output signal, as in the following blocks:
% -	Gain
% -	Product block with less than three inputs
% -	Multiport Switch
%
% If the saturation is part of the control algorithm itself rather than 
% the specific integer arithmetic, the Saturation block should be used.
%
% The following (Targetlink and Simulink) block types will be checked:
% --------------------------------------------------------------------
% DeadZone, DiscreteIntegrator, Lookup, Lookup2D, Abs, Sum, Bias, Math,
% DataTypeConversion, MinMax, Switch
%
% PASS CRITERIA:
% ================
% Every block which doesn't use saturation in integer arithmetics via the
% 'Saturate on Integer overflow' option passes.
%
% FAIL CRITERIA:
% ================ 
% Every block which uses saturation in integer arithmetics via the
% 'Saturate on Integer overflow' option fails.
%
% FIX ACTION:
% ================ 
% The option Saturate on Integer overflow will be unset.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:27CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0099(system, cmd_s) %#ok<INUSD>



















































































