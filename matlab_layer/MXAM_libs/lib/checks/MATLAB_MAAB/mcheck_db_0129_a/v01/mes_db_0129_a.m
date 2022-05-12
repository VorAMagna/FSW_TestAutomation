%% Stateflow transition appearance: Overlapping
%
% [result,cr_items,r_stats] = mes_db_0129_a(system, cmd_s)
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
% Transitions in Stateflow are not drawn one upon the other or upon the
% frames of other states. 
%
% PASS/FAIL CRITERIA:
% ===================
% A transitions receives a pass, if it does not overlap
% - another transition
% - any Stateflow Object
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
% MAAB.db_0129_a.MinDistanceBetweenTwoParallelLines:
%   DATATYPE: 
%       integer
%   DEFAULT VALUE:
%       0 (Unit is pixel)
%   DESCRIPTION:
%       Represents the minimal distance between to parallel lines. If  
%       distance is smaller, both lines are treated as overlapping (for 
%       reasonable start- and endpoint).
% 
% MAAB.db_0129_a.ConsideredSFObjects:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'State'}
%   DESCRIPTION:
%       Each entry in this cell array represents a stateflow object. Listet 
%       objects are considered and checked if a transitions crossed them.  
%
% NOTE:
% =====
% Since there are only 3 Points for transitions, only non-curved transitions 
% are treated (for each other type, a correct analyse could not be guaranteed). 
% A warning is returned, which lists all curved transitions.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:20CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0129_a(system, cmd_s)













































