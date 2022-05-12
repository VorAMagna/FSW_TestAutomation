% MES check: ds_0029 - Limitations with regard to operand numbers of product blocks
%
% function [result,cr_items,r_stats] = mes_tl_0009(system, cmd_s)
%
% INPUT ARGUMENTS:
% ================
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>, for details, see mes_check
%
% RETURN VARIABLES:
% =================
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items 
%
%
% MES CHECK: 
% ==========
% ds_0029 - Limitations with regard to operand numbers of product blocks
%
% 1.) If a fixed-point data type is specified for the output of the Product
%     block, the number of inputs must not exceed two.
%
% 2.) If a fixed-point data type is specified for the output of the Product block 
%     AND if a vector is fed into the product block, the vector must not contain 
%     more than two signals
%
% Remark: 
% The generation of proper fixed-point code for the Product block with
% more than two operands requires the specification of scaling information for
% intermediate results. TargetLink therefore requires the number of input variables
% not to exceed two for fixed-point data types. 
% 
% Remark:
% Targetlink product blocks are not checked because TL up to version 2.2.1
% does not support code generation for these blocks, if they have more than
% two inports.
% Since 2010/07/16: TL blocks are checked
%
% CHECK PREREQUISITES:
% ====================
% This check requires the model to be in compile mode, if one of the
% checked product block has a SL source block.
%
% PASS/FAIL CRITERIA:
% ==============
% A pass is given for all product blocks with fixed-point output data type 
% have
% - two scalar inputs or
% - one vector input with only two elements or
% - a vector input and a scalar input or
% - two vector inputs of same size and element-wise mode activated
% 
%
% NOTE:
% =====
% In the case of two vector inputs of different size, this check will not
% be executed, as the model can not be set in compiled mode. 
% 
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:09CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0029(system, cmd_s) %#ok<INUSD>





















































































































































































































































