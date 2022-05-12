% MES check: misra_slsf_053_a - Stateflow transition appearance, part A
%
% function [result, cr_items] = mes_misra_slsf_053_a(system, cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistics on the check result
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>,
%
% MES CHECK:
% ==========
% misra_slsf_053_a - Stateflow transition appearance, part A
% A. In all state-charts, flow-charts and graphical functions, transitions 
%    must not be drawn one upon the other.
%
% PASS CRITERIA:
% ================
% The check analyzes each transition in Stateflow charts.
% 
%     Failed 1: The transition is drawn upon another transition.
%     Failed 2: If the check parameter is greater than zero, a fail is given if the distance between two parallel transitions is smaller than this value.
%     Review 3: The transition is curved.
% 
% The check result is passed if all failed and review cases do not apply.
%
% SOLUTION:
% =========
% Move 'stapled' transitions graphically to guarantee no transition is drawn 
% one upon the other in all statecharts, flow-charts and graphical functions.
% 
% NOTE
% ====
% Since there are only 3 Points for transitions, only linear transitions are 
% treated (for each other type, a correct analyse could not be guaranteed). 
% User is informed, if nonlinear transitions are used. 
%
% CHECK PARAMETERS:
% =================
% MISRA_SL_SF.misra_slsf_053_a.MinDistanceBetweenTwoParallelLines:
%   DATATYPE: 
%       integer
%   DEFAULT VALUE:
%       0 (unit: pixel)
%   DESCRIPTION:
%       Represents the minimal distance between to parallel lines. If 
%       distance is smaller, both lines are treated as overlapping (for 
%       reasonable start- and endpoint).
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:44CEST $
% Version:      $Rev: 6836 $
% ***********************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_053_a(system, cmd_s)








































































































































































