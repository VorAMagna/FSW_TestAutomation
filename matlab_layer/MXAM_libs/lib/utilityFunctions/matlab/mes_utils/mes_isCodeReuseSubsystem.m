% function b_isCodeReuseSubsystem = mes_isCodeReuseSubsystem(h_block)
%
% Check if the given block handle references to a Code Reuse Subsystem,
% i.e., a Subsystem with parameter 'RTWSystemCode' = 'Reusable function'.
%
% DESCRIPTION:
% ============
% This function returns 'true' when given block handle is a Subsystem with
% Function Packaging option set to 'Reusable function', and 'false'
% otherwise.
%
% INPUT:
% ======
% h_block -- handle of the block to be tested.
%
% OUTPUT:
% =======
% b_isCodeReuseSubsystem -- If h_block is a Code Reuse Subsystem block 1,
% otherwise 0.
%
% TECHNICAL NOTE:
% ===============
% When the block has the parameter 'RTWSystemCode' = 'auto', Matlab decides
% the appropriated Function packaging to use, which might be 'Reusable
% function'. This util does not contemplate this case.
%
%***************************************************************
% Copyright:  Model Engineering Solutions
%***************************************************************

function b_isCodeReuseSubsystem = mes_isCodeReuseSubsystem(h_block)






























