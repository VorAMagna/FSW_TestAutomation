%function r_relop=mes_splitSFRelOp(s_expr)
% looks for a relational operation in s_expr
% and splits s_expr into a left-hand-,operator- and
% right_hand part. 
% example: mes_spitSFRelOp('a+b>2*c')
% returns left='a+b',op='>',right='2*c'
% If more than one relational operator is found on the top-level
% of the expression (outside of parenthesis), the right-most operator 
% is taken (having the least rank when evaluating from left to right)
% e.g. s_expr='a>b<c' returns: leftpart = 'a>b',  op='<', rightpart='c'
% 
%input argument s_expr: string with expression(s)
%return value:
%r_relop: structure with found relational operation
%         or empty, if expression is not a relational expression
%the struct has the following fields (all of type string)
%r_relop.left_part: left part of the ith relational operation
%r_relop.left_part_type: type of left part
%r_relop.op: operator 
%r_relop.right_part:right part
%r_relop.right_part_type: type of right part
% 
% recognized relational operators: {'~=','==','<=','>=','>','<'};
% other Matlab relational operations: 'eq','ne','lt','gt','le','ge' are not
% valid in Stateflow, so they are not considered here.
%
%Version: $Rev: 633 $%
%Date: $Date: 2020/07/31 16:10:28CEST $%
%Author: Jörg Sangals (joerg.sangals@model-engineers.com)

function r_relop=mes_splitSFRelOp(s_expr)



































