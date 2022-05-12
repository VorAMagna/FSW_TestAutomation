% MES check: misra_slsf_036_a - Stateflow/Simulink interface signals,
% parameters and naming. A) Avoidance of bus inputs.
%
% function [result,cr_items,r_stats] = mes_misra_slsf_036_a(system, cmd_s)
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
% misra_slsf_036_a - Stareflow/Simulink interface signals should not be bus
%
% Bus inputs to Stareflow are not permitted.
%
% Rationale
% ======================
% Improved type control within Simulink. Busses are used in Simulink to
% package signals together, often various different types. Each data item
% in Stateflow has one unique type definition and therefore must not be
% used to interprete data of differing types. This rule improves the type
% integrity between Simulink and Stateflow.
%
% PAS/FAIL CRITERIA:
% ================
% Stateflow charts without bus inport signals will pass the check.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:25CEST $
% Revision:     $Rev: 15523 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_036_a(system, cmd_s) %#ok<INUSD>































































































































