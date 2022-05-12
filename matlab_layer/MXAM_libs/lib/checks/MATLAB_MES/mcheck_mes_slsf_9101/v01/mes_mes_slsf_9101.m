%% Avoid Blocks With Generic Name
%
% [result,cr_items,r_stats] = mes_mes_slsf_9101(system, cmd_s)
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
% mes_slsf_9101 - Avoid Blocks With Generic Name
%
%     There should be no block in the model with the standard name from the
%     block library. The Simulink, Stateflow, and TargetLink libraries have
%     generic block names that should be substituted for individual names.
%     Also, user-defined library blocks should have a name that describes
%     the purpose of the block in the context of the model.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each block in the model.
%
%   - Failed: The name of the block is identical to a library block name,
%     possibly followed by a number.
%
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

function [result, cr_items, r_stats] = mes_mes_slsf_9101(system, cmd_s)

































































































































































































































