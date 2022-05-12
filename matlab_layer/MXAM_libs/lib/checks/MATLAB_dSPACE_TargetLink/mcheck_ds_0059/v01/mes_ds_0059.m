% MES check: ds_0059 - Use of Transition Actions
%
% function [result,cr_items,r_stats] = mes_ds_0059(system, cmd_s)
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
% ds_0059 - Use of Transition Actions
%
% Transition actions generally should be avoided in favor of condition 
% actions. Transition actions must not be used within loops.
% 
% Remark: Transition actions can lead to inefficient code and should 
% therefore be avoided. The behavior of transition actions within loops 
% might be unexpected by many users, which is why they are not supported 
% within loops. 
%
% PASS CRITERIA:
% ================
% Charts using no transition actions receive a pass.
% 
% FAIL CRITERIA:
% ================
% Each chart (be it pure flowchart or a state machine) which uses 
% transition actions within transition labels receives a fail.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:19CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0059(varargin) %#ok<INUSD>














































