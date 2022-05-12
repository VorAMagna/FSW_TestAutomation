%% Format of entries in a State block
%
% [result,cr_items,r_stats] = mes_misra_slsf_055_a(system, cmd_s)
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
%   MISRA AC SLSF 055 a
%
% DESCRIPTION:
% ============
% % All “entry:” actions must appear before all “during:” actions and all “during:”
% actions must appear before all “exit:” actions.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each state in a chart.
% Failed: If the order of the state-actions is not 'entry'-'during'-'exit'.
% Passed: If the case failed does not apply. 
%
% SOLUTION:
% =========
% Order the state-actions in each state according to the order 'entry' - 'during' - 'exit'.
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
% Date:         $Date: 2020/07/31 16:04:49CEST $
% Revision:     $Rev: 6720 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_055_a(system, cmd_s)













































































































