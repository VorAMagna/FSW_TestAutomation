%% Use of Transitions in Control Flow
%
% [result,cr_items,r_stats] = mes_mes_slsf_4112(system, cmd_s)
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
% mes_slsf_4112 - Use of Transitions in Control Flow
%
% In a control flow graph, each junction with outgoing transitions should
% have one transition with neither an event nor a condition specified. The
% only exception to this rule are situations in which only one transition
% exists.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each junction in the model.
% 
%     Failed 1: The junction has more than one outgoing transition and each one of them has a condition or an event specified.
% 
% The check result is passed if the failed case does not apply. This means it is also passed if the junction has only one outgoing transition.
%
% FIX ACTION:
% ===========
% ENTER DESCRIPTION
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_slsf_4112(system, cmd_s)

























































































































