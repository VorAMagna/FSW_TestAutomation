%% Unique Naming of Subsystems and Charts
%
% [result,cr_items,r_stats] = mes_mes_slsf_9103(system, cmd_s)
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
% mes_slsf_9103 - Unique Naming of Subsystems and Charts
%
% 	Each Subsystem and Chart in the model should have a unique name.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each Subsystem and Chart block in the model.
%
%     Failed 1: The name of the Subsystem or Chart is not unique within the model.
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

function [result, cr_items, r_stats] = mes_mes_slsf_9103(system, cmd_s)
































































































































































