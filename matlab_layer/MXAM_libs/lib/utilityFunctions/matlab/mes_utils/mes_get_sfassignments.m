% function lr_exprParts = mes_get_sfassignments(s)
%
% DESCRIPTION:
% ============
% Scans stateflow expression string s for assignments and returns
% array of structs with the assignnemt parts.
%
% INPUT PARAMETERS:
% =================
% - s_expr: stateflow expression string
%
% RETURN VALUES:
% ==============
% - lr_exprParts:  struct with parts of stateflow expression:
%                  lr_exprParts(i).left_part:left hand part of the ith assignment in s
%                  lr_exprParts(i).left_part_type: type of left hand part (always='identifier')
%                  lr_exprParts(i).op: operator (always='=')
%                  lr_exprParts(i).right_part: right hand part of the ith assignment
%                  lr_exprParts(i).right_part_type: type of right part
%                                                   {'expression','identifier',constant'}
%
% EXAMPLE:
% ========
% mes_get_sfassignments('a=b+c')
%   left_part: 'a'
%   left_part_type: 'identifier'
%   op: '='
%   right_part: 'b+c'
%   right_part_type: 'expression'
%
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:14CEST $
% Revision:   $Rev: 3136 $
% ****************************************************************

function lr_exprParts = mes_get_sfassignments(s_expr)















































































