%function i_res=mes_is_TLDDclass_calibrateable(class_name)
%
% RETURN VARIABLE:
% ================
% i_res         = 0, if class <class_name> is not calibratable
%                    or if class_name = '' or 'default'
%               = 1  if the class is calibratable
%               = 2  if class is not found in DD
%
% INPUT ARGUMENT:
% ===============
% class_name    - class name including the class group, it is the value of
%                 the 'class' field of the TL block dialog.
% Description:
% ============
% Checks the field 'info' of the class definition, to see if it is not
% 'none' and not 'readonly'. If so, the class is a calibratable.
% (refer to DD help, dSpace Data Dictionary MATLAB API Reference..
%   -> Data Dictionary MATLAB API->keywords for Object Selection)
%
% Example:
%   class_name='cal'
%   i_res=mes_is_TLDDClass_calibrateable(class_name)
%   return: i_res=1
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% version:      $Id: mes_is_TLDDclass_calibrateable.m 1.1 2020/07/31 16:10:21CEST Vojnic-Hajduk, Vladimir (vladvojn) Exp  $
% ***********************************************************

function i_res=mes_is_TLDDclass_calibrateable(class_name)


































