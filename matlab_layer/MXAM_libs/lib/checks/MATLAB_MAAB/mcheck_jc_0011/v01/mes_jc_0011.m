%% Optimization parameters for Boolean data types
%
% [result,cr_items,r_stats] = mes_jc_0011(system, cmd_s)
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
% Guideline Rule ID: jc_0011 (6.1.1.)
%
% DESCRIPTION:
% ============
% The optimization option for Boolean data types must be enabled (on).
% The parameter could be found in
% 'Configuration Parameters -> Optimization -> Simulation and code
% generation -> Implement logic signals as Boolean date (vs. double)'.
% The Matlab Parametername is 'BooleanDataType'.
%
% PASS/FAIL CRITERIA:
% ===================
% Check returns a pass, if the parameter 'Implement logic signals as
% Boolean date (vs. double)' is set to 'on'
%
% SOLUTION:
% =========
% Set the parameter 'Implement logic signals as Boolean date (vs. double)'
% to 'on'
%
% FIX OPERATION:
% ==============
% Fix set the parameter 'Implement logic signals as Boolean date (vs.
% double)' to 'on'
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% Paths given in error messages corresponds to paths in Matlab 2012b
% (Simulink Version ). They might differ in other versions.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:25CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jc_0011(system, cmd_s)









































