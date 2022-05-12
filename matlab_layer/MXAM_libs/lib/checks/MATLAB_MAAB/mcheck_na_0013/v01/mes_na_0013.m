%% Comparison Operation in Stateflow
%
% [result,cr_items,r_stats] = mes_na_0013(system, cmd_s)
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
% Guideline Rule ID: na_0013 (8.2.3.)
%
% DESCRIPTION:
% ============
% - Comparisons should be made only between variables of the same data type.
% - If comparisons are made between variables of different data types, the
%   variables need to be explicitly type cast to matching data types.
% - Do not make comparisons between unsigned integers and negative numbers.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each transition condition in a chart
% 
%     Failed 1: More than one data type is used to compute the left hand side or the right hand side of the comparison, e.g., d + k < 5, where d is int8 and k is int16.
%     Failed 2: The left hand side of the comparison has a different data type than the right hand side.
%     Failed 3: An unsigned integer (left or right hand side) is compared to a negative value (number or variable)
% 
% The check result is passed if all failed cases do not apply.
% 
% SOLUTION:
% =========
% Solution 1: Cast the variables differently. Use the Model Explorer to set the data types. Alternatively use Matlab cast operations such as int16().
% Solution 2: Cast the variables differently. Use the Model Explorer to set the data types. Alternatively use Matlab cast operations such as int16().
% Solution 3: Review the transition condition.
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
% This check might return false positives if the variables of one chart
% are not named uniquely.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:40CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0013(system, cmd_s)








































