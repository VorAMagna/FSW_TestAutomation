%% States in state machines
%
% [result,cr_items,r_stats] = mes_misra_slsf_039_a(system, cmd_s)
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
%   MISRA AC SLSF 039 a
%
% DESCRIPTION:
% ============
% In all state-charts, a state must have either zero or more than one sub-state
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes all state-charts.
% Failed: If a state has only one sub-state.
% Passed: If the failed case does not apply. 
%
% SOLUTION:
% =========
% Any actions of a single sub-state can be performed by the parent. Remodel the state such that there is either no or more than one sub-states. 
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
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:29CEST $
% Revision:     $Rev: 6824 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_039_a(system, cmd_s)









































