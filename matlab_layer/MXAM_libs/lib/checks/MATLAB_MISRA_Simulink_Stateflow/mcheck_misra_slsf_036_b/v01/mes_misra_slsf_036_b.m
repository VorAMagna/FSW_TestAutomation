% MES check: misra_slsf_036_b - Stateflow/Simulink interface parameters, Part B
%
% function [result,cr_items,r_stats] = mes_misra_slsf_036_b(system, cmd_s)
%
% INPUT PARAMETERS:
% =================
%   system:  model/subsystem to be checked
%   cmd_s:   check options, syntax /<key>:<val>, for details See also
%   mes_jc_0061
%
% GUIDELINE: 
% ==========
% Original Reference:
%   MISRA AC SLSF Modelling design and style guidelines for the 
%   application of simulink and stateflow, MIRA limited, May 2009, 
%   Ver 1.0, www.misra.org.uk
% 
%   Guideline Rule ID: MISRA AC SLSF 036_b
% 
% Guideline Update Reference:
%   
%   Guideline Rule ID: MISRA AC SLSF 036b
%
% MES CHECK: 
% ==========
% MES check: misra_slsf_036_b -  Stateflow/Simulink interface parameters
%
% All calibration parameters should be passed into the Stateflow chart as 
% Simulink inputs
%
% PASS CRITERIA:
% ================
% All calibration parameters that a state chart depends on, enter the chart 
% explicitly as external signal originating from a respective constant block.
%
% FAIL CRITERIA:
% ================
% A calibration parameter is specified as 'Parameter from Simulink' in the 
% state chart via the model explorer.
%
% SOLUTION:
% =========
% Make the parameter dependence explicit by an external input signal from 
% Simulink originating from a respective constant block.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:25CEST $
% Revision:     $Rev: 7268 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_036_b(system, cmd_s) 










































































