% MES check: ds_0021 - Limitations with Regard to the Dead Zone Block
% 
% function [result,cr_items,r_stats] = mes_ds_0021(system, cmd_s)
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
% ds_0021 - Limitations with Regard to the Dead Zone Block
%
% Vector signals (one-dimensional signal arrays) as well as busses
% containing more than one signal are not permitted as input
% signals for the Dead Zone block.
% Since TL4.0, the 2D signal is supported.
% NOTE: TargetLink does not support vector signals for the Dead Zone block.
%
% CHECK PREREQUISITES:
% ====================
% This check requires the model to be in COMPILE MODE!
%
% PASS CRITERIA:
% ================
% A pass is given to every Dead Zone block which is only driven by scalar
% values or a bus with one signal.
% In TLVer>4.0, A pass is given to every Dead Zone block which is driven by
% scalar values or a vector or a bus with less or erqual to two signals.
%
% FAIL CRITERIA:
% ================
% A fail is given to every block whose input signal is a vector or a bus 
% that contains more than one signal.
% In TLVer>4.0, A fail is given to every block whose input signal is a
% vector or a bus that contains more than two signal.
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:05CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0021(varargin)





















































