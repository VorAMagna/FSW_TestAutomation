% MES check: misra_slsf_037_a - Stateflow Data should not be defined at
% model level
% 
% function [result,cr_items,r_stats] = mes_misra_slsf_037_a(system, cmd_s)
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
% misra_slsf_037_a - Stateflow Data should not be defined at model level
%
% All data of a Stateflow block must be defined at the chart level or below
% in the object hierarchy and not at the model level.
% 
% Rationale:
% Data at the stateflow block level allows hidden communication between
% state machines. Any communication between Stateflow blocks must be
% explicitly drawn in Simulink.
%
% PASS/FAIL CRITERIA:
% ================
% Data defined at the model level will get a Fail.
% 
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:26CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_037_a(system, cmd_s) %#ok<STOUT,INUSD>















































































