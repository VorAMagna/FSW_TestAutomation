%% Direction of Subsystem
%
% [result,cr_items,r_stats] = mes_jc_0111(system, cmd_s)
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
% Guideline Rule ID: jc_0111 (7.5.8.)
%
% DESCRIPTION:
% ============
% Subsystem must not be reversed.
%
% PASS/FAIL CRITERIA:
% ===================
% Each subsystem, whose orientation is right will receive a pass, 
% Otherwise a fail will be returned.
%
% SOLUTION:
% =========
% Change the layout of the model and flip the subsystems. 
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
% - Fix is not available as flipped subsystems would produce a lot of
%   crossing signal lines
% - Targetlink masked subsystems are not checked.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:27CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jc_0111(system, cmd_s)




















































































