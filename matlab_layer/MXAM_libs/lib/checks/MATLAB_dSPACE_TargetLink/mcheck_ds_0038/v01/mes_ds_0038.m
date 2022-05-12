% MES check: ds_0038 - Absence of duplicated Inports
%
% function [result,cr_items,r_stats] = mes_ds_0038(system, cmd_s)
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
% ds_0038 - Absence of duplicated Inports
%
% Duplicate Inports, which were introduced with Release R14, should be avoided.
%
% Remark: Duplicate Inports lead to an intransparent modeling style prone 
% to errors because the connection between individual ports gets lost. 
% As a result, it is rather intransparent how many input variables a 
% subsystem has and modifications can have unexpected side-effects. 
% TargetLink does not support duplicate Inports. 
%
% PASS CRITERIA:
% ================
% All Inports of BlockType Inport receive a pass.
%
% FAIL CRITERIA:
% ================
% All Inports of BlockType InportShadow receive a fail.
%  
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:13CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0038(system, cmd_s) %#ok<INUSD>








































