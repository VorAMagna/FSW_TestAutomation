%% Port blocks in Simulink models: Duplicate Inports
%
% [result,cr_items,r_stats] = mes_db_0042_b(system, cmd_s)
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
% Guideline Rule ID: db_0042 (7.1.3.)
%
% DESCRIPTION:
% ============
% In a Simulink model, Duplicate Inports can be used at the subsystem level if required, but should be avoided, if possible.
% Do not use duplicate Inports at the root level.
%
% PASS/FAIL CRITERIA:
% ===================
% Duplicate inports on subsystem level receive a review but on root level a fail. The check receives a passed if the review and fail cases do not apply. 
%
% SOLUTION:
% =========
% Avoid duplicate inports in subsystem level and do not use them in root level.
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
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:16CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0042_b(system, cmd_s)


























































































































