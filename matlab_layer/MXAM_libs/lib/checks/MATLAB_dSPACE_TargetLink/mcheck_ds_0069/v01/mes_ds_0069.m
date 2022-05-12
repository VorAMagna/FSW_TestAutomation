% MES check: ds_0069 - Data on the level of Stateflow Boxes 
% 
% function [result,cr_items,r_stats] = mes_ds_0069(system, cmd_s)
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
% ds_0069 - Data on the level of Stateflow Boxes 
%
% Data must not be defined on the level of Stateflow boxes. 
% Instead the hierarchy level above can be used.
% 
% Remark: This feature, which was newly introduced with Release R14, 
% is currently not supported by TargetLink. 
%
% PASS CRITERIA:
% ================
% Each chart which has not defined data at the level of any stateflow box 
% within the chart receives a pass.
% 
% FAIL CRITERIA:
% ================
% Each chart which contains data at the level of any stateflow box within
% the chart receives a fail.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:22CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0069(system, cmd_s) %#ok<INUSD>






























































































