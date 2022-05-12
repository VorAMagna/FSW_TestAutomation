%% In- and Outports in TL subsystems
%
% [result,cr_items,r_stats] = mes_sk_006(system, cmd_s)
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
% All in- and outports in a TargetLink subsystem or function should be
% TargetLink in- and outputs.
%
% PASS/FAIL CRITERIA:
% ===================
% The check returns a fail, if there exist Simulink In- and outports in a
% TargetLink subsystem or function 
%
% FIX ACTION:
% ===========
% The fix replaces Simulink In- and outports with TargetLink in- and
% outports
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:53CEST $
% Revision:     $Rev: 15223 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_mes_sk_006(system, cmd_s)


































































































































