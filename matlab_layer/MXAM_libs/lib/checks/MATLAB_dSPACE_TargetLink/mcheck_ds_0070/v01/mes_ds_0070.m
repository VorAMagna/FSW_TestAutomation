% MES check: ds_0070 - Embedded MATLAB Functionality 
% 
% function [result,cr_items,r_stats] = mes_ds_0070(system, cmd_s)
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
% ds_0070 - The Embedded MATLAB functionality in Stateflow must not be used.
% 
% Remark: TargetLink serves to generate highly efficient production code. 
% This is why only a limited subset of the functionality in
% Simulink/Stateflow is supported. The Embedded MATLAB functionality
% was introduced with Release R14 and is not supported by TargetLink. 
%
% PASS CRITERIA:
% ================
% Charts not using the embedded MALAB functionality receive a pass.
% 
% FAIL CRITERIA:
% ================
% Charts using the embedded MALAB functionality receive a fail.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:22CEST $
% Revision:     $Rev: 15479 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0070(system, cmd_s) %#ok<INUSD>











































