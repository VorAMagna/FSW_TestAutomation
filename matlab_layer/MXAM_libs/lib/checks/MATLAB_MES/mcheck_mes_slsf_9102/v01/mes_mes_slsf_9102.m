%% Naming of Logged Signals
%
% [result,cr_items,r_stats] = mes_mes_slsf_9102(system, cmd_s)
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
% mes_slsf_9102 - Naming of Logged Signals
%
% The guideline requires each logged signal or signal with enabled test point (see Signal Properties > Logging and accessibility) to have a proper name either through direct labeling or enabled signal name propagation.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each signal line in the model that has at least one of the Simulink options 'Log signal data' or 'Test point' enabled.
%
%     Failed 1: The signal label is empty and either signal propagation is disabled or the propagated signal name is empty.
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

function [result, cr_items, r_stats] = mes_mes_slsf_9102(system, cmd_s)






















































































































































































