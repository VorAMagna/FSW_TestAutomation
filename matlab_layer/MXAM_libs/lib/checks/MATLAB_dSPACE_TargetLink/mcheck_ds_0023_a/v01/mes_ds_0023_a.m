% MES check: ds_0023_a -  Limitations with Regard to the Discrete-Time
% Integrator Block
%
% function [result,cr_items,r_stats] = mes_ds_0023_a(system, cmd_s)
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
%
% ds_0023_a -  Limitations with Regard to the Discrete-Time Integrator Block
% 
% Vector signals (one-dimensional signal arrays) are not permitted for 
% the Discrete-Time Integrator block.
%
% Remark: TargetLink does not support vector signals for the 
% Discrete-Time Integrator block.
%
% CHECK PREREQUISITES:
% ====================
% The model is assumed to be in compiled mode.
%
% PASS CRITERIA:
% ================
% A pass is given to every Discrete-Time Integrator block whose signals are
% scalar values.
%
% FAIL CRITERIA:
% ================
% A fail is given to every Discrete-Time Integrator block whose signals are
% vectors (one-dimensional signals arrays).
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:06CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0023_a(system, cmd_s) %#ok<INUSD>










































































































