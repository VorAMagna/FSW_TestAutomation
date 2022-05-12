%% Parallel States - Top-Level
%
% [result,cr_items,r_stats] = misra_slsf_040_b(system, cmd_s)
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
% Guideline Rule ID: MISRA AC SLSF 040 B(3.4.7)
%
% DESCRIPTION:
% ============
% Parallel states must not be used as a grouping mechanism, i.e. the parent of a
% parallel state must not be a parallel state.
% 
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each state within a Stateflow chart.
% Failed: If the parent of a parallel state is parallel, too.
% The check result is passed if the failed case does not apply. 
%
% SOLUTION:
% =========
% Do not use parallel states as grouping mechanism. Remodel the chart such
% that the parent of a parallel state is not parallel. 
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

function [result,cr_items,r_stats]= mes_misra_slsf_040_b(system,cmd_s,reg, s_regerr)
















































































































