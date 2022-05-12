% function [operands,operators] = mes_getAllItemsOfExpression(s_expr)
%
% DESCRIPTION:
% ============
% get the all items of an expression.
% 
% INPUT PARAMETERS:
% =================
% - s_expr: string with expression
%
% RETURN VALUES:
% ==============
% - operands:  list of atomic operands provided in s_expr,
%
% EXAMPLE:
% ========
% operands=mes_getAllItemsOfExpression('1-(2+3)')
% operands = 
%     '1'    '2'    '3'
% 
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:07CEST $
% Revision:   $Rev: 5274 $
% ****************************************************************

function cs_operands = mes_getAllItemsOfExpression(s_expr)



























