% function [operands,operators] = mes_getAtomicOperands(s_expr,s_opt0)
%
% DESCRIPTION:
% ============
% Scans arithmetic or logical expression provided in string s_expr
% and returns string list of found atomic operands and operators.
% 
% INPUT PARAMETERS:
% =================
% - s_expr: string with expression
% - s_opt0: implied preceeding operator
%           default: '+'
%
% RETURN VALUES:
% ==============
% - operands:  list of atomic operands provided in s_expr,
%              if s_expr starts with a +/-, the implied first operand 0 is added
%              at the beginning of <operands> (see example 2),
% - operators: list of operators found in s_expr
%
% EXAMPLE:
% ========
% [operands,operators]=mes_getAtomicOperands('1-(2+3)')
% operands = 
%     '1'    '2'    '3'
% 
% operators = 
%     '+'    '-'    '+'
%
% [operands,operators]=mes_getAtomicOperands('-1')
% operands = 
%    '0'    '1'
%
% operators = 
%    '+'    '-'
%
%
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:07CEST $
% Revision:   $Rev: 5274 $
% ****************************************************************

function [operands,operators] = mes_getAtomicOperands(s_expr,s_opt0)

























































































































