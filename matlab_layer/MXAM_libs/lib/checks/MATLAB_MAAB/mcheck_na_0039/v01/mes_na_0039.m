%% Use of Simulink in Stateflow charts
%
% [result,cr_items,r_stats] = mes_na_0039(system, cmd_s)
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
% Guideline Rule ID: na_0039 (8.6.2.)
%
% DESCRIPTION:
% ============
% Do not nest Stateflow charts inside Simulink functions included in 
% Stateflow charts.
%
% PASS/FAIL CRITERIA:
% ===================
% Each stateflow 'simulink function' block which contains a chart receives 
% a fail. 
%
% SOLUTION:
% =========
% Change your model in order to avoid charts nested in simulink functions
% in stateflow charts. 
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
% The simulink function block was published in release R2010b
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:46CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0039(system, cmd_s)









































