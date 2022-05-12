%% Simulink Bus Objects for Structured Variables in Stateflow
%
% [result,cr_items,r_stats] = mes_mes_slsf_4111(system, cmd_s)
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
% mes_slsf_4111 - Simulink Bus Objects for Structured Variables in Stateflow
% The option Bus Object for the Data type mode of Stateflow data must not be used for TargetLink versions prior to TargetLink 4.1. 
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes the data from each chart (only if the TargetLink
% version is <4.1)
% Failed 1: The parameter 'Data Type mode' of the data is set to 'Bus Object'
% The check result is passed if all failed cases do not apply.
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:34CEST $
% Revision:     $Rev: 15223 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_slsf_4111(system, cmd_s)
















































































































