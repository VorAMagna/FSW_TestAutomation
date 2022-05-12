%function [b_res,b_numberbased,d_number]=mes_isVarEnumeratedObjOfBaseWorkspace(s_expr)
% test if the give expression repsents an enumerated type, if so b_res will
% be true, if it is a number based enumerated type, b_numberbased will be
% true, and d_number will be its value
%
% Input parameter:
% ===============
% s_expr: string, the expression that should be analyzed
%
% Return values.
% ==============
% b_res: true for enumerated obj
% b_numberbased: true if object is number based enumerated type
% d_number: number of this obj, it is number based
% members: all members of this enumerated obj
% d_allMemberValues: value of all member of this enumerated obj,if it is
% number baded
%
% Example:
% x=Results.First;
% [b_res,b_numberbased,d_number]=mes_isVarEnumeratedObjOfBaseWorkspace('x')

function [b_res,b_numberbased,d_number,members,d_allMemberValues]=mes_isVarEnumeratedObjOfBaseWorkspace(s_expr)






































