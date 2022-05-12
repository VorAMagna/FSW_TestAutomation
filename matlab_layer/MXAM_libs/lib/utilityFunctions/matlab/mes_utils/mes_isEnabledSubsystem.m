% function b_isEnabledSubSys = mes_isEnabledSubsystem(h_block)
%
% Check if the given block handle references to an 'Enabled Subsystem' or an
% 'Enabled and Triggered Subsystem'.
%
% DESCRIPTION:
% ============
% This function analyzes if given block handle is a Subsystem which
% contains an EnablePort block. 
% The function returns 'true' for an 'Enabled Subsystem' or an 'Enabled and
% Triggered Subsystem', and 'false' otherwise.
% For only 'Enabled Subsystem' use the condition
% mes_isTriggeredSubsystem = false.
%
% INPUT:
% ======
% h_block -- handle of the block to be tested.
%
% OUTPUT:
% =======
% b_isEnabledSubSys -- If h_block is an 'Enabled Subsystem' or 'Enabled and
% Triggered Subsystem' 1, otherwise 0.
%
%***************************************************************
% Copyright:  Model Engineering Solutions
%***************************************************************

function b_isEnabledSubSys = mes_isEnabledSubsystem(h_block)


































