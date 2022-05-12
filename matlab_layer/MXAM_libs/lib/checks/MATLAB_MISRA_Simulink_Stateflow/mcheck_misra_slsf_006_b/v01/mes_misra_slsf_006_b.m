%% Block Parameters - Calibration Parameters
%
% [result,cr_items,r_stats] = misra_slsf_006_b(system, cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistics on the check result
%
% INPUT:
% ======
% system:  model/subsystem to be checked
% cmd_s:   check options, syntax /<key>:<val>, for details See also
%
% MES CHECK:
% ==========
% Block parameters intended to be configured or calibrated
% must be entered as a named constant.
%
% PASS/FAIL CRITERIA:
% ==================
% The check analyzes each calibration parameter of each block in the model.
%
%     Failed 1: The parameter is entered as numerical value, expression or function call.
%
% The check result is passed if all failed cases do not apply.
%
% FIX ACTION:
% ==============
% No automatic repair action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_006_b(system,cmd_s)



























































































































































































































































































