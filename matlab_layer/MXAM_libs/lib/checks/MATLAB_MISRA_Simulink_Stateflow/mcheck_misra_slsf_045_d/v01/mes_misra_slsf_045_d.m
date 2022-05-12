%% Condition-Actions, Transition-Actions and State-Actions - Transition Actions and Entry Actions
%
% [result,cr_items,r_stats] = mes_misra_slsf_045_d(system, cmd_s)
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
%   MISRA AC SLSF 045 d
%
% DESCRIPTION:
% ============
% When transitioning between any states, any variable must not be written to on a transition-action and read on the destination state's entry actions or default transitions.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyses each variable X that is assigned a value in the transition-action between states.
% Failed: X is read on the state-action "entry" or default transition within the destination state.
% The check result is passed if the failed case does not apply.
%
% SOLUTION:
% =========
% A value is either to be assigned to a variable on the transition-action between states or read on "entry" action or in the default transition of the destination state, but not everywhere.
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
% Date:         $Date: 2020/07/31 16:04:38CEST $
% Revision:     $Rev: 6720 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_045_d(system, cmd_s)
























































































































































































































































































