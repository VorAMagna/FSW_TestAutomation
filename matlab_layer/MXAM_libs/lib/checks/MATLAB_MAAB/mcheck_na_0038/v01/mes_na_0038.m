%% Levels in Stateflow charts
%
% [result,cr_items,r_stats] = mes_na_0038(system, cmd_s)
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
% Guideline Rule ID: na_0038 (8.6.1.)
%
% DESCRIPTION:
% ============
% The number of nested States should be limited, typically 3 per level. If
% additional levels are required, use sub-charts.
%
% PASS/FAIL CRITERIA:
% ===================
% A Stateflow State receives a fail, if there are too many states nested
% within this state. 'Too many' is equal to user defined parameter
% MAAB.na_0038.NumberOfNestedStates minus 1.
%
% SOLUTION:
% =========
% Use sub-charts
%
% FIX OPERATION:
% ==============
% No automatic fix available
%
% CHECK PARAMETERS:
% =================
% MAAB.na_0038.NumberOfNestedStates:
%   DATATYPE: 
%       integer
%   DEFAULT VALUE:
%       3
%   DESCRIPTION:
%       Each chart level could only contain NumberOfNestedStates nested 
%       states.
%
% NOTE:
% =====
% This check compares paths of states. Be aware that stateflow does not
% prevent non-unique state names. If two or more states are named equally
% in one chart, the results of this check might be wrong.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:45CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0038(system, cmd_s)












































