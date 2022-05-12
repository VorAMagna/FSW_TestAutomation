%% Use of single variable variant conditionals
%
% [result,cr_items,r_stats] = mes_na_0037(system, cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistic s on the check result
% for details use 'open mes_check_info'
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>,
% for details use 'open mes_check_info'
%
% REFERENCED GUIDELINE:
% =====================
% Control Algorithm Modeling Using Matlab,Simulink, and Stateflow
% Version 3.0
% MathWorks Automotive Advisory Board (MAAB)
% Guideline Rule ID: na_0037 (5.2.4.)
%
% DESCRIPTION:
% ============
% Variant conditional expressions should be composed using either a single
% variable with compound conditions or multiple variables with a single
% condition. The default variant is an exception to the second rule.
%
% PASS/FAIL CRITERIA:
% ===================
% A variant subsystem contains only one variant variable or multiple variales
% with single condition per line will get a pass, otherwise, a fail will be
% given
%
% Defintion of single condition: Each variale appears in a condition 
% expression only once
% Defintion of compound condition: One variable appears in a condition 
% exprsssion more than once (this one differs from the official 
% definition: simple conditions joined by logical connectives.)
%
% SOLUTION:
% =========
% Use signal variable or multiple variables with signal condition per line.
%
% FIX OPERATION:
% ==============
% No automatic fix available
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% - The variant control variale must be at the right side of a logical
%   expression, for example, var_control is the variant control variale, so
%   that the condition should be var_control>3 or var_control<d_constand, 
%   but should not be 3<var_control or d_constand>var_control
% - The the right handle side of a logical expression should be a constant
%   or an expression that can be evulated as a constant
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:45CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0037(system, cmd_s)






























































































































































































































































































