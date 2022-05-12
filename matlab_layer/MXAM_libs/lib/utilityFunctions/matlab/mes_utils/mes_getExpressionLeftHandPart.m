% function [left_part,errmsg] = mes_getExpressionLeftHandPart(s_text,start_pos)
% 
% DESCRIPTION:
% ============
% Gets the left-hand part of a stateflow expression (relational operation or
% assignment).
%
% INPUT PARAMETERS:
% =================
% - s_text:    the string with the expression
% - start_pos: search start position
% - b_relational: if true, the left hand side of a relational operation is
%   being searched, otherwise, of an assignment is being searched.
% RETURN VALUES:
% ==============
% - left_part: left part of the expression
% - errmsg:    message if error occured
%
% EXAMPLE:
% ========
% mes_getExpressionLeftHandPart(s_expr,pos(j)-1)
%
% SEE ALSO:
% =========
% mes_getExpressionRightHandPart
%
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:10CEST $
% Revision:   $Rev: 3136 $
% ****************************************************************

function [left_part,errmsg] = mes_getExpressionLeftHandPart(s_text,start_pos,b_relational)














































































