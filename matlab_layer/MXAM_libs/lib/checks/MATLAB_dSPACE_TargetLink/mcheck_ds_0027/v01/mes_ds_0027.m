% MES check: ds_0027 - Restrictions with Regard to Look-up Table Dimensions
%
% function [result,cr_items,r_stats] = mes_ds_0027(system, cmd_s)
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
% ds_0027 - Restrictions with Regard to Look-up Table Dimensions
%
% The blocks Look-Up Table (n-D) and Direct Look-up Table (n-D) must be
% used only in a conjunction with dimensions smaller than defined number (default is three).
%
% NOTE: TargetLink does not support parameters with dimensions greater than
% two.
%
% PASS CRITERIA:
% ==============
% A pass is given to every Look-Up Table (n-D) and Direct Look-up Table (n-D)
% block whose 'Number of table dimensions' property is smaller than defined
% number (default is three).
%
% FAIL CRITERIA:
% ==============
% A fail is given to every Look-Up Table (n-D) and Direct Look-up Table (n-D)
% block whose 'Number of table dimensions' property is greater than defined
% number (default is two).
%
% CHECK PARAMETERS:
% =================
% dSPACE.MaxTableDimension:
%   DATATYPE:
%       integer
%   DEFAULT VALUE:
%       2
%   DESCRIPTION:
%       Maximal dimension of a LoopUp Table
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:08CEST $
% Revision:     $Rev: 6835 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0027(system, cmd_s) %#ok<INUSD>





































































































































































