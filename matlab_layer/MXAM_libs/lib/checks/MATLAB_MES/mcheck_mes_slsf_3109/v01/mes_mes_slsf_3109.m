%% Avoid Transitions Crossing State Boundaries
%
% [result,cr_items,r_stats] = mes_mes_slsf_3109(system, cmd_s)
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
% mes_slsf_3109 - Avoid Crossing-State Transitions
%
% Avoid transitions that cross state boundaries, e.g. transitions from
% one substate to another super-state or one of its substates.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each transition in the chart.
%
%     Review: The transition connecting one state with a substate of a
% different state crosses the boundaries of at least one of the states.
%
% The check result is passed if the review case does not apply.
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_slsf_3109(system, cmd_s)
















































































































