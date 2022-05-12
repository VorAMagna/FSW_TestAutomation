% MES check: mcheck_mes_slsf_2102 - Usage of UnitDelay and Memory blocks
% function [result,cr_items,r_stats] = mes_mes_slsf_2102(system, cmd_s) %#ok<INUSD>
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
% Description:	In Simulink models the Memory or Unit Delay block is used 
% in feedback loops to avoid algebraic loops. The block should be added on 
% the highest possible level and inserted directly in the left-orientated feedback loop.
% In TargetLink models only TargetLink UnitDelay block is allowed.
% Rationale:	By placing the UnitDelay/Memory block on the highest possible 
% level, it is easier to identify the feedback loop and the execution order 
% of the subsystems.Memory blocks are not allowed in TargetLink.
% 
% PASS/FAIL CRITERIA:
% ================
% The check analyzes each Memory and UnitDelay block.
% Failed1: If a Memory block is used in a TargetLink model.
% Failed2: If a Memory or UnitDelay block is used in a feedback loop, but is not placed on the highest possible level.
% Failed2: If a Unit Delay block in an atomic subsystem, but is not placed on the highest level and in the feedback branch.
%
% ***********************************************************
% copyright:    Model Engineering Solutions GmbH
% version:      $Id: mes_slsf_2102.m 6115 
% ***********************************************************

function [result,cr_items,r_stats] = mes_mes_slsf_2102(system, cmd_s) 































