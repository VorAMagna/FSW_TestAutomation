% MES check: ds_0048 - Restrictions with regard to the Multiport Switch block
%
% function [result,cr_items,r_stats] = mes_ds_0048(system, cmd_s)
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
% ds_0048 - Restrictions with regard to the Multiport Switch block
%
% The Use zero-based indexing option for the Multiport Switch  block must
% not be used. This applies to TargetLink versions prior to TargetLink 2.1.
%
% The option is not supported by TargetLink versions prior to TargetLink 2.1.
%
% PASS CRITERIA:
% ==============
% Each Multiport Switch block whose option "Use zero-based indexing"
% is deselected will receive a pass.
%
% FAIL CRITERIA:
% ================
% Each Multiport Switch block whose option "Use zero-based indexing"
% is selected will receive a fail.
%
% FIX ACTION:
% ===========
% The option "Use zero-based indexing" of Multiport Switch block will be deselected.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:16CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0048(system, cmd_s) %#ok<INUSD>




































































