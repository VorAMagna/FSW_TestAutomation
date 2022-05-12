%% Setting the return value from a graphical function
%
% [result,cr_items,r_stats] = mes_jc_0511(system, cmd_s)
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
% Guideline Rule ID: jc_0511 (8.1.7.)
%
% DESCRIPTION:
% ============
% The return value from a graphical function must be set in only one place.
%
% PASS/FAIL CRITERIA:
% ===================
% For each graphical function its return values are checked. If these
% values are set more than once in transition actions (which are positioned
% within the corresponding graphical function), the graphical function
% rceives a fail. 
%
% SOLUTION:
% =========
% Remodel your graphical function and do not set a return variable twice
% (or more). Use local variables and set your return value equal to this
% local variable as a last step.
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
% - if no return value is locally defined for a graphical function, global 
%   return values are considered 
% - since R2012b it is possible, to use multiple return variables - this is
%   handled by the check
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:32CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jc_0511(system, cmd_s)








































