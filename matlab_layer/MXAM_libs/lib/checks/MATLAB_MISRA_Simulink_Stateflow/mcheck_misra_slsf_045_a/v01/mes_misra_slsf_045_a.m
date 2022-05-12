%% Condition-Actions, Transition-Actions and State-Actions - Use of Entry
%
% [result,cr_items,r_stats] = mes_misra_slsf_045_a(system, cmd_s)
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
%   MISRA AC SLSF 045 a
%
% DESCRIPTION:
% ============
% In all state-charts, any variable that is written to on a state's entry
% actions or default transitions must not be written to on transitions (condition-actions or transition-actions) that can cause that state to be entered.
%
% PASS/FAIL CRITERIA:
% ===================
% All the state charts are checked.
% Passed - when the variable written on a state's entry actions or default transitions is not written on to condition or transition actions which causes a state to be entered.
% Failed otherwise.
%
% SOLUTION:
% =========
%Do not use the variables which are defined in default transition or state
%entry actions in condition or transition actions which can cause a state to be entered.
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

function [result, cr_items, r_stats] = mes_misra_slsf_045_a(system, cmd_s)































































































































