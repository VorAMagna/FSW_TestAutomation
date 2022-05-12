% extends MATLAB function isfield to nested fields
%
% input arguments:
%  r_var: structure in which the field s_fieldname is searched
%  s_fieldname: string with the name of the field to be searched
%  b_requireNonemptyField : if true, only non-empty fields will be found
%                           default: false
%              
%
% return variable:
%  b_res: is true if r_var contains the field s_fieldname and (if
%         b_requireNonemptyField) if the field is not empty
%         is false, otherwise
%
% Examples:
% >> x=[];x.a.b=1;
% >> mes_isfield(x,'a.b')
% ans =
% 
%      1
% >> mes_isfield(x,'a.c')
% ans =
%      0  
% >> mes_isfield(x,'b')
% ans = 
%      0
% See also isfield
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:21CEST $
% Version:      $Rev: 1910 $
% Authors:      Jörg Sangals   (joerg.sangals@model-engineers.com)
% ***********************************************************

function b_res=mes_isfield(r_var,s_fieldname,b_require_nonemptyfield)

















































