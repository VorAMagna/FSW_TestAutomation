%% mes_misra_slsf_039_c - States - Hierarchy of Sub-Charts
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
% Reference:
%   MISRA AC SLSF Modelling design and style guidelines for the
%   application of simulink and stateflow, MIRA limited, May 2009,
%   Ver 1.0, www.misra.org.uk
%
% Guideline Rule ID:
%   MISRA AC SLSF 039_c
%
% DESCRIPTION:
% ============
% In all state-charts, a sub-chart must not contain another sub-chart, i.e. no more than one level of hierarchy is permitted.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each chart.
% Failed: If there is more than one hierarchy level in the chart, i.e. if
% there is a sub-chart in the chart which contains at least another sub-chart.
% The check result is passed if all failed cases do not apply.
%
% SOLUTION:
% =========
% Restructure the chart such that there is only one hierarchy level. Use sub-charts only on one level.
%
% FIX OPERATION:
% ==============
% No automatic repair action available.
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% [everything else, the user should know]
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions GmbH
% Date:         $Date: 2020/07/31 16:04:29CEST $
% Revision:     $Rev: $
% *************************************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_039_c (system, cmd_s)



































































































