%% Condition-Actions, Transition-Actions and State-Actions - Usage of Condition-Actions and Transition-Actions
%
% [result,cr_items,r_stats] = mes_misra_slsf_045_g(system, cmd_s)
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
%   MISRA AC SLSF 045 g
%
% DESCRIPTION:
% ============
% When transitioning between any states, any variable must not be written to on a condition-action and transition-action.  
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyses all the transitions between two states.
% Failed: If a variable is written to by transition-action and condition-action on the transitions between a source state and a destination state.
% The check result is passed, if the failed case does not apply. 
%
% SOLUTION:
% =========
% Do not write to a variable between any states using transition-action and condition-action. 
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
% Date:         $Date: 2020/07/31 16:04:39CEST $
% Revision:     $Rev: 6720 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_045_g(system, cmd_s)












































































































































































































































































































