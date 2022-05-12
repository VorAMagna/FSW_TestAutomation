%% Icon display for Port block
%
% [result,cr_items,r_stats] = mes_jc_0081(system, cmd_s)
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
% Guideline Rule ID: jc_0081 (7.1.5.)
%
% DESCRIPTION:
% ============
% The 'Icon display' setting should be set to 'Port number' for Inport and
% Outport blocks.
%
% PASS/FAIL CRITERIA:
% ===================
% Each Port block whose option 'Icon Display' is set to 'Port number'
%
% SOLUTION:
% =========
% Use the parameter 'IconDisplay' and set it to 'Port number'. 
%
% FIX OPERATION:
% ==============
% The option 'Port Number' for the Port block will be selected.
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% Use the GUI or the Simulink API to change parameter 'Port Number'.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:27CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jc_0081(system, cmd_s)


















































