% function [right_part,errmsg] = mes_getExpressionRightHandPart(s_text,start_pos)
%
% DESCRIPTION:
% ============
% Gets the right-hand part of a stateflow expression.
% 
% INPUT PARAMETERS:
% =================
% - s_text:    string with stateflow expression (relational operation or assignment)
% - start_pos: search start position
% - b_relational: if true, the right hand part of a relational operation is
%   being searched, otherwise, the right hand part of an assignment is
%   being searched. Default is true.
%
% RETURN VALUES:
% ==============
% - right_part: right part of the expression
% - errmsg:     message if error occured
%
% EXAMPLE:
% ========
% mes_getExpressionRightHandPart(s_expr,pos(j)-1)
%
% SEE ALSO:
% =========
% mes_getExpressionLeftHandPart
%
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:10CEST $
% Revision:   $Rev: 3136 $
% ****************************************************************

function [right_part,errmsg] = mes_getExpressionRightHandPart(s_text,start_pos,b_relational)




















































































