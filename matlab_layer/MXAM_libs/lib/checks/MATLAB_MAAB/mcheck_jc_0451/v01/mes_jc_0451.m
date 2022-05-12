%% Use of unary minus on unsigned integers in Stateflow
%
% [result,cr_items,r_stats] = mes_jc_0451(system, cmd_s)
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
% Guideline Rule ID: jc_0451 (8.6.1.)
%
% DESCRIPTION:
% ============
% Do not perform unary minus on unsigned integers of stateflow chart.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyses every variable with unsigned integer or inherited datatype used in Stateflow charts.
%   Failed: If a unary minus is performed on an unsigned integer variable. 
%   Review: If a unary minus is performed on a variable with inherited
%   datatype.
%
%   The check result is passed when all failed or review cases do not apply.
%
% SOLUTION:
% =========
% Do not use uint if t is possible to work with int. Do not apply unitary
% minus. 
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
% uint32, uint16 and uint8 are considered as unsigned integers.
% The check does not analyse the variable settings in the Targetlink Property Manager. 
% To avoid the usage of unary minus on unsigned integer variables in Targetlink
% models make sure to synchronise the data types.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:31CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jc_0451(system, cmd_s)





































































































































































































