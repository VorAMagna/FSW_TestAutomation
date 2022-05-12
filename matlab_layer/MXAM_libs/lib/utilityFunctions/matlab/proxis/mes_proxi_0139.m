%% Stateflow Transition Labels: condition and transition actions
%
% [result, cr_items, r_stats] = mes_proxi_0139(system, cmd_s, reg, s_regerr)
%
% SHORT DESCRIPTION:
% ==================
% Stateflow transitions shall have only one action per line. For more than
% one action a line feed must be used to separate the actions.
%
% NOTE:
% =====
% Regarding a detailed documentaion of this proxi look into the
% documentation of the check, which calls this proxi.
% 
% INTERNAL PARAMETERS: to be set in the check matlab file.
% =====
% reg.proxiparams.conditionActions : boolean. If set true, analyzes every
% condition action
% 
% reg.proxiparams.transitionActions: boolean. If set true, analyzes every
% transition action
% 
% The default for both parameters is true.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:47CEST $
% Revision:     $Rev: $
% *************************************************************************

function [result,cr_items,r_stats]=mes_proxi_0139(system, cmd_s,reg,s_regerr)






























































































































