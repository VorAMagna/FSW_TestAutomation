% MES check: ds_0057 - Usage of Constants in Stateflows
%
% function [result,cr_items,r_stats] = mes_ds_0057(system, cmd_s)
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
% ds_0057 - Usage of Constants 
%
% The dimensionality of variables with Constant scope must be 2 
% at most (two-dimensional arrays).
%
% Remark: Arrays of three or more dimensions are not supported 
% by TargetLink. 
%
% Examples:
%
% Value       | Size   | Type 
% =========================================
%   3         |  1     |  scalar     (PASS)
%  (1 2 3)    |  3     |  vector     (FAIL)
%  [1 2 3]    | [1x3]  |  1D-vector  (PASS)
%  [1 1;2 3]  | [2x2]  |  2D-matrix  (PASS)
%  cat(3, [9 2; 6 5], [7 1; 8 4])    | [2x2x2]  |  3D-matrix  (FAIL)
%
% CHECK PREREQUISITES:
% ====================
% This check requires the model to be in COMPILE MODE!
%
% PASS CRITERIA:
% ================
% Each chart which contains a Stateflow data object of a one or two 
% dimensional type within the scope "Constant" will receive a pass.
% 
%
% FAIL CRITERIA:
% ================
% Each chart which contains a Stateflow data object within the scope
% "Constant" with a higher dimension than two will receive a fail.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:19CEST $
% Revision:     $Rev: 7103 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0057(system, cmd_s) %#ok<INUSD>

































































































































