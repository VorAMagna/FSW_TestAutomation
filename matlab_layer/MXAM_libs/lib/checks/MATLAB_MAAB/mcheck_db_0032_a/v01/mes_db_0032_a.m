%% Simulink signal appearance, Part 1: Diagonal signal lines
%
% [result,cr_items,r_stats] = mes_db_0032_a(system, cmd_s)
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
% Guideline Rule ID: db_0032 (7.1.11.)
%
% DESCRIPTION:
% ============
% Signals lines are drawn with right angles
%
% PASS/FAIL CRITERIA:
% ===================
% A signal line receives a fail if it is drawn diagonal
%
% SOLUTION:
% =========
% Change the layout of your model.
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
% - This check is one of four checks, that all together cover guideline
%   db_0032.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:14CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0032_a(system, cmd_s)















































