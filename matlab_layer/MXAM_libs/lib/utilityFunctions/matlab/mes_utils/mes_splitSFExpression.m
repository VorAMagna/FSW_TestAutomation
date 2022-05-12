% splits stateflow expression string into operators and operands
% function calls and parenthesized subexpressions are not decomposed 
%   but instead returned as a single operand
% 
% SYNTAX:
% =======
% [cs_operands,cs_operators,s_err]=mes_splitSFExpression(s,[b_removetermparentheses[,b_trimspaces]])
%
% INPUT ARGUMENTS:
% ================
% s: string with a stateflow-conform expression, e.g. 'a+b+4*(c-1)';
% b_removetermparentheses: if true (default), pairs of matching outside parentheses are removed
%                          from the returned operands
% b_trimspaces: if true (default), outer spaces of returned operands and operators are trimmed
%                         
% RETURN VARIABLES
% ================
%  cs_operands:  cell array of strings with all found terms (operands)
%  cs_operators: cell array of strings with all found operators
%  s_err : error message or empty if no error occurred
%  cs_signPos: cell array of number if one operator is a sign. If no sign,
%  this is then empty. If at least one is a sign, cs_signPos then has same
%  length as cs_operator.
% EXAMPLES:
% =========
% mes_splitSFExpression('a+b*2') returns:
% cs_operands = {'a','b','2'}
% cs_operators = {'+','*'}
%
% mes_splitSFExpression('(a+b)*2')
% would yield:
% cs_operands = {'a+b','2'}
% cs_operators = {'*'}
%
% mes_splitSFExpression('sqrt(2)+4')
% would yield:
% cs_operands = {'sqrt(2)','4'}
% cs_operators = {'+'}
% 
% NOTES:
% ======
% recognized operators are (ordered by their ranks):
% rank  class    operators
% 1:    bit and unary: ^,~,++,--,>>,<<
% 2:    mul/div     *,/,%%
% 3:    add/sub     +,-
% 4:    (reserved)  
% 5:    relational  <,<=,==,>=,>,~=
% 6:    logical and   &,&&
% 7:    logical or    |,||
% 8-9:  (reserved)
% 10:   assignment   =
%
% See also: mes_getTerms, mes_getLowestOperator, mes_getAtomicOperands
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright: Model Engineering Solutions
% Revision:  $Rev: 6166 $
% Date:      $Date: 2020/07/31 16:10:27CEST $
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [cs_operands,cs_operators,s_err,cs_signPos]=mes_splitSFExpression(s,b_removetermparentheses,b_trimspaces)













































































































































































































































