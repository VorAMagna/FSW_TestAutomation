% MES check: ds_0072 - Simulink/Stateflow Inheritance
%
% function [result,cr_items,r_stats] = mes_ds_0072(system, cmd_s)
%
% RETURN PARAMETERS:
% ==================
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items 
%
% INPUT PARAMETERS:
% =================
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>, for details See also mes_check
%
% MES CHECK: 
% ==========
% ds_0072 - Simulink/Stateflow Inheritance
%
% The inheritance mechanism for the Size and Data Type properties at the
% Simulink-Stateflow interface must not be used in a Targetlink model.
%
% This feature, which was introduced with MATLAB Release R14, is 
% not supported by TargetLink versions < 2.2
%
% PASS/FAIL CRITERIA:
% ===================
% A fail is given to a chart when 
%  a) the Size property of any Stateflow data object within the chart is set to "-1" 
%  or when 
%  b) the Type property of a data object is set to "inherited". 
% Otherwise, a pass is given to the chart.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:23CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0072(system, cmd_s) %#ok<INUSD>






















































































































































