%% State Machine Patterns for Transition Actions
%
% [result,cr_items,r_stats] = mes_db_0151(system, cmd_s)
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
% MES CHECK:
% ==========
% db_0151 - State Machine Patterns for Transition Actions
% This check analyzes the State Machine patterns for transition actions.
% Two or more transition actions in the same line are not allowed.
%
% PASS/FAIL CRITERIA:
% ===================
% This check analyzes each transition action within Stateflow state machines.
%
%     Failed 1: There are two or more transition actions in the same line.
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
% Date:         $Date: 2020/07/31 16:03:25CEST $
% Revision:     $Rev: 15223 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0151(system, cmd_s)


















































