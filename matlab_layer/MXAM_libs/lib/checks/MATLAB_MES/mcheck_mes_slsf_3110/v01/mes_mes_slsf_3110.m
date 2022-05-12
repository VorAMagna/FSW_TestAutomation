%% Usage of Stateflow Actions
%
% [result,cr_items,r_stats] = mes_mes_slsf_3110(system, cmd_s)
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
% mes_slsf_3110 - Usage of Stateflow Actions
%
% Stateflow offers a number of options to control the execution of the
% chart by specifying conditions and actions in a state or transition.
% From that range of actions one should only choose one of the following
% types to be used: state actions, condition actions or transition actions.
% Exception: condition actions are always allowed in flow charts.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each chart in the model.
%
%     Failed 1: The action used in the state or transition is not of the
%     allowed action type specified in the check parameter
%     MES.mes_slsf_3110.ActionType.
%
% The check result is passed if all failed cases do not apply.
% Exception: condition actions are always allowed in flow charts.
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_slsf_3110(system, cmd_s)




















































































































































































































