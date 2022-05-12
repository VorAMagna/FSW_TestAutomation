%% Stateflow/Simulink interface signals and parameters
%
% [result,cr_items,r_stats] = mes_db_0122(system, cmd_s)
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
% Guideline Rule ID: db_0122 (8.2.4.)
%
% DESCRIPTION:
% ============
% All Charts should use strong data typing with Simulink (The option 'Use Strong
% Data Typing with Simulink I/O' must be selected).
%
% PASS/FAIL CRITERIA:
% ===================
% A pass is given to every Stateflow Chart whose'StrongDataTypingWithSimulink' 
% property is set to 'true'.
%
% SOLUTION:
% =========
% To enable/disable bitwise operations:
% 1. Select File > Chart Properties
% 2. Select 'Use Strong Data Typing with Simulink I/O'
% or
% use the Stateflow API to set the 'StrongDataTypingWithSimulink' property
% to 'true'
%
% FIX OPERATION:
% ==============
% The chart-property 'Use Strong Data Typing With Simjulink I/O' property 
% be selected.
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% The description in the part 'SOLUTION' refers to Matlab R2009b. In the
% case of different Matlab Version it could be different. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:18CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0122(system, cmd_s)

















































