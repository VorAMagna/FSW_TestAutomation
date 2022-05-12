% returns TargetLink version string and number
% SYNTAX:
%  [s_ver,d_ver,d_patchno]=mes_getTLVersion(s_varg)
%
% INPUT ARGUMENT:
%   s_varg (optional) if provided, this string is decomposed
%       into a numeric version number. If empty, the
%       version number of the TargetLink installation is returned
%
% RETURN VALUES:
% s_ver: string with Targetlink version, e.g. '2.2.1'
%        or empty string, if TargetLink installation is not found
% d_ver: numeric version number (double)
%        or -1, if TargetLink installation is not found
%        format <major number>.<n><m>[<..>]
%        each version number part is converted into a single decimal,
%        e.g. s_ver='2.2.1' is converted to d_ver = 2.21
%        if a version part after the decimal point has more than one digit (e.g. 2.10.1)
%        an error is raised
% d_patchno: number of patch version (if present, default=-1)
%        e.g. if s_ver='2.1p12', d_patchno will be = 12
%
%
%================================================================
% Copyright: Model Engineering Solutions
% Revision:  $Rev: 3136 $
% Date:      $Date: 2020/07/31 16:10:13CEST $
% Author:    Jörg Sangals (joerg.sangalsYu@model-engineers.com
%================================================================

function [s_ver,d_ver,d_patchno]=mes_getTLVersion(s_varg)





















































































































