%% Use of Merge Blocks: Signals/Buses entering Merge Block
%
% [result,cr_items,r_stats] = mes_na_0032_b(system, cmd_s)
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
% Guideline Rule ID: na_0032 (7.1.14.)
%
% DESCRIPTION:
% ============
% When using merge blocks:
% Signals and buses entering a merge block must not branch off to any other 
% block 
%
% PASS/FAIL CRITERIA:
% ===================
% Each signal/bus that enters a merge block and branch off to any other
% block receives a fail.
%
% SOLUTION:
% =========
% Change the corresponding part of your model. Signals/buses that enters a
% merge block are not allowed to branch off to another block. 
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
% Use mes_na_0032_a to check idential busses. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:44CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0032_b(system, cmd_s)












































