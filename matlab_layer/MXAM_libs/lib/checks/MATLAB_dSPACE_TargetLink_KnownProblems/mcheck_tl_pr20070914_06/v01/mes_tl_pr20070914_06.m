% MES check: tl_pr20070914_06 - Wrong code for an Enabled, Triggered and
% Enabled or Action triggered subsystem in connection with incremental
% code generation.
%
% function [result,cr_items,r_stats] = mes_tl_pr20070914_06(system, cmd_s)
%
% RETURN PARAMETERS:
% ==================
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
%
% INPUT PARAMETERS:
% =================
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>, for details See also mes_jc_0061
%
% MES CHECK:
% ==========
% If all of the following conditions are fulfilled, wrong code is generated
% for an Enabled, Triggered and Enabled / Action triggered subsystem:
% 1.An enabled, triggered and enabled or Action triggered subsystem X resides
%   inside a subsystem Y which is configured for inremental codegeneration.
% 2.The Enable port or Action port of X has "States when enabling" or
%   "States when action is resumed" set to "reset".
% 3.Y is called directly or indirectly by an enabled, triggered and enabled
%   or Action triggered subsystem Z, or Y itself if an enabled, triggered and enabled
%   or Action triggered subsystem.
%
% The error is in the code which implements the call of Z: A flag which
% indicates the disabling of X is not set to "disabled".
%
% Fix: none
% Workaround:None.
%
% PASS/FAIL CRITERIA:
% ================
% In the following case, the model will get a fail:
% 1. A subsystem X has enable port or action port and the setting 'States
%    when enabling' or 'states when action is resumed' is set to 'reset'; and
% 2. this subsystem X resides inside a subsystem Y which is configured for
%    incremental codegeneration; and
% 3. Y is a subsystem of Z, and Z has enable port or action port, or
% 4. Y has an enable port / trigger port / action port(not a function call
%    subsystem) and Z triggers this port ("direct") or triggers a subsystem
%    S_1 that triggers S_2 that ... that triggers S_n that triggers this
%    port ("indirect").Z or the S_i may also be Stateflow charts.
%    If Y is a function call subsystem, then Z must have an enable port /
%    trigger port / action port.
%
% Note: all the trigger ports must connect with the trigger source.
%
% FIX ACTION:
% ===========
% NONE, must be manually corrected
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% version:      $Rev: 7151 $
%               $Date: 2020/07/31 16:05:40CEST $
% ***********************************************************

function [result,cr_items,r_stats] = mes_tl_pr20070914_06(system, cmd_s) %#ok<INUSD>














































































































































































































































































































































