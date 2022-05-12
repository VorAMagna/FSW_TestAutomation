% MES check: misra_slsf_016_e - Busses-part E
% function [result,cr_items,r_stats] = mes_misra_slsf_016_e(system, cmd_s)
%
% RETURN VARIABLES:
% ==================
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items 
%
% INPUT ARGUMENTS:
% =================
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>, for details See also mes_jc_0061
%
% MES CHECK: 
% ==========
% misra_slsf_016_e - A bus must only be split up using a bus-selector block
% and not a demux block.
%
% PASS/FAIL CRITERIA:
% ================
% If a demux block is used to split a bus signal, this check issues a fail
% for this demux block.
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:08CEST $
% Version:      $Rev: 15479 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_016_e(system, cmd_s) %#ok<INUSD>















































