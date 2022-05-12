%% State-Actions - Flow-Charts
%
% [result,cr_items,r_stats] = mes_misra_slsf_044_c(system, cmd_s)
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
%   MISRA AC SLSF 044 b
%
% DESCRIPTION:
% ============
% In state-charts, "entry:" and "exit:" state-actions are not recommended
% but may br used with caution.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each state.
% Failed: If the state-actions "entry:" and "exit:" are used.
% The check result is passed if the failed case does not apply.
%
% SOLUTION:
% =========
% Avoid using state-actions.
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
% A flow-chart is defined as chart or state, which contains no or only one state.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:36CEST $
% Revision:
% *************************************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_044_b(system, cmd_s)







































































































