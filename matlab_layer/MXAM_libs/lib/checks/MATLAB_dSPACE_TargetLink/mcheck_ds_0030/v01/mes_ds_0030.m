% MES check: ds_0030 - Limitations with regard to parameters for the
%                      Product Block
% 
% function [result,cr_items,r_stats] = mes_ds_0030(system, cmd_s)
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
% ds_0030 - Limitations with regard to Parameters for the Product Block
%
% Calculating the reciprocal of an input via the Number of inputs: / setting 
% for the Block Parameters is only permitted for scalar input signals. 
% In addition, calculating the reciprocal value 1/(x*y) of a product of input
% values via the settings Number of inputs: // in the Block Parameters 
% is not permitted either.
%
% CHECK PREREQUISITES:
% ====================
% This check requires the model to be in COMPILE MODE!
%
% PASS/FAIL CRITERIA:
% ===================
% Product Blocks which calculate the reciprocal via the settings number of
% inputs / oder // receive a fail, otherwise a pass.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:09CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0030(system, cmd_s) %#ok<INUSD>










































































































































