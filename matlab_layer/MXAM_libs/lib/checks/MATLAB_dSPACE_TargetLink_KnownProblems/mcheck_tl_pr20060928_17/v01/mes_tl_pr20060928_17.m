% MES check: tl_pr20060928_17 - Components of DD struct variables may get
% incorrectly merged in generated code
%
% function [result,cr_items,r_stats] = mes_tl_pr20060928_17(system, cmd_s)
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
% tl_pr20060928_17 - Components of DD struct variables may get incorrectly
% merged in generated code
%
% You may use components of DataDictionary struct variables multiple times
% in one TargetLink Subsystem if the component's variable class has the
% MERGABLE flag set. The component may be used for block variables that
% require an initial value. Unlike for plain variables, TargetLink doesn't
% check if all the initial values are identical. Only one initial value is
% used and all other initial values are ignored. Wrong production code may
% be generated.
%
% PASS/FAIL CRITERIA:
% ===================
% TL blocks which select the same DD variable component whos value
% property is empty and variable class has the MERGABLE flag are faulty.
%
% SOLUTION:
% =========
% Set the value property of the component or make sure the all initial
% values are identical. use the ddv-command at the affected blocks.
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% version:      $Id: mes_tl_pr20060928_17.m 1.1 2020/07/31 16:05:38CEST Vojnic-Hajduk, Vladimir (vladvojn) Exp  $
% ***********************************************************

function [result,cr_items,r_stats] = mes_tl_pr20060928_17(system, cmd_s) %#ok<INUSD>





































































































































































































































































































