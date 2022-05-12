% MES check: misra_slsf_053_b - Stateflow transition appearance, part B
%
% function [result, cr_items] = mes_misra_slsf_053_b(system, cmd_s)
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
% misra_slsf_053_b - Stateflow transition appearance, part B
% In all state-charts, flow-charts and graphical functions, transitions must 
% not cross any states or junctions.
%
% PASS CRITERIA:
% ================
% 	The check analyzes each transition in Stateflow charts.
% 
%     Failed 1: The transition crosses any states or junctions in a state-chart, flow-chart or graphical function.
%     Review 2: The transition is curved.
% 
% The check result is passed if all failed and review cases do not apply.
%
% SOLUTION:
% =========
% Reroute the transitions graphically.
% 
% NOTE
% ====
% Since there are only 3 Points for transitions, only linear transitions are 
% treated (for each other type, a correct analyse could not be guaranteed). 
% User is informed, if nonlinear transitions are used. 
%
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:44CEST $
% Version:      $Rev: 7108 $
% ***********************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_053_b(system, cmd_s)



















































































































































































































