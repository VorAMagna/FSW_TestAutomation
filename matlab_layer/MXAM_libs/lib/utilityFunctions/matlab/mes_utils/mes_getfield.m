% function res = mes_getfield(r_var,s_fieldname)
%
% DESCRIPTION:
% ============
% Extends MATLAB function getfield to nested fields.
%
% 
% INPUT ARGUMENTS:
% ================
% - r_var:       structure in which the field s_fieldname is searched
% - s_fieldname: string with the name of the field to be searched
%
% RETURN VALUE:
% =============
% - res: value of s_fieldname
%
% EXAMPLES:
% ========
% x=[];x.a.b=1;
%
% mes_getfield(x,'a')
%  ans = 
%    b: 1
%
% mes_getfield(x,'a.b')
%   ans =
%      1

function res = mes_getfield(r_var,s_fieldname) %#ok<INUSL>











































