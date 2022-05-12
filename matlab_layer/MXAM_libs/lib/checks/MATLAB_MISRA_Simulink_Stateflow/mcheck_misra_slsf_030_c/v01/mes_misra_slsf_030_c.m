%% Port Location - Trigger, Enable, and Action Ports
%
% [result,cr_items,r_stats] = mes_misra_slsf_030_c(system, cmd_s)
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
% misra_slsf_030_c - Port Location - Trigger, Enable, and Action Ports
%
% A: inports are to be placed at the left side, exception is defined
% 
% B: outports are to be placed at the right side, exception is defined
% 
% C: trigger, enable and action blocks are to be placed at the top left of the subsystem, the enable block must be the most left one 
%
% PASS/FAIL CRITERIA:
% ===================
% A trigger block gets a fail, if its position is not within the region given by the two parameters MISRA_SL_SF.misra_slsf_030.Trigger.Region and MISRA_SL_SF.misra_slsf_030.Trigger.Range.
% The same holds true for Enable blocks and Action blocks in combination with the corresponding parameters.
% Additionally, each enable block gets a fail, which is positioned more right than a Trigger block (if one exists).
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_030_c(system, cmd_s)













































