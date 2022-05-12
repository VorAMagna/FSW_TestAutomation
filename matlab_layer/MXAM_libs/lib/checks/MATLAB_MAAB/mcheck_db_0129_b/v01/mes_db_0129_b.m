%% Stateflow transition appearance: Crossings
%
% [result,cr_items,r_stats] = mes_db_0129_b(system, cmd_s)
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
% Guideline Rule ID: db_0129 (8.1.2.)
%
% DESCRIPTION:
% ============
% Transitions in Stateflow do not cross each other, if possible and do not 
% cross any Stateflow object.
%
% PASS/FAIL CRITERIA:
% ===================
% A transitions receives a pass, if it does not cross obejcts listed in
% parameter MAAB.db_0129_b.ConsideredSFObjects
%
% SOLUTION:
% =========
% Redraw the transitions in failed charts such that they do not cross any
% stateflow object. 
%
% FIX OPERATION:
% ==============
% No automatic fix available.
%
% CHECK PARAMETERS:
% =================
% MAAB.db_0129_b.ConsideredSFObjects:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'State';
%        'Junction';
%        'Note'}
%   DESCRIPTION:
%       Each entry in this cell array represents a stateflow object. Listet 
%       objects are considered and checked if a transitions crossed them. 
%
% NOTE:
% =====
% Since there are only 3 Points for transitions, only linear transitions are 
% treated (for each other type, a correct analyse could not be guaranteed). 
% User is informed, if nonlinear transitions are used. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:21CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0129_b(system, cmd_s)











































