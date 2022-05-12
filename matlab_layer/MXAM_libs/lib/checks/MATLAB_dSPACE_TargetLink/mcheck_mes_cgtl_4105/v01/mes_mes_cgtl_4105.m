%%No Chart Execution with Super Step Semantics
%
% [result,cr_items,r_stats] = mes_mcheck_mes_cgtl_4105(system, cmd_s)
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
% mcheck_mes_cgtl_4105 - TL_RULE_STATEFLOW_SUPERSTEP_CHART
%
% The option 'Enable Super Step Semantics' in the Chart Dialog of a Stateflow chart is currently not supported by TargetLink. 
%
% PASS/FAIL CRITERIA:
% ===================
% The check verifies the Chart property 'Enable Super Step Semantics' in every Stateflow Chart of the model.
% Failed: If the option 'Enable Super Step Semantics' in the Chart Properties dialog  is selected.
% The check result is passed if the failed case does not apply.
%
% FIX ACTION:
% ===========
% Deactivates the Chart property 'Enable Super Step Semantics' of every chart of the model.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:30CEST $
% Revision:     $Rev: 15223 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_cgtl_4105(system, cmd_s)






























































