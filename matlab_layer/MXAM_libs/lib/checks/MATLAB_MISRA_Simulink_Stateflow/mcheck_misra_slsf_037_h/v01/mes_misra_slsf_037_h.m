% MES check: misra_slsf_037_h - Internal data of Stateflow chart. 
% H) type of data items must not be set to 'inherit:same as Simulink'
%
% function [result,cr_items,r_stats] = mes_misra_slsf_037_h(system, cmd_s)
%
% RETURN PARAMETERS:
% ==================
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items 
%
% INPUT PARAMETERS:
% =================
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>, for details See also mes_check
%
% MES CHECK: 
% ==========
% misra_slsf_037_h - Internal dada of Stateflow chart. 
% Part H) ype of data items must not be set to 'inherit:same as Simulink'
%
% The inheritance mechanism for Data Type properties at the
% Simulink-Stateflow interface must not be used.
%
% PASS/FAIL CRITERIA:
% ===================
% A fail is given to a chart when the Type property of a data object is set
% to "inherited". Otherwise, a pass is given to the chart.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:28CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_037_h(system, cmd_s) %#ok<INUSD>

































































































