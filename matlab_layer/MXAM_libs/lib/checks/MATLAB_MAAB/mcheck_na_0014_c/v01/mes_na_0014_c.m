%% Use of Local Language in Simulink and Stateflow - TargetLink DD Variables
%
% [result,cr_items,r_stats] = mes_na_0014_c(system, cmd_s)
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
% na_0014_c - Use of Local Language in Simulink and Stateflow - TargetLink DD Variables
%
% The local language should be used only in descriptive fields. Descriptive
% fields are text entry points that do not affect code generation or simulation.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each variable in the TargetLink Data Dictionary.
% 
%   - Failed: The variable name is not ANSI C conforming.
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

function [result, cr_items, r_stats] = mes_na_0014_c(system, cmd_s)













































































