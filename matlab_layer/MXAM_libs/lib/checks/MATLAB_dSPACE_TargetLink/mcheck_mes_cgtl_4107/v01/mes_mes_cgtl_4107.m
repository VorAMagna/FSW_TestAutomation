%% Simulink Function-Call Subsystems in a Stateflow Chart
%
% [result,cr_items,r_stats] = mes_mes_cgtl_4107(system, cmd_s)
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
% mes_cgtl_4107 - Simulink Function-Call Subsystems in a Stateflow Chart
%  Embedding a function-call subsystem in a Stateflow chart is currently not supported by
%  TargetLink. You can use a Simulink function to embed a function-call subsystem in a Stateflow chart.
%
%PASS/FAIL CRITERIA:
% ===================
% The check analyses each Stateflow chart within the model.
%   Failed:The result is failed when an embedded function-call (Simulink Function Block) subsystem is used in the chart. 
% The result is passed when the failed case does not apply.
%
% FIX ACTION:
% ===========
% ENTER DESCRIPTION
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:31CEST $
% Revision:     $Rev: 15223 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_cgtl_4107(system, cmd_s)





























































































