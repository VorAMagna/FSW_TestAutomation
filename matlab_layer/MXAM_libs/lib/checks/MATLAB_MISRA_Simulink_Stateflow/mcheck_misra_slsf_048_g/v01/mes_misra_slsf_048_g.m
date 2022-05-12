%% Stateflow Coding - Numbers
%
% [result,cr_items,r_stats] = mes_misra_slsf_048_g(system, cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistic s on the check result
% for details use 'open mes_check_info'
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>,
% for details use 'open mes_check_info'
%
% MES CHECK:
% ==========
% misra_slsf_048_g - Transitions
% Numbers other than 0 and 1 must not appear on the state machine. Instead,
% a label must be used and defined in the model explorer as a constant or
% as "#define" in custom code.
%
% Exception: numbers are permitted to be embedded in a label or comment.
%
% PASS CRITERIA:
% ================
% The check analyzes each state label and each transition label in a Stateflow Chart.
%     Failed 1: If numbers except 0 and 1 are used.
% The check result is passed if all failed cases do not apply.
%
% SOLUTION:
% =========
% Use variable names in labels and define their values in the model
% explorer or as "#define" in custom code.
%
% FIX OPERATION:
% ==============
% No automatic repair action available.
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% ***********************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_048_g(system, cmd_s) %#ok<INUSD>
















































































































































