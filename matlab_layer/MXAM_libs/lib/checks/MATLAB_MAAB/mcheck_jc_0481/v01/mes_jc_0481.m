%% Use of hard equality comparisons for floating point numbers in Stateflow
%
% [result,cr_items,r_stats] = mes_jc_0481(system, cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistic s on the check result
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>,
%
% REFERENCED GUIDELINE:
% =====================
% Control Algorithm Modeling Using Matlab,Simulink, and Stateflow
% Version 3.0
% MathWorks Automotive Advisory Board (MAAB)
% Guideline Rule ID: jc_0481 (8.2.6.)
%
% DESCRIPTION:
% ============
% Do not use hard equality comparisons (Var1 == Var2) with two floating
% point numbers. If a hard comparison is required, a margin of error should
% be defined and used in the comparison (LIMIT in the example). Hard
% equality comparisons may be done between two integer data types.
%
% Note. if one floating point number is compared with a non-floating point
% number, we regard it violation of this rule.

function [result,cr_items,r_stats] = mes_jc_0481(system, cmd_s) %#ok<INUSD>













































































