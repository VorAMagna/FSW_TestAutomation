%% No Loops in Multi Segmented Transitions
%
% function [result,cr_items,r_stats] = mes_mes_sf_001(system, cmd_s)
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
% mes_sf_001 - No Loops in Multi Segmented Transitions
%
% DESCRIPTION:
% ============
% The check gives a Review message for every loop in multi-segmented
% transitions found in the model.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each Stateflow transition path in the model.
%     Review: The path contains a loop.
% The check result is passed if no loops occur.
%
% SOLUTION:
% =========
% Ensure that each Stateflow chart fulfills one of the following conditions:
%     - The chart does not contain a transition path that forms a loop.
%     - Each loop eventually terminates.
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
% Since the termination of a loop is difficult to evaluate, the check
% verifies  the existence of loops ang gives a Review message.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:02:56CEST $
% Version:      $Rev: 7304 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_mes_sf_001(system,cmd_s)

































































































































































