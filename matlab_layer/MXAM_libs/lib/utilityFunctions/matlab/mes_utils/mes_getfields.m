% function cr_foundFields = mes_getfields(r_fields,s_field)
%
% DESCRIPTION:
% ============
% Returns all instances of the field s_field in array 'r_fields'.
% 
% INPUT PARAMETERS:
% =================
% - r_fields: array or cell array of structures or single structure
% - s_field:  name of field
%
% RETURN VALUES:
% ==============
% - cr_foundFields: cell array of found instances
%                   with contents of cr_in.<s_field>
%
% EXAMPLE:
% ========
% a(1).x='a1';
% a(2).y='a2y'; % <- no x defined for this struct
% a(3).x='a3';
% res = mes_getfields(a,'x')
% res
% -> {'a1' [] 'a3'}
%
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:14CEST $
% Revision:   $Rev: 5616 $
% ****************************************************************

function cr_foundFields = mes_getfields(r_fields,s_field)












































