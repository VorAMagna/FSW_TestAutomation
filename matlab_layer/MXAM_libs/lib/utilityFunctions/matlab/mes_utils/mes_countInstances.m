% function counts = mes_countInstances(c_data,s_fieldname,b_tryshortformat)
% 
% DESCRIPTION:
% ============
% Counts instances of all different values in c_data.
% Syntax:
%   counts=mes_countInstances(cs_data[,b_tryshortformat])
%   counts=mes_countInstances(cr_data,s_fieldname[,b_tryshortformat])
%
% INPUT PARAMETERS:
% =================
% - c_data:           cell array of structs or strings
% - s_fieldname:      string with name of field to be counted
%                     this argument is only needed if a struct array (c_data) is provided
% - b_tryshortformat: if true (default), the function tries to return 
%                     a compact count struct (see below)
%                     if false, a cell array count is always returned
%
% RETURN VALUES:
% ==============
% - counts: contains the counts of all different values found in c_data.<s_fieldname>
%          its' type is A) either a struct or a B) cell array:
%          A) Counts is a struct, if all instances are valid MATLAB identifier names and
%             argument b_tryshortformat = true. Here, the counts are stored in fields
%             that have the same name as the found instances.
%          B) Counts is a cell array, if b_tryshortformat = false or it there are one 
%             or more instances with incompatible names. Here, a cellarray of 
%             length i is returned, with i = number of found instances and the fields:
%               counts{i}.name  : string with name of found instance(i)
%               counts{i}.count : count of this instance in c_data
%
% EXAMPLE:
% ========
% x=[];x{1}.class='a';
% x{2}.class='a';
% x{3}.class='b';
% counts=mes_countInstances(x,'class')
% counts = 
%    a: 2
%    b: 1
%
% x=[];x{1}.class='$a';    % not a valid MATLAB identifier
% x{2}.class='$a';
% counts=mes_countInstances(x,'class');
% counts{1}
% ans = 
%   name: '$a'
%   count: 2
%
%
% ***********************************************************
% Copyright: Model Engineering Solutions
% Date:      $Date: 2020/07/31 16:10:04CEST $
% Revision:  $Rev: 633 $
% ****************************************************************

function counts = mes_countInstances(c_data,s_fieldname,b_tryshortformat)

















































































































