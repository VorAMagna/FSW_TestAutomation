%% Use of the return value from graphical functions
%
% [result,cr_items,r_stats] = mes_jc_0521(system, cmd_s)
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
% Guideline Rule ID: jc_0521 (8.1.9.)
%
% DESCRIPTION:
% ============
% The return value from a graphical function should not be used directly in 
% a comparison operation.
%
% PASS/FAIL CRITERIA:
% ===================
% Each transition that use a graphical function whithin a condition
% receives a fail. 
%
% SOLUTION:
% =========
% Do not use graphical functions within transition conditions. Set
% temp-variables as output for a graphical function in a transition action
% and use this temp-variable in the condition. 
%
% FIX OPERATION:
% ==============
% No automatic fix available. 
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% Increase Readability by following this guideline. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:33CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jc_0521(system, cmd_s)








































