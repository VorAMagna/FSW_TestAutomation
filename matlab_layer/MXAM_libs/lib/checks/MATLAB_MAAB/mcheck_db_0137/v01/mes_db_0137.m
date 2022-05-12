%% States in state machines
%
% [result,cr_items,r_stats] = mes_db_0137(system, cmd_s)
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
% Guideline Rule ID: db_0137 (8.6.1.)
%
% DESCRIPTION:
% ============
% For all levels in a state machine, including the root level, for states
% with exclusive decomposition, the following rules apply:
% - At least two exclusive states must exist.
% - A state cannot have only one substate.
% - The initial state of every hierarchical level with exclusive states is
%   clearly defined by a default transition. In the case of multiple default
%   transitions, there must always be an unconditional default transition.
%
% PASS/FAIL CRITERIA:
% ===================
% A Stateflow chart receives a pass if in every level zero or more than one 
% state with exclusive decomposition exist and at least one unconditional 
% transition is connected (direct ior indirect) with a state. 
%
% SOLUTION:
% =========
% Reconsider the architecure of the failed Stateflow chart. 
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
% States with property 'decomposition' not set to 'Exclusive_OR' are not
% considered. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:22CEST $
% Revision:     $Rev: 6824 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0137(system, cmd_s)















































