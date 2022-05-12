% MES check: ds_0025 - Limitations with Regard to the Relational Operator
% and Logical Operator Blocks
%
% function [result,cr_items,r_stats] = mes_ds_0025(system, cmd_s)
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
% ds_0025 - Limitations with Regard to the Relational Operator and Logical
% Operator Blocks
% 
% For Relational Operator and Logical Operator blocks, the Output data type
% mode property must be set to Boolean, Logical, or float(’double’).
% The uint(1) data type is also accepted. js: uint(1)=?
%
% TargetLink supports only the boolean and double data types at the output
% of these blocks. The data type is determined by the global Simulink 
% option Implement logic signals as boolean data (vs. double) available 
% under Configuration Parameters/Optimization.
%
% PASS CRITERIA:
% ==============
% Every Relational Operator and Logical Operator block receives a pass,
% whose Output data type is set to Boolean, Logical, 
% or float(’double’),or uint(1)
%
% FAIL CRITERIA:
% ==============
% Every Relational Operator and Logical Operator block receives a fail,
% whose Output data type is NOT set to Boolean, Logical, 
% or float(’double’),or uint(1)
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:07CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0025(varargin) 












































