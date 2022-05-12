% MES check: ds_0063 - No Use of Implicit Events 
%
% function [result,cr_items,r_stats] = mes_ds_0063(system, cmd_s)
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
%
% ds_0063 - Implicit events (change, enter, exit) should not be used.
% 
% Remark: While the receivers of implicit event broadcast are defined 
% through event specifiers (change, chg, enter, en, exit, ex) there is
% no such specification with regard to the origin of the implicit event. 
% The usage of implicit events is therefore intransparent concerning
% potential side effects of variable assignments or the entering/exiting
% of states.  
%
% PASS/FAIL CRITERIA:
% ===================
% Stateflow transitions which use the implicit events 'change', 'chg', 'enter', 
% 'en', 'exit', 'ex', 'tick' or 'wakeup' get a fail.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:20CEST $
% Revision:     $Rev: 14932 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0063(system, cmd_s) %#ok<INUSD>









































































































































