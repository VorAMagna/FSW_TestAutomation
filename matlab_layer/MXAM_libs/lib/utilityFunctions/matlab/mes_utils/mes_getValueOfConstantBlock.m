% get the constant value of constant block, include tl constant block
%
% SYNTAX:
% =======
%   s_constValue = mes_getValueOfConstantBlock(hBlock)
%
% DESCRIPTION:
% ============
% Get the constant value of the constant block, it is the original value in
% the constant value field of a constant block, can be a literal number, a
% variable name or an expression.
% 
% In different version of simulink, the name of the field for the constant
% value is different, so that generate this function for all versions.
% INPUT ARGUMENTS:
% ================
% -  hBlock          double (no default value)
%                    Handle of the constant block
%
% RETURN VALUES:
% ==============
% - s_constValue     string
%                it is the original value in the constant value field of a
%                constant block, can be a literal number, a variable name
%                or an expression.
% EXAMPLE(S):
% ===========
% s_constValue = mes_getValueOfConstantBlock(gcbh)
%
% *************************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:13CEST $
% Revision:   $Rev: 3136 $
% *************************************************************************

function s_constValue = mes_getValueOfConstantBlock(hBlock)



























































