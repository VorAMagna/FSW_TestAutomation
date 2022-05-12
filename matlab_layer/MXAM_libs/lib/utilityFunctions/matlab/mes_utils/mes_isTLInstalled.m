% function
% [b_ok,s_InstallationType]=mes_isTLInstalled(s_reqInstallationType)
%
% DESCRIPTION:
% ============
% Test if the TargerLink installation fulfills the given requirement.
%
%
% INPUT PARAMETERS:
% =================
% - s_reqInstallationType: string, must be one of the following strings.
%                          'full-featured','TL-installed', which means the
%                          required TL installation is full-featured, or
%                          not full-featured, any installation is enough.
%
% RETURN PARAMETERS:
% ==================
% - b_ok: true if tl installation fulfulls the requirement
% - s_InstallationType: the type of installation.
%
% EXAMPLE:
% ========
% [b_ok,s_InstallationType]=mes_isTLInstalled('full-featured')
% b_ok=true;
% s_InstallationType='full-featured'
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:20CEST $
% Revision:   $Rev: 3136 $
% ****************************************************************

function [b_ok,s_InstallationType]=mes_isTLInstalled(s_reqInstallationType)










































