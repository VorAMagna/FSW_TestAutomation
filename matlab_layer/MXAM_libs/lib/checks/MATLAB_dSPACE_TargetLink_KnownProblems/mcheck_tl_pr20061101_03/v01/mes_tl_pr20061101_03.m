%% MES check: mes_tl_pr20061101_03 - Merge Blocks in Enabled Subsystems
%
% function [result,cr_items,r_stats] = mes_tl_pr20061101_03(system, cmd_s)
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
% mes_tl_pr20061101_03 - Merge Blocks in Enabled Subsystems
% If all of the following conditions are fulfilled, wrong code may be generated for a Merge block:
% -   A Merge block resides in an Enabled subsystem X and drives a Simulink outport of X
% -   The Simulink outport has specified another initial value than the Merge block
% -   The Merge variable is not written during the execution of X.
%
% PASS/FAIL CRITERIA:
% ================
% The check analyzes each Merge block which resides in an enabled subsystem and drives a Simulink Outport.
% Review: If the Simulink Outport has specified another initial value than the Merge block.
% The check is passed, if the review condition is not met.
%
% SOLUTION:
% =========
% If possible, adjust the initial values of the Merge block and the Outport.
% Otherwise, follow the review measures in the related guideline and use
% the annotations to document the review activities and to set the review result to passed.
%
% NOTE:
% =====
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% version:      $Id: mes_tl_pr20061101_03.m 1.1 2020/07/31 16:05:39CEST Vojnic-Hajduk, Vladimir (vladvojn) Exp  $
% ***********************************************************

function [result,cr_items,r_stats] =mes_tl_pr20061101_03(system, cmd_s)










































































































































































































