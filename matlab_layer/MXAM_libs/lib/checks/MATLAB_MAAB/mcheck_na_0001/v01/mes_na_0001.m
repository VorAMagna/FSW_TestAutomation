%% Bitwise Stateflow operators
%
% [result,cr_items,r_stats] = mes_na_0001(system, cmd_s)
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
% Guideline Rule ID: na_0001 (8.2.1.)
%
% DESCRIPTION:
% ============
% The bitwise Stateflow operators (&, |, and ^) should not be used in
% Stateflow charts unless you want bitwise operations.
%
% PASS/FAIL CRITERIA:
% ===================
% A pass is given to each stateflow chart, if 'Enable C Bit Operations' is
% selected.
%
% SOLUTION:
% =========
% To enable/disable bitwise operations:
% 1. Select File > Chart Properties
% 2. Select “Enable C-bit Operations”.
% or
% use the Stateflow API to set the 'EnableBitOps' property to 'true'.
%
% FIX OPERATION:
% ==============
% The property 'Enable C Bit Operations' property of charts will be selected.
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% Steps in SOLUTION are base on Matlab version R2011b. They might be
% different in other versions.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:37CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0001(system, cmd_s)













































