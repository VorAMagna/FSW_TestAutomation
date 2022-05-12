%% Transitions - Unguarded Transitions
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
%   MISRA AC SLSF 043 g
%
% DESCRIPTION:
% ============
% In all state-charts, flow-charts and graphical functions, an unguarded
% transition from a junction that also has a guarded transition must not exit the state boundary.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each Stateflow chart.
% Failed: If an unconditioned transition from a junction, which also has an outgoing conditioned transition, exits the state.
% The check result is passed if the failed case does not apply.
%
% SOLUTION:
% =========
% Insert an additional junction such that the transition which exits the
% state is the only outgoing transition of this junction.
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

function [result, cr_items, r_stats] = mes_misra_slsf_043_g(system, cmd_s)
























































































































