% MES check: tl_hc_20141118_001 - Incorrect generated code if certain
% blocks are placed between the output of a conditionally executed system
% or Stateflow Chart and the input of a Merge block
%
% function [result,cr_items,r_stats] = mes_tl_hc_20141118_001(system, cmd_s)
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
% tl_hc_20141118_001 - Incorrect generated code if certain blocks are
% placed between the output of a conditionally executed system or Stateflow
% Chart and the input of a Merge block
% TargetLink may generate incorrect code and then simulation difference
% between MIL and SIL/PIL may occur if the following conditions are
% fulfilled: - The output of the conditionally executed system or Stateflow
% Chart is connect to the input of a Merge block only via blocks which are
% virtual for Simulink AND - At least one of the blocks placed on the
% signal line between the output of the system/chart and the input of the
% Merge block is one of the following blocks:
%    - TargetLink Inport block (TargetLink 2.x)
%    - TargetLink Outport block (TargetLink 2.x)
%    - TargetLink Bus Inport block (TargetLink 2.x)
%    - TargetLink Bus Outport block (TargetLink 2.x)
%    - enhanced Inport block (TargetLink >= 3.0)
%    - enhanced Outport block (TargetLink >= 3.0)
%
% SOLUTION:
% =========
% If possible avoid the use of the blocks listed above in the described situation.
% Or if the behavior of SIL/PIL-Simulation is acceptable for you, you can instead
% adapt the behavior of the MIL-Simulation to the behavior SIL/PIL-Simulation
% placing a computing block in the signal line between the output of the
% system/chart and the input of the Merge block. If the signal is a non-bus signal
% you can use a Rescaler block (available since TargetLink 3.0) or a Gain block
% with the gain value 1. If the signal is a bus signal you can use a TargetLink
% Bus Outport resp. an enhanced Outport block for this purpose (wrapped in another
% subsystem).
%
% Note: here in the solution, the using of bus ouport and enhanced outport
% conflict with the description of this guideline.
%
% PASS/FAIL CRITERIA:
% ================
% If between one output of one conditional executed subsystem or a
% stateflow chart and TL_merge block one of following blocks exist, a fail
% will be given to the TL_merger block:
%    - TargetLink Inport block (TargetLink 2.x)
%    - TargetLink Outport block (TargetLink 2.x)
%    - TargetLink Bus Inport block (TargetLink 2.x)
%    - TargetLink Bus Outport block (TargetLink 2.x)
%    - enhanced Inport block (TargetLink >= 3.0)
%    - enhanced Outport block (TargetLink >= 3.0)
%
%Note:By test with test model, if the enhanced bus inport and bus outport
%are used, wrong code will be generated. So that in the code, the enhanced
%tl_businport and tl_busoutport are considered too.
% ***********************************************************
% copyright:    Model Engineering Solutions
% version:      $Id: mes_tl_pr20141118_001.m 1.1 2020/07/31 16:05:42CEST Vojnic-Hajduk, Vladimir (vladvojn) Exp  $
% ***********************************************************

function [result,cr_items,r_stats] = mes_tl_pr20141118_001(system, cmd_s) %#ok<INUSD>










































































































































