%Check if the given block handle references to a Model Variant block from
%Simulink User-Defined Function Library.
%
%DESCRIPTION:
%================
%Model blocks cannot be detected by their blocktype or masktype,
%instead other conditions were tested. Function returns 1 when given block
%handle is a Model Variant block, otherwise 0.
%
%INPUT:
%======
%h_block--handle of the block to be tested
%
%OUTPUT:
%=======
%b_IsBlockOfTypeModelVariants-- If h_block is a Model Variant Block 1,
%otherwise 0.
%
%
%***************************************************************
% Copyright:  Model Engineering Solutions
% Date: 2017-04-21
%***************************************************************

function b_IsBlockOfTypeModelVariants=mes_IsBlockOfTypeModelVariants(h_block)


























