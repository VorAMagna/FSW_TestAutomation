% function b_isActionSubsystem = mes_isIfActionSubsystem(h_block)
%
% Check if the given block handle references to an 'If Action Subsystem' or a
% 'Switch Case Action Subsystem', i.e., a Subsystem with an 'Action Port'
% inside. There is no difference between the Action Port from 'Switch Case
% Action SubSystem' and 'If Action Subsystem'.
%
% DESCRIPTION:
% ============
% The function returns 'true' when given block handle is a Subsystem with
% an Action Port inside, and 'false' otherwise.
%
% INPUT:
% ======
% h_block -- handle of the block to be tested.
%
% OUTPUT:
% =======
% b_isActionSubsystem -- If h_block is an If Action Subsystem or a
% Switch Case Action Subsystem 1, otherwise 0.
%
%***************************************************************
% Copyright:  Model Engineering Solutions
%***************************************************************

function b_isActionSubsystem = mes_isIfActionSubsystem(h_block)


































