%% Permissable TargetLink  options.
%
% [result,cr_items,r_stats] = mes_cgtl_9002(system, cmd_s)
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
% MES
%
% DESCRIPTION:
% ============
% Each model should have identical TargetLink settings. Setting Parameters are
% defined in an extermal excel file, with parameter name and suggested
% values. 
%
% PASS/FAIL CRITERIA:
% ===================
% If all the TargetLink settings are set the suggested value, a pass is
% given, otherwise, a fail will be given.
%
% SOLUTION:
% =========
% Set the TargetLink settings with the suggested value.
%
% FIX OPERATION:
% ==============
% Setting will be set to suggested value.
%
% CHECK PARAMETERS:
% =================
% MES.mes_cgtl_9002.ParameterExcelFile:
%   DATATYPE:
%       cellstring
%   DEFAULT VALUE:
%       {'SLTL_ParameterListe.xlsx'}
%   DESCRIPTION:
%       Name of excel file, that contains Simulink and TargetLink
%       parameters. Note, that the  excel file must be in matlab path, as
%       no absolute path is used.
%
% NOTE:
% =====
% Excel file contains default values.
% This check only considers the TargetLink parameters. Use mes_settings_0001 to check
% for Simulink parameters.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:51CEST $
% Revision:     $Rev: 15430 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_mes_cgtl_9002(system, cmd_s)









































