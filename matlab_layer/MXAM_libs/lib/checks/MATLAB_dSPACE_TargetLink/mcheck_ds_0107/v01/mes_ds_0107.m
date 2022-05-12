%% Use of Data Types for Multiport Switch Block
%
% [result,cr_items,r_stats] = mes_ds_0107(system, cmd_s)
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
% ds_0107: The first input (control port) of the Multiport Switch block
% should be driven by a signal with an unsigned integer data type.
%
% The following unsigned data types are allowed:
% - uint8
% - uint16
% - uint32
% - all unsigned fixed-point data types (e.g. "ufix(x)", "unit(x)" )
%
% The input signal of the control port has to be non-negative and is cast
% to an integer number by Simulink during the simulation.
%
% NOTE: for this check, the model needs to be in compile mode.
%
% PASS/FAIL CRITERIA
% ==================
% The check analyzes the control inport of each Multiport Switch block in the model
% 
%     Failed 1: The data type of the control inport signal is not integer (uint8, uint16, or uint32) nor other unsigned fixed-point data type.
%     Review 2: The data type of the control input is an enumeration type.
% 
% The check result is passed if all failed and review cases do not apply.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% ***********************************************************

function [result,cr_items,r_stats]=mes_ds_0107(system, cmd_s)
































