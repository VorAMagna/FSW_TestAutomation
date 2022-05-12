% MES check: misra_slsf_053_c - Stateflow transition appearance, part C
%
% function [result, cr_items] = mes_misra_slsf_053_c(system, cmd_s)
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
% misra_slsf_053_c - Transition positioning - Crossing Text Fields
% In all state-charts, flow-charts and graphical functions, transitions must
% not cross text-fields.
%
% PASS CRITERIA:
% ================
% The check analyzes each transition in Stateflow charts.
%
%     Failed 1: The transition crosses a text-field in a state-chart, flow-chart or graphical function.
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
% The check follows these definitions considering the linearity of transitions:
%     Curved transition: The transition is neither horizontal nor vertical nor diagonal.
%     Horizontal: A transition is horizontal if the x-coordinates of the three given points (SourceEndpoint, MidPoint and DestinationEndpoint) are equal to each other.
%     Vertical: A transition is vertical, if the y-coordinates of the three given points (SourceEndpoint, MidPoint and DestinationEndpoint) are equal to each other.
%     Diagonal: A transition is diagonal, if the slopes of both segments (SourceEndpoint <-> MidPoint and MidPoint <-> DestinationEndPoint are equal to each other.
%
% PARAMETER:
% ==========
% MISRA_SL_SF.ReportNonlinearTransitionsIndividually
%   DATATYPE:
%       string
%   DEFAULT VALUE:
%       'no'
%   DESCRIPTION:
%       Can be activated ('yes') to receive a warning for each nonlinear transition.
%       This makes it easier to review the single transitions.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:45CEST $
% Version:      $Rev: 15192 $
% ***********************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_053_c(system, cmd_s)






















































































































































































