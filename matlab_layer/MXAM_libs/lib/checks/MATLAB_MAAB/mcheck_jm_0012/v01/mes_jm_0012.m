%% Event broadcasts
%
% [result,cr_items,r_stats] = mes_jm_0012(system, cmd_s)
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
% Guideline Rule ID: jm_0012 (8.6.1.)
%
% DESCRIPTION:
% ============
% The following rules apply to event broadcasts in Stateflow:
% - Directed event broadcasts are the only type of event broadcasts allowed.
% - The send syntax or qualified event names are used to direct the event 
%   to a particular state.
% - Multiple send statements should be used to direct an event to more than 
%   one state.
%
% PASS/FAIL CRITERIA:
% ===================
% If in a chart only directed event broadcasts are used, a pass will be
% given.
%
% SOLUTION:
% =========
% If using events, only use directed event broadcast.
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
% Be careful when broadcast events!
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:37CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jm_0012(system, cmd_s)







































