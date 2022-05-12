%% Use of If-Then-Else Action Subsystem to Replace Multiple Switches
%
% [result,cr_items,r_stats] = mes_na_0028(system, cmd_s)
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
% Guideline Rule ID: na_0028 (7.5.4.)
%
% DESCRIPTION:
% ============
% The use of switch constructs should be limited, typically to 3 levels.
% Replace switch constructs that have more than 3 levels with an If-Then-Else 
% action subsystem construct.
%
% PASS/FAIL CRITERIA:
% ===================
% If more than a user defined number levels of nested Switches are used, 
% first level Switch block of this construction receives a fail.
%
% SOLUTION:
% =========
% Use If-Then-Else action subsystems to replace nested Switches
%
% FIX OPERATION:
% ==============
% No automatic fix available.
%
% CHECK PARAMETERS:
% =================
% MAAB.na_0028.MaxNumberOfSwitchLevels:
%   DATATYPE: 
%       integer
%   DEFAULT VALUE:
%       3
%   DESCRIPTION:
%       Maximal number of nested levels of Switch blocks
%
% NOTE:
% =====
% 'Nested' is interpreted as a direct composition of Switch blocks. This 
% composition might bridgeover borders of subsystems.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:43CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0028(system, cmd_s)














































