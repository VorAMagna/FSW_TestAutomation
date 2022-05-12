%test if the given outport of chart is set to be scaling invariant
% SYNTAX:
% =======
% [b_res,s_error] = mes_IsStateflowportScalingInvariant( h_chart,nr_port,s_portType )
%
% DESCRIPTION:
% ============
% A port(inport or outport) of a chart can be defined as scaling invariant,
% it can be done by TargetLink property manager. In the
% chart->properties->Documentation, then there are strings like:$TL$
% unscaledarguments=1; scalingpropagation=ScalingPropagation_fcn;
% date=20150902T164044; $TL$ . This funciton analysis this strings and
% check if the given outport is set to scaling invariant.
%
% INPUT ARGUMENTS:
% ================
% -  h_chart     (double) (no default value)
%                    Handle of the chart
% -  nr_port  (double), the port number of the chart to be checked.
% -  s_portType   port type of the to be checked port, 'inport' or
% 'outport'
%
% RETURN VALUES:
% ==============
% - b_res           true if given chart port is scaling invariant, otherwise,
%                   false
% - s_error         string of the error, possible is: no scaling
%                   propagation or syntax error in propagation
% ****************************************************************
% Copyright:  Model Engineering Solutions
% ****************************************************************

function [b_res,s_error] = mes_IsStateflowportScalingInvariant( h_chart,nr_port,s_portType )



































































































































