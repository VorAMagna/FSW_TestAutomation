%% Execution Order of Transitions
%
% [result,cr_items,r_stats] = mes_mes_slsf_4113(system, cmd_s)
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
% mes_slsf_4113 - Execution Order of Transitions
%
% The User specified transition execution order property of a chart should be used. 
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each Stateflow Chart in the model.
% 
%     Failed 1: The transition order in the chart is not set to be user-specified.
% 
% The check result is passed if the failed case does not apply.
%
% FIX ACTION:
% ===========
% The chart property 'User specified state/transition execution order'
% will be set.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_slsf_4113(system, cmd_s)

































