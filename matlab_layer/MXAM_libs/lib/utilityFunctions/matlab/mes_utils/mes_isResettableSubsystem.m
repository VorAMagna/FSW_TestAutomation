% function b_isResettableSubSys = mes_isResettableSubsystem(h_block)
%
% Check if the given block handle references to a Resettable Subsystem.
%
% DESCRIPTION:
% ============
% This function returns 'true' when given block handle is a Subsystem which
% contains a ResetPort block, and 'false' otherwise.
%
% INPUT:
% ======
% h_block -- handle of the block to be tested.
%
% OUTPUT:
% =======
% b_isResettableSubSys -- If h_block is a Resettable Subsystem 1,
% otherwise 0.
%
% TECHNICAL NOTE:
% ==============
% This type of Subsystem block does not exist in Matlab versions prior to
% R2015a.
%
%***************************************************************
% Copyright:  Model Engineering Solutions
%***************************************************************

function b_isResettableSubSys = mes_isResettableSubsystem(h_block)





































