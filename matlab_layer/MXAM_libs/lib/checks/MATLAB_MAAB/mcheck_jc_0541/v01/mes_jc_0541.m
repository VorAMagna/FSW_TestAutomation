%% Use of tunable parameters in Stateflow
%
% [result,cr_items,r_stats] = mes_jc_0541(system, cmd_s)
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
% Guideline Rule ID: jc_0541 (8.2.8.)
%
% DESCRIPTION:
% ============
% Create tunable parameters in Stateflow charts in one of the following 
% ways:
% 1.) Define the parameters in the Stateflow chart and corresponding 
%     parameters in the base workspace
% 2.) Include the tunable parameters as an input into the Stateflow chart. 
%     The parameters must be defined in the base workspace.
%
% PASS/FAIL CRITERIA:
% ===================
% Each Stateflow data that has scope equal to 'Parameter' receives a fail, 
% if the value is not assigned in the base workspace.
%
% SOLUTION:
% =========
% Use the desribed methods to create parameters in Stateflow. Define the
% parameters in the base workspace. 
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
% - As it is not possible to differentiate between tuneable parameters and
%   'normal' data as inputs of a chart, inputs are not checked.  
%   This part has to be done manually. 
% - Use the Model Explorer to rework the parameters. 

function [result, cr_items, r_stats] = mes_jc_0541(system, cmd_s)



















































