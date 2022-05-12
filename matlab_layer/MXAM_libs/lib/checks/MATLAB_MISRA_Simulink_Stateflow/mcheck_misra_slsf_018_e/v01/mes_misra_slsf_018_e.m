% MES check: misra_slsf_018 - Use of From blocks: Corresponding Goto block
%
% function [result,cr_items,r_stats]=mes_misra_slsf_018_e(system,cmd_s)
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
%  Every From block must have exactly one matching goto block.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each From block in the model:
% Failed 1: The From block does not have a unique matching Goto block.
% The check result is passed if all failed cases do not apply.
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% version:      $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_018_e(system,cmd_s) 



















































































