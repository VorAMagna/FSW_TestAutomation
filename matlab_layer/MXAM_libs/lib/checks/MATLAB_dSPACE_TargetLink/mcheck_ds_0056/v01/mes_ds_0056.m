% MES check: ds_0056 - Permitted Dimensionality at the Stateflow Chart
%                       Interface
%
% function [result,cr_items,r_stats] = mes_ds_0056(system, cmd_s)
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
% ds_0056 - Permitted Dimensionality at the Stateflow Chart Interface
%
% Variables with Input from Simulink or Output to Simulink scope have to
% be scalar (one-element arrays) or vectors (one-dimensional arrays).
% Higher dimensions are not supported for the Simulink-Stateflow Interface.
%
% Remark: Since TargetLink does not support matrix signals in Simulink,
% the Simulink-Stateflow interface also has to be free of matrix signals.
%
% CHECK PREREQUISITES:
% ====================
% The model is assumed to be in COMPILE MODE!
%
% PASS CRITERIA:
% ================
% Each chart containing only Stateflow data objects within the scope
% "input from Simulink" or "output to Simulink" which are scalar or vectors
% will pass.
%
% FAIL CRITERIA:
% ================
% Each chart which contains a Stateflow data object within the scope
% "input from Simulink" or "output to Simulnk" with a higher dimension
% than two (i.e. [x,y] for all x > 1 AND y > 1) will receive
% a fail.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:18CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0056(system, cmd_s) %#ok<INUSD>































































































































