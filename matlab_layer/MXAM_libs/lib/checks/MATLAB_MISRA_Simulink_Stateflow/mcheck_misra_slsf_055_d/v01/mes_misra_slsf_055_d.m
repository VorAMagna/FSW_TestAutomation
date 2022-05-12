%%State-Action Formatting - State-Action Duplication
%
% [result,cr_items,r_stats] = mes_misra_slsf_055_d(system, cmd_s)
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
%   MISRA AC SLSF 055 d
%
% DESCRIPTION:
% ============
% "entry:", "during:" and "exit:" labels should appear no more than once in any state.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each state in a Stateflow chart.
% Failed: If every state-action (keywords: entry:/en:,during:/du: and exit:/ex:) appears more than once in a state.
% The check result is passed if the failed case does not apply. 
% 
% SOLUTION:
% =========
% Restructure the state-actions such that every state-action appears only once. 
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
% Date:         $Date: 2020/07/31 16:04:50CEST $
% Revision:     $Rev: 6720 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_055_d(system, cmd_s)














































































































