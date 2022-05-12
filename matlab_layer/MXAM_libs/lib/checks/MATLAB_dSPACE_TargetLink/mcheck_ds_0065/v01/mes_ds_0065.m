% MES check: ds_0065 (Use of Alias Types)
%
% function [result,cr_items,r_stats] = mes_ds_0065(system, cmd_s)
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
% ds_0065 - The usage of user-defined names for data types in 
% Stateflow using Simulink Alias Type objects is not permitted.
%
% This feature, which was newly introduced with R14 SP2, is currently not
% supported by TargetLink.
%
% HOW THE CHECK WORKS:
% *******************
% 1. identifies variables in the MatLab workspace which are of 
%    class Simulink.AliasType
% 2. searches for stateflow data that are of Method "Expression" and
%    contain aliastypes as identified in 1.
%    If found, the chart.name and the data are returned in cr_items

function [result,cr_items,r_stats] = mes_ds_0065(system,cmd_s) %#ok<INUSD>
























































































































