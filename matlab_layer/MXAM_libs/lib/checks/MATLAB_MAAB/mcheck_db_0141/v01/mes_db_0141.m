%% Signal flow in Simulink models
%
% [result,cr_items,r_stats] = mes_db_0141(system, cmd_s)
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
% Guideline Rule ID: db_0141 (7.1.12.)
%
% DESCRIPTION:
% ============
% Signal  flow in a model is from left to right
% -> Exception: Feedback Loops. 
% Sequential blocks or subsystem are arranged from left to right
% -> Exception: Feedback Loops. 
%
% PASS/FAIL CRITERIA:
% ===================
% Fail will be given if:
% 1. a block is not in a feedback loop and its orientation is not 'right',
% 2. the orientation of a block is 'right', but the block that connects
%    with the outport is not located at the right side of this block.
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
% Corresponding guideline demands, that parallel blocks or subsystems are
% arranged from top to bottom. This part is NOT checked. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:23CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0141(system, cmd_s)











































