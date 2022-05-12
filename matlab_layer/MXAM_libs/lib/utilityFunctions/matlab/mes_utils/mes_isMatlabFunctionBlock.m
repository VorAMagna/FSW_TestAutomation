%Check if the given block handle references to a MATLAB Function Block from
%Simulink User-Defined Function Library.
%
%DESCRIPTION:
%================
%MATLAB Functions blocks cannot be detected by their blocktype or masktype,
%instead other conditions were tested. Function returns 1 when given block
%handle is a MATLAB Function block, otherwise 0.
%
%INPUT:
%======
%h_block--handle of the block to be tested
%
%OUTPUT:
%=======
%b_isMatlabFunctionBlock-- If h_block is a MATLAB Function Block 1,
%otherwise 0.
%

function b_isMatlabFunctionBlock=mes_isMatlabFunctionBlock(h_block)














































