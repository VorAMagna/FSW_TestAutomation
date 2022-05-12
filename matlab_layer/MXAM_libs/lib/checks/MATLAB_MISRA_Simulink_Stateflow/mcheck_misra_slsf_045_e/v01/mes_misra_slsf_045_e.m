%% Condition-Actions, Transition-Actions and State-Actions - Read and Write on Transitions
%
% [result,cr_items,r_stats] = mes_misra_slsf_045_e(system, cmd_s)
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
%   MISRA AC SLSF 045 e
%
% DESCRIPTION:
% ============
% Condition-Actions, Transition-Actions and State-Actions - Read and Write on Transitions
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyses each variable X that is assigned a value in the transition-action between states.
% Failed: X is read on the transitions following it till the destination state is reached.
% The check result is passed if the failed case does not apply.

function [result, cr_items, r_stats] = mes_misra_slsf_045_e(system, cmd_s)

















































































































































































































































































































