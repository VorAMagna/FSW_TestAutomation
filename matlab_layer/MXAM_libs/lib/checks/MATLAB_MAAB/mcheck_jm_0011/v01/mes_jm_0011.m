%% Pointers in Stateflow
%
% [result,cr_items,r_stats] = mes_jm_0011(system, cmd_s)
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
% Guideline Rule ID: jm_0011 (8.6.1.)
%
% DESCRIPTION:
% ============
% In a Stateflow diagram, pointers to custom code variables are not allowed.
%
% PASS/FAIL CRITERIA:
% ===================
% If in a chart no pointer and address operations are used to custom code
% variables,  a pass will be given.
%
% SOLUTION:
% =========
% Avoid using pointers. 
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
% If a variable has pointer operator (& * ->), and this variable is not a
% variable defined in chart, an error will be reported, if this varialbe is
% really a variable of custom code is not checked.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:36CEST $
% Revision:     $Rev: 14938 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jm_0011(system, cmd_s)





































