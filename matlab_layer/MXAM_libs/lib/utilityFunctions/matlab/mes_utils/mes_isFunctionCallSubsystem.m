% function b_isFncCall = mes_isFunctionCallSubsystem(h_block)
%
% Check if the given block handle references to a Function Call Subsystem.
%
% DESCRIPTION:
% ============
% The function returns 'true' when given block handle is a Subsystem which
% contains a TriggerPort block with TriggerType set to 'function-call', and
% 'false' otherwise.
%
% INPUT:
% ======
% h_block -- handle of the block to be tested.
%
% OUTPUT:
% =======
% b_isFncCall -- If h_block is a Function Call Subsystem 1,
% otherwise 0.
%
%***************************************************************
% Copyright:  Model Engineering Solutions
%***************************************************************

function b_isFncCall = mes_isFunctionCallSubsystem(h_block)

















































