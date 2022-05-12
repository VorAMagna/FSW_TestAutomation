% MES check: ds_0054 - Initializations of a Stateflow Chart
%
% function [result,cr_items,r_stats] = mes_ds_0054(system, cmd_s)
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
% ds_0054 - Initializations of a Stateflow Chart
%
% The "Execute (enter) Chart At Initialization" option in the Chart
% Properties dialog must not be used.
%
% The use of this option would lead to execution of the default transition
% of a Stateflow chart whenever the Simulink model is initialized. 
% TargetLink ignores this option so that default transitions are 
% executed when the Stateflow chart is executed for the first time.
%
% PASS CRITERIA:
% ==============
% Each chart whose property "Execute (enter) Chart At Initialization"
% is deselected will receive a pass.
%
% FAIL CRITERIA:
% ================
% Each chart whose property "Execute (enter) Chart At Initialization"
% is selected will receive a fail.
%
% FIX ACTION:
% The property "Execute (enter) Chart At Initialization" of a chart will be deselected.
% 
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:18CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0054(system, cmd_s) %#ok<INUSD>

























































































