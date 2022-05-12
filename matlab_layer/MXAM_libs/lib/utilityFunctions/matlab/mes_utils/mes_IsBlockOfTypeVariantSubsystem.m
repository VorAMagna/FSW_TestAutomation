%Check if the given block handle references to a Variant Subsystem block from
%Simulink User-Defined Function Library.
%
%DESCRIPTION:
%================
%Variant Subsystem blocks cannot be detected by their blocktype or masktype,
%instead other conditions were tested. Function returns 1 when given block
%handle is a Variant Subsystem block, otherwise 0.
%
%INPUT:
%======
%h_block--handle of the block to be tested
%
%OUTPUT:
%=======
%b_isBlockOfTypeVariantSubsystem-- If h_block is a Variant Subsystem block 1,
%otherwise 0.
%
%
%***************************************************************
% Copyright:  Model Engineering Solutions
% Date: 2017-04-21
%***************************************************************

function b_isBlockOfTypeVariantSubsystem=mes_IsBlockOfTypeVariantSubsystem(h_block)












































