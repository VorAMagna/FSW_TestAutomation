% function b_isBlockSubsystem = mes_IsBlockSubsystem(h_block)
%
% Check if the given block handle references to an ordinary Subsystem,
% i.e., a Subsystem with empty masktype, that is not treated as Atomic Unit
% and is not a Variant Subsystem.
%
% DESCRIPTION:
%================
% Subsystem blocks, which are used only for organization of the model, are
% hard to be indentified.
% This function returns 'true' when given block handle is a Subsystem with
% empty masktype, not treated as Atomic Unit and is not a Variant
% Subsystem, and 'false' otherwise.
%
% INPUT:
%======
% h_block -- handle of the block to be tested
%
% OUTPUT:
%=======
% b_isBlockSubsystem -- If h_block is an ordinary Subsystem block 1,
% otherwise 0.
%
% TECHNICAL NOTE:
%======
% This function returns 'true' for block 'Configurable Subsystems'.
%
%***************************************************************
% Copyright:  Model Engineering Solutions
%***************************************************************

function b_isBlockSubsystem = mes_IsBlockSubsystem(h_block)




































