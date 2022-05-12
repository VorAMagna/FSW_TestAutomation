% DESCRIPTION:
% ============
% This function returns the version number, release and release date of the product 
% 's_productname' installed in the currently opened MATLAB application.
% To see ALL installed product names call function without arguments.
% 
% function [s_version, s_release, s_date]= mes_getProductVersion(s_productname)
%
% RETURN VALUES:
% ==================
% s_version: version number of product
% s_release: release of product
% s_date:    release date of product
%
% Return values are empty if product is not installed.
%
% INPUT PARAMETERS:
% =================
% s_productname: Name of installed product
%
% Example:
% ========
% [s_version, s_release, s_date]= mes_getProductVersion('Simulink')
%
% Returns (e.g.): s_version = 6.5, s_release = (R2006b), s_date = 03-Aug-2006
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:12CEST $
% Version:      $Rev: 633 $
% Author:       Anna Trögel (anna.troegel@model-engineers.com)
% ***********************************************************

function [s_version, s_release, s_date]= mes_getProductVersion(s_productname)





















































