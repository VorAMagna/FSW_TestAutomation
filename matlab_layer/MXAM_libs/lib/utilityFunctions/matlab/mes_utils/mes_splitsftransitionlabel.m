% splits the stateflow transition label string s_label into its components
%
% SYNTAX:
% r_res = mes_splitsftransitionlabel(s_label,b_remove_comments,hChart)
% s_error = mes_splitsftransitionlabel(s_label,b_remove_comments,hChart)
%
% ARGUMENTS:
%  s_label: (string, no default): transition label string
%  b_remove_comments (boolean, no default): if true, comments
%    in the label string will be removed before decomposition.
%  hChart: handle of the chart, from which the s_label comes. (used to
%          identify defined events and variables and to make sure that the
%          found event/variable name is correct, 
%          e.g: a[1], if a is an event, then condition is [1], otherwise,
%                     a[1] is a variable member access.
%          Note: if hChart is not a valid handle, then the transition parsing 
%                may return a run time error when encounterin possible events
%                that can't be disambiguated without knowing the defined
%                variables and events.
%
% RETURN VALUE:
% either a structure with 6 fields with the parts of the transition (see below)
% or an error string, if the string is not a valid transition label; 
% exception: if the label string is empty then it returns an empty non-char array
%
% r_res = struct('event','','s_condition','',...
%            's_condition_action','','cr_condition_actions',cell(0),...
%            's_transition_action','','cr_transition_actions',cell(0));
% event: string of event 
% s_condition: String of condition
% s_condition_action: string with all condition actions (without brackets)
% cr_condition_actions: cell containing each condition action as string
% s_transition_action: string with all transition actions (without /)
% cr_transition_actions: cell containing each transition action as string
% 
% SYNTAX OF TRANSITION LABEL:
% <event>[condition]{condition_action}/transition_action
% note: ensure that any comments are removed, e.g. by first calling
%       mes_removecomments, when not using the option b_remove_comments
%
% EXAMPLE:
% =======
% res = mes_splitsftransitionlabel(h_transitions.LabelString,true,h_charts);
% 
% res =
% event: []
% s_condition: 'cond == 2'
% s_condition_action: 'action =2'
% s_transition_action: []
% cr_condition_actions: {'action =2'}
% cr_transition_actions: {}
% See also: mes_splitSFStateLabel
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright: Model Engineering Solutions
% Revision: $Rev: 15479 $
% Date: $Date: 2020/07/31 16:10:28CEST $
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function res = mes_splitsftransitionlabel(s_label,b_remove_comments,hChart)















































































































































































































































































































































