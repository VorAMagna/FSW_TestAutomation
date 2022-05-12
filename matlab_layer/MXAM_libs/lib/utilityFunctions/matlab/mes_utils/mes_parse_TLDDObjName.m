%function  pure_name=mes_parse_TLDDObjName(obj_name)
%
% RETURN PARAMETERS:
% ==================
% pure_name    - Name of the object in the TargetLink Data Dictionary
%                without group information, or empty, if obj_name is empty.
%
% INPUT PARAMETERS:
% =================
% obj_name    - name of object with the group information,it is the value of
%                 the 'class' or 'variable' field of the TL block dialog.
% Description:
% ============
% Get the pure object name, without the group information.
% Class name may be as 'variableClassgroup/classname', but only the
% 'classname' is needed for finding the class (as parameter to dsdd).
% E.g if the value of a field is "variableClassGroup1/class1", only the
% "class1" is needed to transfer to DSDD, otherwise, if it can not find
% anything.
%
% Example:
%   class_name='variableClassGroup/Input'
%   pure_name=mes_parse_TLDDObjName(class_name)
%   pure_name then is: 'Input'
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% version:      $Id: mes_parse_TLDDObjName.m 1.1 2020/07/31 16:10:23CEST Vojnic-Hajduk, Vladimir (vladvojn) Exp  $
% ***********************************************************

function  pure_name=mes_parse_TLDDObjName(obj_name)




























