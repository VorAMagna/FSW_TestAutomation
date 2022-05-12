%% Stateflow: Chart Option 'Strong Data Typing with Simulink I/O'
%
% [result,cr_items,r_stats]=mes_sdt_sc002_a(system,cmd_s)
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
% MES Functional Safety Guidelines
% Release 1.7 (21 June 2013)
% Corresponding Guideline: 2.1
%
% DESCRIPTION:
% ============
% The Stateflow Chart option 'Use Strong Data Typing with Simulink I/O'
% (StrongDataTypingWithSimulink) must be set to true.
%
% PASS/FAIL CRITERIA:
% ===================
% Each chart, that has the option 'Use Strong Data Typink with Simulink
% I/O' disabled (set to false), receives a fail.
%
% SOLUTION:
% =========
% Enable 'Use Strong Data Typink with Simulink I/O' option either by
% activating the corresponding option in the GUI or by using the API with
% parameter 'StrongDataTypingWithSimulink'.
%
% FIX OPERATION:
% ==============
% Parameter 'StrongDataTypingWithSimulink' will be set to 'true'
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% Since R2010b, option 'Use Strong Data Typink with Simulink I/O' is no
% longer selectable by using the GUI. Its set by default to 'true'.
% Nevertheless, it is possible to change its value by using the API.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:06CEST $
% Revision:     $Rev: 7017 $
% *************************************************************************

function [result,cr_items,r_stats]=mes_sdt_sc002_a(system, cmd_s)

























































































































