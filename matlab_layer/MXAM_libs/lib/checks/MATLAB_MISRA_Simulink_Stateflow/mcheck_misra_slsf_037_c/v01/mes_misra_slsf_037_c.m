% MES check: misra_slsf_037_c - Internal Data - Naming of Local Data
% 
% function [result,cr_items,r_stats] = mes_misra_slsf_037_c(system, cmd_s)
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
% misra_slsf_037_c - Internal Data - Naming of Local Data
% The name of a local data item must not be the same as any signal or
% variable name within the model or any other Statechart
%
% RATIONALE:
% ==========
% All objects should be uniquely named to avoid misinterpretation.
%
% PASS/FAIL CRITERIA:
% ================
% All the Stateflow data with local scope will be analyzed.
% Passed: if the local data does not have same name as any Simulink signal
%         or variables used by this model or Stateflow data within another
%         chart.
% Failed: if a local data has same name as signal or variable or Stateflow
%         data within another chart.
%
% NOTE:
% =====
% Local data of a Chart from a library can have same name as data of other
% instance. Stateflow data within another chart is understood as all data
% of the Stateflow, i.e input, output, local, constant, parameter.
%
% SOLUTION:
% =========
% Use unique name for local Stateflow data, not same as simulink signal
% name and model variables and data in other statecharts
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:27CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_037_c(system, cmd_s) %#ok<STOUT,INUSD>


























































































































































































