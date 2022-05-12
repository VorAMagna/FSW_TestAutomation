%% Number of states per container
%
% [result,cr_items,r_stats] = mes_na_0040(system, cmd_s)
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
% Guideline Rule ID: na_0040 (8.6.3.)
%
% DESCRIPTION:
% ============
% The number of viewable States per container should be limited, typically
% to 6 to 10 states per container. The number is based on the visible 
% states in the diagram.
%
% PASS/FAIL CRITERIA:
% ===================
% A Stateflow Container receives a fail, if there are too many viewable 
% states are within this state. 'Too many' is equal to user defined 
% parameter MAAB.na_0040.NumberOfStatesPerContainer.
%
% SOLUTION:
% =========
% Use more containers or reduce the number of viewable states per
% container.
%
% FIX OPERATION:
% ==============
% No automatic fix available
%
% CHECK PARAMETERS:
% =================
% MAAB.na_0040.NumberOfStatesPerContainer:
%   DATATYPE: 
%       integer
%   DEFAULT VALUE:
%       6
%   DESCRIPTION:
%       Each container must contain only NumberOfStatesPerContainer states.
%
% NOTE:
% =====
% A 'container' is either a State, a Box, a Function or root level chart. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:46CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0040(system, cmd_s)














































