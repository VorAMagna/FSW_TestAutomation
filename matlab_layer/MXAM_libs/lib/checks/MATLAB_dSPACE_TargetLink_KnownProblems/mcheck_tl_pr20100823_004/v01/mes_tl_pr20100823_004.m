% MES check: tl_prpr20100823_004 - Saturation Code is Erroneously Omitted if Block Output is Merged with Subsequent Saturation Block
%
% function [result,cr_items,r_stats] = mes_tl_pr20100823_004(system, cmd_s)
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
% tl_pr20100823_004 - Saturation Code is Erroneously Omitted if Block Output is Merged with Subsequent Saturation Block
%
%Saturation code might be erroneously omitted in the generated code if the
%block output variable of a Saturation block fulfills the following
%conditions:
%  - does not have static storage duration (static storage means variable
%    class 'Properties Scope = global and/or Storage = static)
%  - it has a variable class with set MERGEABLE Optimization property 
%  - the merged variable is also the block output variable of the predecessor
%    block.
% 
% PASS/FAIL CRITERIA:
% ===================
% All TL_Saturation blocks with the following conditions will be checked:
% output variable does not have static storage duration(static storage
% means variable class' Properties Scope = global and/or Storage = static),
% and, the 'Optimization' property of this class has 'mergeable' included.
% In the following case a fail or warning will be given:
% 
% If the predecessor block has same variable class properties(property
% scope and optimization)  and 
% 1.output.variable is not empty or a string with or without macro $L $B $M
% is used in output.name and the variable that will be generated by the
% Targetlink for this both blocks are definitely same, fail will be given;
% 2.if in the output.name a string with macro other than $L $B $M is used,
% a warning will be given. 
%
% SOLUTION:
% =========
% Besides of violating one of the conditions noted above in the
% description following is possible too: Specify the limits of the
% Saturation block to be variables with unset variable class ERASABLE
% Optimization property and Macro = on. -- OR -- Give the block output
% variable of the Saturation block static storage duration (see condition
% 1).
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% version:      $Id: mes_tl_pr20100823_004.m 1.1 2020/07/31 16:05:41CEST Vojnic-Hajduk, Vladimir (vladvojn) Exp  $
% ***********************************************************

function [result,cr_items,r_stats] = mes_tl_pr20100823_004(system, cmd_s) %#ok<INUSD>


































































































































































































































