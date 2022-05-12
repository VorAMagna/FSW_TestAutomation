%% 	Simulink Signal Appearance - Line Branches
%
% [result,cr_items,r_stats] = mes_db_0032_d(system, cmd_s)
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
% Guideline Rule ID: db_0032 (7.1.11.)
%
% DESCRIPTION:
% ============
% Signals lines should not split into more than two sublines at a single 
% branching point
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes the branching points of each signal line.
% 
%     Failed 1: The signal line branches into more than two signal lines at
%     least at one branching point.
% 
% The check result is passed if the failed case does not apply.
%
% SOLUTION:
% =========
% Change the layout of your model and ensure that a signal line is split
% into at most two signal lines per branching point.
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
% Date:         $Date: 2020/07/31 16:03:15CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0032_d(system, cmd_s)

















































