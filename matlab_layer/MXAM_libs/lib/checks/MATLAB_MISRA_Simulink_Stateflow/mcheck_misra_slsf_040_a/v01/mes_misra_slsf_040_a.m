%% Parallel States - Top-Level
%
% [result,cr_items,r_stats] = misra_slsf_040_a(system, cmd_s)
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
% REFERENCED GUIDELINE:
% =====================
% MISRA AC SLSF - Modeling design and style guidelines for the application
% of Simulink and Stateflow
% Version 1.0 
% The Motor Industry Software Reliability Association
% Guideline Rule ID: MISRA AC SLSF 040 A(3.4.7)
%
% DESCRIPTION:
% ============
% Parallel states should not appear at the top level of a state-chart.
% 
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each Stateflow chart.
% Failed: If the decomposition of the chart is parallel and there is a state on the top level of the state chart.
% The check result is passed if the failed case does not apply. 
%
% SOLUTION:
% =========
% Separate the functionality modeled in the parallel states in Stateflow charts.
%
% FIX OPERATION:
% ==============
% No automatic repair available. 
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:30CEST $
% Revision:     $Rev: 15265 $
% *************************************************************************

function [result,cr_items,r_stats]= mes_misra_slsf_040_a(system,cmd_s,reg, s_regerr)












































































