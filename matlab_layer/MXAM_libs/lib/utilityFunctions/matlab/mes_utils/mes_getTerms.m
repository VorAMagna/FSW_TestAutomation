%function [cs_terms,cs_operators,s_class,s_err]=mes_getTerms(s)
% Splits string s into lists of terms and operators.
% The split is only done for the operators with the least rank
% 
% INPUT ARGUMENT:
% s: string with an expression, e.g. 'a+b+4*(c-1)';
%
% RETURN VALUES:
%  cs_terms:  cell array of strings with all found terms (operands)
%  cs_operators: cell array of strings with all found operators
%  s_class:      string describing the class of the expression
%                {e.g. 'add/sub', see below for a list), or empty, if no
%                 operands were found
%  s_err: error message if parse failed
%
% SUPPORTED OPERATORS SORTED BY RANK / CLASS
% rank  class    operators
% 1:    unary       ^,>>,<<,~                
% 2:    mul/div     *,/
% 3:    add/sub     +,-
% 4:    (reserved)
% 5:    relational   <,<=,==,=>,>,~=
% 6:    logical and  &&,&
% 7:    logical or   ||,|
% 8-9:  (reserved)
% 10:   assignment   =
%
% EXAMPLES:
% >> [terms,ops,class,err]=mes_getTerms('a+b-c')
% terms =    'a'     'b'   'c'
% ops =      '+'     '-' 
% class =    'add/sub'
% err =      ''
% >> [terms,ops,class]=mes_getTerms('a*b^c')
% terms =    'a'   'b^c'
% ops =      '*'
% class =    'mul/div'
%
%
% NOTES:
% - brackets around a term are removed
%   whereas brackets within a term are kept,
%   e.g.:
%     >> [terms,ops]=mes_getTerms('a+b-(2+c)')
%     terms =  'a'    'b'   '2+c' 
%     ops =    '+'    '-' 
%   but:
%     >> [terms,ops]=mes_getTerms('a+b*(2+c)')
%     terms =   'a'    'b*(2+c)'
%     ops =     '+'
% - To decompose all operators in a single step,
%   use mes_getAtomicOperands()
%
% See also mes_getAtomicOperands, mes_getLowestOperator
%
% *************************************************************
% Copyright: Model Engineering Solutions GmbH
% Revision:  $Rev: 4993 $
% Date:      $Date: 2020/07/31 16:10:13CEST $
% **************************************************************

function [cs_terms,cs_operators,s_class,s_err]=mes_getTerms(s)



























































































































































































































