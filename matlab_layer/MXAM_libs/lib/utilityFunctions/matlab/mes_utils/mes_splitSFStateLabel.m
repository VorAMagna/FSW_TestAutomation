% function res = mes_splitsfstatelabel(hstate)
% splits the stateflow state labelstring of state hstate into its components
%
% the returned variable res is a structure with the following fields:
% res.s_name : name of state hstate
% res.s_labelstring: complete labelstring of this state without the comments
% res.s_entryactions: string with actions called on entry
% res.s_duringactions: string with actions called during state
% res.s_exitactions: string with actions called on exit
% res.cs_entryactions: cell array of strings with actions called on entry
% res.cs_duringactions: cell array of strings with actions called during state
% res.cs_exit_actions: cell array of strings with actions called on exit
% res.cr_on_events: cell array of structs with "on <event>:" parts
%                     fields: 
%                       s_event: string with name of triggering event
%                       s_actions: string with actions called on event
%                       cs_actions: cell array of strings with actions called on event
% res.s_bind: string with event and data names bound to the current state
% res.cs_bind: cell array with strings of event and data names bound to the current state
% res.s_err: error string in case of a parse error
%            or empty if no error was detected
%            note: syntax of parts is not checked
%
% Syntax of state labelstring:
% <name>[/|\n|/\n]
% [[en[try]:]<entry actions>]
% [du[ring]:<during actions>]
% [ex[it]:<exit actions>]
% [bind:<events>, <data>]
% [on <event_name>: actions]*
%
% name: (<ansi>)^[_(<ansi>)^]*
% entry actions,during actions,exit actions: <actions>
% actions:
%   strings with commands or events, delimited by comma, semicolon, or \n (line feed)
%   for a list of allowed actions: refer to the MATLAB help
% <events> list of names of events known to this state
%          delimiters: comma (semicolon or \n?)
% <event_name> name of a known event
% <data>: list of names of data known to this state
%
% **********************************************************
% Copyright: Model Engineering Solutions
% Revision: $Rev: 4617 $
% Date: $Date: 2020/07/31 16:10:28CEST $
% **********************************************************

function res = mes_splitSFStateLabel(hstate)











































































































































































































































































































































































































