% function class_DDId = mes_find_match_TLDDClass(class_name)
%
% Description:
% ============
% Find the class ID defined in DD with name as class_name (include the
% path of class group, such as 'classGroup/class'. 
% If more than one classes with same name exist in different class groups,
% this function can find the right one.
%
% INPUT PARAMETERS:
% =================
% - class_name: class name, include the class group, it is the value of
%               the 'class' field of the TL block dialog
%
% RETURN VALUES:
% ==============
% - class_DDId: id of the class definition in the TargetLink Data
%               Dictionary with class name as given; or empty if no this
%               class in DD
%
% EXAMPLE:
% ========
%   class_name='variableClassGroup/Input'
%   class_DDID=mes_find_match_TLDDClass(class_name)
%     get the class id from DD, then class_DDID can be used in dsdd to get
%     other attribute, such as :
%     storage=dsdd('Get',class_DDID,'storage')
%
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:05CEST $
% Revision:   $Rev: 633 $
% ****************************************************************

function class_DDId = mes_find_match_TLDDClass(class_name)



























