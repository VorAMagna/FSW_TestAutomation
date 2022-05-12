%% State-Action Formatting - New Lines for State-Actions
% [result,cr_items,r_stats] = mes_misra_slsf_055_b(system, cmd_s)
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
% Misra_ac_slsf modelling design and style guidelines for tha pplication of
% simulink and stateflow.
%
% DESCRIPTION:
% ============
% A new line should:
%   - Start after the entry (en), during (du) and exit (ex) statements.
%
% PASS/FAIL CRITERIA:
% ===================
% A fail is given to each state, that have an entry (en), during (du) or
% exit (ex) action and is not followed by a new line. 
%
% SOLUTION:
% =========
% Add line feed after entry(en), during(du) and exit(ex) statemens 
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
% Date:         $Date: 2020/07/31 16:04:49CEST $
% Revision:     $Rev: 6720 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_055_b(system, cmd_s)


























































































































































