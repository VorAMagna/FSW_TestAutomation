% function b_isSLFncBlock = mes_isSLFunctionSubsystem(h_block)
%
% Check if the given block handle references to a Simulink Function
% Subsystem.
%
% DESCRIPTION:
% ============
%
% This function returns 'true' when given block handle is a Simulink
% Function Subsystem, and 'false' otherwise.
%
% INPUT:
% ======
% h_block -- handle of the block to be tested.
%
% OUTPUT:
% =======
% b_isSLFncBlock -- If h_block is a Simulink Function Subsystem 1,
% otherwise 0.
%
% TECHNICAL NOTE:
% ==============
% This type of Subsystem block does not exist in Matlab versions prior to
% R2014b.
%
%***************************************************************
% Copyright:  Model Engineering Solutions
%***************************************************************

function b_isSLFncBlock = mes_isSLFunctionSubsystem(h_block)












































