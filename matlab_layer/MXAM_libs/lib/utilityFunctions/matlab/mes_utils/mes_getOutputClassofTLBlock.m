%Get the output.class property of a TargetLink block
%Syntax
%======
%s_class=mes_getOutputClassofTLBlock(h_block)
% INPUT ARGUMENTS:
% ================
% - h_block       string/double, the handle or path of the tl block
% - s_class_prop  name of class property of the block, ex: output.class,
% scaling.class. Use this parameter the variable class of properties other
% than output can also be obtained. For example, for look up table block,
% the scaling.class can also be obtained. Default value is 'output.class'.
% RETURN VALUES:
% ==============
% s_class           string, the output.class of the block

function [s_class,errorcode,msg]=mes_getOutputClassofTLBlock(h_block,s_class_prop)









































