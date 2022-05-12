%% Scope of internal signals and local auxiliary variables
%
% [result,cr_items,r_stats] = mes_db_0125(system, cmd_s)
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
% Guideline Rule ID: db_0125 (8.2.5.)
%
% DESCRIPTION:
% ============
% Internal signals and local auxiliary variables are "Local data" in 
% Stateflow:
% - All local data of a Stateflow block must be defined on the chart level 
%   or below the Object Hierarchy.
% - No local variables exist on the machine level (that is, there is no 
%   interaction between local data in different charts).
% - Parameters and constants are allowed at the machine level.
%
% PASS/FAIL CRITERIA:
% ===================
% A pass is given for a model if there is no data with Scope 'Local' defined 
% on machine level.
%
% SOLUTION:
% =========
% Use data with scope 'local' only on chart level or beneath. Do not use
% the same local data for several charts. Redefine your data and 'move'
% them to the considered chart. This could be easily done by using the
% Model Explorer.
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
% Machine level is interpreted as the Stateflow Root. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:19CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0125(system, cmd_s)











































