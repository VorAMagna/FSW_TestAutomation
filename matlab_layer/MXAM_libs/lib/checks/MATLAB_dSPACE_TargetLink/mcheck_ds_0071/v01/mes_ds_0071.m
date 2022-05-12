% MES check: ds_0071- Complex Expressions for the Size Property
%
% function [result,cr_items,r_stats] = mes_ds_0071(system, cmd_s)
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
% ds_0071- Complex Expressions for the Size Property
%
% Complex expressions must not be used for the Size property in Stateflow
% when working with TargetLink versions older than TargetLink 3.0.1. (e.g.
% the size of one stateflow variable x is determined by the value of
% another stateflow variable y).
% 
% Remark: This feature, which was newly introduced with Release R14, 
% is supported since TargetLink 3.0.1.
%
% PASS CRITERIA:
% ================
% A pass is given when no such literal can be found wihtin the size
% property of a Stateflow variable when working with TargetLink versions
% older than TargetLink 3.0.1, or TL version is after 3.0.1.
%
% FAIL CRITERIA:
% ================
% A fail is given to each chart whenever it contains a Stateflow variable
% whose property contains literal characters (e.g. a-z, A-Z) if the TL
% version is older than 3.0.1. In this case it is assumed that the size
% property is calculated via the value of other chart variables.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:22CEST $
% Revision:     $Rev: 7186 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0071(system, cmd_s) %#ok<INUSD>









































































































