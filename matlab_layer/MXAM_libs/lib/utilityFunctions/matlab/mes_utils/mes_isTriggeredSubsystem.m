% function b_isTriggeredSubSys = mes_isTriggeredSubsystem(h_block)
%
% Check if the given block handle references to a 'Triggered Subsystem' or an
% 'Enabled and Triggered Subsystem'.
%
% DESCRIPTION:
% ============
% This function analyzes if given block handle is a Subsystem which
% contains a TriggerPort block.
% The function returns 'true' for a 'Triggered Subsystem' or an 'Enabled and
% Triggered Subsystem', and 'false' otherwise.
% For only 'Triggered Subsystem' use the condition
% mes_isEnabledSubsystem = false.
%
% INPUT:
% ======
% h_block -- handle of the block to be tested.
%
% OUTPUT:
% =======
% b_isTriggeredSubSys -- If h_block is a Triggered Subsystem or an Enabled
% and Triggered Subsystem 1, otherwise 0.
%
%***************************************************************
% Copyright:  Model Engineering Solutions
%***************************************************************

function b_isTriggeredSubSys = mes_isTriggeredSubsystem(h_block)









































