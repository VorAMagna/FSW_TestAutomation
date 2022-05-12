%% State-Actions - During
%
% [result,cr_items,r_stats] = mes_misra_slsf_044_a(system, cmd_s)
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
%   MISRA AC SLSF 044 a
%
% DESCRIPTION:
% ============
% In state-charts, “during:” state-actions must not be used.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each state in a Stateflow chart.
% Failed: If the state-action 'during:' resp. 'du:' is used.
% The check result is passed if teh failed case does not apply. 
%
% SOLUTION:
% =========
% Use a condition action on a unguarded transition from the boundary of the state to replace the during action.
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
% Date:         $Date: 2020/07/31 16:04:35CEST $
% Revision:     $Rev: 6720 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_044_a(system, cmd_s)






























































































