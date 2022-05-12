%% State-Action Formatting - New Lines for Actions
% [result,cr_items,r_stats] = mes_misra_slsf_055_c(system, cmd_s)
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
% Misra AC SLSF modelling design and style guidelines for tha pplication of
% simulink and stateflow.
%
% DESCRIPTION:
% ============
% A new line should:
%   - Start after each action inside a state label.
%
% PASS/FAIL CRITERIA:
% ===================
% A fail is given if more than one actions exist in a separate line of a
% state label.
%
% SOLUTION:
% =========
% only include one action in a separate line.
%
% FIX OPERATION:
% ==============
% No automatic fix available. 
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% Increase readability by using more than one line. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:50CEST $
% Revision:     $Rev: 6720 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_055_c(system, cmd_s)










































