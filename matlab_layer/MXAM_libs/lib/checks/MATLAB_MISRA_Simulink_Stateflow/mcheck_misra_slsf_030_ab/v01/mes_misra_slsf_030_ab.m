%% Port Location - Inports and Outports
%
% [result,cr_items,r_stats] = mes_misra_slsf_030_ab(system, cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistics on the check result
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>,
%
% MES CHECK:
% ==========
% misra_slsf_030_ab - Port Location - Inports and Outports
%
% A: inports are to be placed at the left side, exception is defined
% 
% B: outports are to be placed at the right side, exception is defined
% 
% C: trigger, enable and action blocks are to be placed at the top left of the subsystem, the enable block must be the most left one 
%
% PASS/FAIL CRITERIA:
% ===================
% An inport block gets a fail, if its left edge is more 'right' than the left edge of the most left block, which is not considered by this check (i.e. inport, outport, enable, trigger, action if all three parts are checked). The comparison is done by the x-ccordinate returned by the 'position' parameter of each block.
% 
% An outport block gets a fail if its right edge is more 'left' than the right edge of the most right block, which is not considered by this check (i.e. inport, outport, enable, trigger, action if all three parts are checked). The comparison is done by the x-coordinate returned by the 'position' parameter of each block.
% 
% A subsystem gets a fail if all contained inports (and outports) are not aligned from top to bottom. Alignment is interpreted as follows: The x-Position of the left edge of the most right inport differs only MISRA_SL_SF.misra_slsf_030.Tolerance pixel from the x-position of the left edge of the left-most inport (the same is checked for 
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_030_ab(system, cmd_s)








































