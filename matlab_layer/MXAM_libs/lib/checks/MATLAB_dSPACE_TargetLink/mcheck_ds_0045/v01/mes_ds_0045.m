% MES check: ds_0045 - No Cascades of Merge Blocks prior to TargetLink
% 2.1.6
%
% function [result,cr_items,r_stats] = mes_ds_0045(system, cmd_s)
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
% ds_0045 - No Cascades of Merge Blocks prior to TargetLink
%
% In TargetLink versions prior to TargetLink 2.1.6, cascades of Merge 
% blocks are not permitted. Instead, the hierarchy must be flattened 
% using only one Merge block with multiple inputs. 
% Since TargetLink 2.1.6, cascades of Merge blocks are fully supported.
%
% PASS CRITERIA:
% ================
% Every Merge block which has no incoming signal connected to a Merge block passes the
% check.
%
% FAIL CRITERIA:
% ================
% Every Merge block which has an incoming signal connected to another Merge block receives a
% fail.
%  
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:15CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0045(system, cmd_s) %#ok<INUSD>















































































































































