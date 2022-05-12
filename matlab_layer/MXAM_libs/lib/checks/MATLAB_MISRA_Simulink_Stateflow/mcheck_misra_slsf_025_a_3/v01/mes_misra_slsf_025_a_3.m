%% Simulink Ports: Option IconDisplay
%
% [result,cr_items,r_stats] = mes_misra_slsf_025_a_3(system, cmd_s)
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
% MISRA AC SLSF - Modeling design and style guidelines for the application
% of Simulink and Stateflow
% Version 1.0 
% The Motor Industry Software Reliability Association
% Guideline Rule ID: MISRA AC SLSF 025 A (3.4.7)
%
% DESCRIPTION:
% ============
% The 'icon display' for all inport and outport blocks must be set to 'port 
% number'.
%
% PASS/FAIL CRITERIA:
% ===================
% A Fail is given if Inport and Outport blocks have the 'icon display' 
% property not set to 'port number'.
%
% SOLUTION:
% =========
% Set IconDisplay of In- and Outports to 'Port number'.
%
% FIX OPERATION:
% ==============
% Fix will set the option 'IconDisplay' to Port number'
%
% CHECK PARAMETERS:
% =================
% No parameters are used. 
%
% NOTE:
% =====
% Other parts of MISRA AC SLSF 025 A are checked by misra_slsf_025_a_[i]. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:15CEST $
% Revision:     $Rev: 6179 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_025_a_3(system, cmd_s)












































