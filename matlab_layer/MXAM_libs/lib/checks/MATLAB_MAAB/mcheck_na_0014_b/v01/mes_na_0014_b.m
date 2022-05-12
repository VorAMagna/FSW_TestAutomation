%% Use of Local Language in Simulink and Stateflow - Stateflow
%
% [result,cr_items,r_stats] = mes_na_0014_b(system, cmd_s)
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
% na_0014_b - Use of Local Language in Simulink and Stateflow - Stateflow
%
% The local language should be used only in descriptive fields. Descriptive
% fields are text entry points that do not affect code generation or
% simulation. Note: It is possible that Simulink can't open a model that
% includes local language on the different character encoding systems;
% thus, it is important to pay attention when using local characters in
% case of exchanging models between overseas.
%
% PASS/FAIL CRITERIA:
% ===================
% 	The check analyzes each Stateflow chart in the model.
% 
%     Failed 1: The name of the Chart is not ANSI C conforming.
%     Failed 2: A State label is not ANSI C conforming.
%     Failed 3: A Transition label is not ANSI C conforming.
%     Failed 4: A Box label is not ANSI C conforming.
%
% White-space characters, including carriage returns and blank spaces, are
% ignored.
% The check result is passed if all failed cases do not apply.
%
% FIX ACTION:
% ===========
% 	No automatic repair action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0014_b(system, cmd_s)







































































































































