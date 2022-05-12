% MES check: ds_0058 - Permitted Data Types at the Stateflow Chart Interface
%
% function [result,cr_items,r_stats] = mes_ds_0058(system, cmd_s)
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
% ds_0058 - Permitted Data Types at the Stateflow Chart Interface
%
% The Use Strong Data Typing with Simulink I/O option in the Chart 
% Properties dialogs shall be checked.
%
% Remark: Unless the option is checked, Stateflow performs implicit 
% data type conversions at the Simulink-Stateflow interface, which may 
% lead to data loss for variables of Input from Simulink or Output to 
% Simulink scope.
% 
% See also: [is_0004] 
%
% PASS CRITERIA:
% ================
% A pass is given to every Stateflow Chart whose
% 'StrongDataTypingWithSimulink' property is checked.
%
% FAIL CRITERIA:
% ================
% A pass is given to every Stateflow Chart whose
% 'StrongDataTypingWithSimulink' property is NOT checked.
%
% FIX ACTION:
% ===========
% The property "Use Strong Data Typing With Simjulink I/O" property of
% charts will be selected.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:19CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0058(system, cmd_s) %#ok<INUSD>









































































