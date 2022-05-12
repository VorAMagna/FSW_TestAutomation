% function right_obj = mes_find_match_TLDDClass(objs,commenString,obj_name)
%
% Description:
% ============
% Find the object ID from the given objs, whos path include string as
% [commonstring/obj_name].
%
% INPUT PARAMETERS:
% =================
% - objs_ID:      object Ids, it is the return value of dsdd('find'...)
% - commenString: the common string that is included by all the objs, e.g
%                 '/pool/variable' or '/pool/variableclasses'
% - obj_name:     name of object with the group information,it is the value of
%                 the 'class' or 'variable' field of the TL block dialog
%
% RETURN VALUES:
% ==============
% - mached_objID: id of the TargetLink Data Dictionary object with name as
%                 given by obj_name
%
% EXAMPLE:
% ========
%   class_name='variableClassGroup/Input'
%   class_DDId=dsdd('find','/Pool/VariableClasses','objectKind','VariableClass','name','Input');
%   class_DDID=mes_find_match_TLDDObj(class_DDId,'/Pool/VariableClasses',class_name);
%     The class Id of class '/Pool/VariableClasses/variableClassgroup/Input'
%     is then returned.
% 
%   pure_name=parse_name('var1'); %%pure_name='var1'
%   variable_def_dd=dsdd('find','/Pool/Variables','objectKind','variable','name',pure_name);
%     if another variable with name 'var1' exists in
%     /pool/variables/varaibleGroup1, then the length of variable_def_dd will
%     be 2;
%   variable_def_dd=mes_find_match_TLDDObj(variable_def_dd,'/Pool/Variables',variable_name);
%     variable_def_dd then is the objId of variable 'var1' under
%     /pool/variables.
%
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:06CEST $
% Revision:   $Rev: 633 $
% ****************************************************************

function mached_objID = mes_find_match_TLDDObj(objs_ID,commenString,obj_name)





































