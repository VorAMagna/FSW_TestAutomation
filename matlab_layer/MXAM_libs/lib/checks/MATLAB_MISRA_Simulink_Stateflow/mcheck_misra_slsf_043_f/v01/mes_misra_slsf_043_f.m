% % Transitions - Internal Transitions
%
% [result,cr_items,r_stats] = mes_misra_slsf_043_f(system, cmd_s)
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
%   MISRA AC SLSF 043 f
%
% DESCRIPTION:
% ============
% In all state-charts, flow-charts and graphical functions, there must be
% no more than one internal transitions from any state.
%
% PASS/FAIL CRITERIA:
% ===================
% The check inspects every state in a chart.
% Failed- States with more than one internal transitions.
% Passed- Otherwise
%
% SOLUTION:
% =========
% Use only one internal transition in a state.
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
% Date:         $Date: 2020/07/31 16:04:34CEST $
% Revision:     $Rev:$
% *************************************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_043_f(system, cmd_s)













































































