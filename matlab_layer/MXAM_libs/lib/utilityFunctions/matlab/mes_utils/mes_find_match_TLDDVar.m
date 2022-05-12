% function var_DDId = mes_find_match_TLDDVar(variable_name)
%
% Description:
% ============
% Find the variable ID defined in DD with name as variable_name (include the
% path of variable group, such as 'variableGroup/variable'.
% If more than one variables with same name exist in different variable groups,
% this function can find the right one.
%
% INPUT PARAMETERS:
% =================
% - variable_name: variable name, include the variable group, it is the value of
%                  the 'variable' field of the TL block dialog
%
% RETURN VALUES:
% ==============
% - var_DDId: id of the variable definition in the TargetLink Data
%             Dictionary with variable name as given; or empty if no this
%             variable in DD
%
% EXAMPLE:
% ========
%   variable_name='variableGroup/Input'
%   var_DDID=mes_find_match_TLDDVar(variable_name)
%     get the variable id from DD, then var_DDID can be used in dsdd to get
%     other attribute, such as :
%     storage=dsdd('Get',var_DDID,'module')
%
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:06CEST $
% Revision:   $Rev: 633 $
% ****************************************************************

function var_DDId = mes_find_match_TLDDVar(variable_name)






























