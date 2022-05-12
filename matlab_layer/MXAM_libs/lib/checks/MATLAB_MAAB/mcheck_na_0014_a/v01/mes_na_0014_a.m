%% Use of Local Language in Simulink and Stateflow - Simulink
%
% [result,cr_items,r_stats] = mes_na_0014_a(system, cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistics on the check result
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>,
%
% MES CHECK:
% ==========
% na_0014_a - Use of Local Language in Simulink and Stateflow
%
% The local language should be used only in descriptive fields. Descriptive
% fields are text entry points that do not affect code generation or simulation.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each block and signal name in the model.
% 
%     Failed 1: The block name is not ANSI C conforming.
%     Failed 2: The signal name is not ANSI C conforming.
% 
% White-space characters, including carriage returns and blank spaces, are ignored.
% The check result is passed if all failed cases do not apply.
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0014_a(system, cmd_s)
























































































































































