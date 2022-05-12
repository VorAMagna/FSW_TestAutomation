% function [s_lowestoperator,cs_operands,cs_operators] = mes_getLowestOperator(s_expr)
% 
% DESCRIPTION:
% ============
% Splits string s_expr into lists of operators and operands
% and returns the operator with the lowest priority (see below).
% (supported operators are: {'+','-','*','L','^'} (L=logical))
% 
% INPUT PARAMETERS:
% =================
% - s_expr: string with an expression, e.g. 'a+b+4*(c-1)'
%
% RETURN VALUES:
% ==============
% - s_lowestoperator: string of operator with lowest priority.
%                     If more than one operator with equally low
%                     priority is found, the first one will be returned
%                     exceptions:
%                     - if these operators are '+' and '-', 
%                       '-' will always be returned
%                     - if the lowest operator is logical (<,>,~,==),
%                       an 'L' is returned
% - cs_operands:      cell array of strings with all found operands
% - cs_operators:     cell array of strings with all found operators
% - s_err:            error message of parser or empty, if no error
%                     occurred
%
% EXAMPLE:
% ========
% mes_getLowestOperator('a+b*2') returns:
% s_lowestoperator = '+'
% operands = {'a','b'}
% operators = {'+','*'}
%
% bracketed sub-expressions are returned as operands
% e.g.
% mes_getLowestOperator('a+b*(2+c)'):
% operands = {'a','b','2+c'}
% operators = {'+','*'}
% Note: to resolve bracketed subexpressions
%       use mes_getAtomicOperands()
% unary +/- expressions are extended with 1
% e.g. '-x' becomes '0-x'
%
% SEE ALSO:
% =========
% See also mes_getTerms, mes_splitSFExpression, mes_getAtomicOperands
%
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:11CEST $
% Revision:   $Rev: 3136 $
% ****************************************************************

function [s_lowestoperator,cs_operands,cs_operators,s_err] = mes_getLowestOperator(s_expr)





















































































