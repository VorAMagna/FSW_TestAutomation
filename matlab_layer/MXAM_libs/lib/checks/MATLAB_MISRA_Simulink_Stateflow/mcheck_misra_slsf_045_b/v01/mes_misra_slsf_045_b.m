%% Condition-Actions, Transition-Actions and State-Actions - Use of Exit
%
% [result,cr_items,r_stats] = mes_misra_slsf_045_b(system, cmd_s)
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
% Reference:
%   MISRA AC SLSF Modelling design and style guidelines for the
%   application of simulink and stateflow, MIRA limited, May 2009,
%   Ver 1.0, www.misra.org.uk
%
% Guideline Rule ID:
%   MISRA AC SLSF 045 b
%
% DESCRIPTION:
% ============
% In all state-charts, any variable must not be written on a state's exit actions must not be written on transitions
% (condition-actions or transition-actions) that can cause that state to be exited (note: this includes exiting from super-states).
%
% PASS/FAIL CRITERIA:
% ===================
% All the state charts are checked.
% Passed - when the variable written on a state's exit actions is not written on to condition or transition actions which causes a state to be exited .
% Failed otherwise.
% %
% SOLUTION:
% =========
% Do not use the variables which are defined in state exit actions in condition or transition actions which can cause a state to be exited.
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
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:37CEST $
% Revision:     $Rev: 6720 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_045_b(system, cmd_s)

























































































































































