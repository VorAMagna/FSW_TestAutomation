%% Condition-Actions, Transition-Actions and State-Actions - Use of Exit and Entry
%
% [result,cr_items,r_stats] = mes_misra_slsf_045_c(system, cmd_s)
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
%   MISRA AC SLSF 045 c
%
% DESCRIPTION:
% ============
% In all state-charts, any variable must not be written to on a state's exit actions and read or written to on a destination state's entry actions or default transitions.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each variable X that is assigned a value in a exit-action of a state.
% Failed: X is re-assigned a value in the state-action "entry" of the destination state.
% The check result is passed if the failed case does not apply.
%
% SOLUTION:
% =========
% A value is either to be assigned to a variable within the state-action "exit" or in the "entry" action of the destination state, but not in both.
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

function [result, cr_items, r_stats] = mes_misra_slsf_045_c(system, cmd_s)













































































































































































