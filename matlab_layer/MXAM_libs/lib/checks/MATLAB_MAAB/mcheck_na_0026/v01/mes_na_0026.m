%% Consistent software environment
%
% [result,cr_items,r_stats] = mes_na_0026(system, cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistic s on the check result
% for details use 'open mes_check_info'
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>,
% for details use 'open mes_check_info'
%
% REFERENCED GUIDELINE:
% =====================
% Control Algorithm Modeling Using Matlab,Simulink, and Stateflow
% Version 3.0
% MathWorks Automotive Advisory Board (MAAB)
% Guideline Rule ID: na_0026 (3.1.1.)
%
% DESCRIPTION:
% ============
% During software development, it is recommended that a consistent software 
% environment is used across the project. Software includes, but not limited 
% to:
% - MATLAB
% - Target Link
%
% Consistent software environment implies that the same version of the 
% software is used across the full project. The version number applies to 
% any patches or extensions to the software used by a group.
%
% PASS/FAIL CRITERIA:
% ===================
% A pass is given, if
% - the used Matlab Version is equal to the one given in parameter 
%   MAAB.na_0026.MatlabVersion
% - the used TargetLink Version is equal to the one given in parameter 
%   MAAB.na_0026.TargetLinkVersion
%
% If a parameter is empty, a pass is without checking corresponding
% software.
%
% SOLUTION:
% =========
% Use advised Software versions
%
% FIX OPERATION:
% ==============
% No automatic fix available.
%
% CHECK PARAMETERS:
% =================
% MAAB.na_0026.MatlabVersion:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'dc'
%   DESCRIPTION:
%       Allowed MATLAB version 
% 
% MAAB.na_0026.TargetLinkVersion:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'dc'
%   DESCRIPTION:
%       Allowed TargetLink version 
%
% NOTE:
% =====
% - if any parameter contains the string 'dc' (dont care), this software
%   component is not checked. 
% - it is not necessary to check for Simulink version as this one correspond
%   to the MATLAB version
% - Guideline indicates to check version number of C Compiler. This has to
%   be done manually
% - 'Checked blocks' in 'Statistics' corresponds to checked software
%   components
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:43CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0026(system, cmd_s)












































