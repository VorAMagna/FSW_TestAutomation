% MES check: tl_kpr20141002_002 - Incorrect code for Discrete Transfer
% Function block with non-zero initial state values
%
% function [result,cr_items,r_stats] = mes_tl_kpr20141002_002(system, cmd_s)
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
% tl_kpr20141002_002 - Incorrect code for Discrete Transfer Function block
% with non-zero initial state values
% In newer versions Simulink's Discrete Transfer Function enables to have
% non-zero initial values for the block's transfer function states. This
% feature is not supported by TargetLink; in production code, all states
% are initialized to 0. Further TargetLink does not stop with an error when
% a Discrete Transfer Function block has non-zero initial values for its
% states. The code generator simply ignores this setting and the initial
% values are not represented by state initialization in generated
% production code.
% SOLUTION:
% =========
% Make sure Discrete Transfer Function blocks do not have non-zero initial
% values for the blocks' transfer function states.
%
% PASS/FAIL CRITERIA:
% ================
% This check check the discrete transfer function block (this can also be a
% TargetLink block), a Fall is given, if this block has property
% InitialStates and the value of InitialStates is not 0, otherwise, a Pass
% is given.
%
%Note:It is easy to set the initial value to 0, but it should be done
%manually and carefully, since the behavior of the block is changed.
% ***********************************************************
% copyright:    Model Engineering Solutions
% version:      $Id: mes_tl_pr20141002_002.m 1.1 2020/07/31 16:05:41CEST Vojnic-Hajduk, Vladimir (vladvojn) Exp  $
% ***********************************************************

function [result,cr_items,r_stats] = mes_tl_pr20141002_002(system, cmd_s) %#ok<INUSD>









































































































