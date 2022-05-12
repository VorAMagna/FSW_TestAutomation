% MES check: misra_slsf_037_g - Internal Data - Unused Data Items
% 
% function [result,cr_items,r_stats] = mes_misra_slsf_037_g(system, cmd_s)
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
% misra_slsf_037_g - Internal Data - Unused Data Items
% There must be no unused data items. 
% RATIONALE:
% ==========
% Enhances readability. 
%
% PASS/FAIL CRITERIA:
% ================
% The check analyses every Stateflow data item with scope "Input", "Local",
% "Constant" or "Parameter". Further, every Stateflow event is analyzed.
% 
%   Failed1: a data item is neither used in the left hand side of an
%     assignment expression nor in a transition condition
%   Failed2: an event is not used in a transition condition
%   Passed: neither case Failed1 nor case Failed2 apply
% %
% NOTE:
% =====
% SOLUTION:
% =========
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:27CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_037_g(system, cmd_s) %#ok<STOUT,INUSD>





























































































































































































































