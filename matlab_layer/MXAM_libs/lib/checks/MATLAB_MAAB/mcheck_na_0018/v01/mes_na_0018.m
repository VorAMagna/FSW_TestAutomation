%% Number of nested if/else and case statement
%
% [result,cr_items,r_stats] = mes_na_0018(system, cmd_s)
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
% Guideline Rule ID: na_0018 (10.1.1.)
%
% DESCRIPTION:
% ============
% The number of levels of nested if /else and case statements should be
% limited, typically to 3 levels.
%
% PASS/FAIL CRITERIA:
% ===================
% If more than a user defined number levels of nested If and/or Switch/Case 
% blocks is used, first level If- or Switch/Case block of this 
% construction receives a fail.
%
% SOLUTION:
% =========
% Unnest If and Switch/Case constructions.
%
% FIX OPERATION:
% ==============
% No automatic fix available.
%
% CHECK PARAMETERS:
% =================
% MAAB.na_0018.MaxNumberOfIfAndSwitchLevels:
%   DATATYPE: 
%       integer
%   DEFAULT VALUE:
%       3
%   DESCRIPTION:
%       Maximal number of nested levels of If and Switch/Case blocks
%
% NOTE:
% =====
% 'Nested' is interpreted as a direct composition of If- and Switch/Case
% blocks. This composition might bridgeover borders of subsystems.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:42CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0018(system, cmd_s)














































