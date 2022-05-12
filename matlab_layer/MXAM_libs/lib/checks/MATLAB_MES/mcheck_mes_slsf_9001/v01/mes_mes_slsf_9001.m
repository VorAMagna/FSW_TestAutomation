%% Configuration Parameters for Simulink
%
% [result,cr_items,r_stats] = mes_mes_slsf_9001(system, cmd_s)
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
% mes_slsf_9001 - Configuration Parameters for Simulink
%
% Each project must define an appropriate setting for each Simulink
% Configuration parameter. These settings must be used for each model
% within that project.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each configuration parameter of the model, which is
% defined in an Excel file given by MES.mes_slsf_9001.ParameterExcelFile.
% 
%     Failed 1: The configuration parameter is not set to the desired
%     value.
% 
%     Failed 2: The check parameter MES.mes_slsf_9001.minDiagnosticsError
%     is set to true and the configuration parameter from the diagnostics
%     category has a warning/error level less strict than the expected
%     value.
% 
% The check result is passed if all failed cases do not apply.
%
% SOLUTION:
% =========
% Review the configuration parameters according to guideline.
% 
%     Solution 1: Set the configuration parameter to the desired value
%     given in the Excel file.
%     
%     Solution 2: If the check parameter
%     MES.mes_slsf_9001.minDiagnosticsError is true, make sure the
%     configuration parameters from the diagnostics category have equal or
%     more strict warning/error level than the desired value.
% 
% FIX OPERATION:
% ==============
% The configuration parameters which received a 'failed' will be set to the
% value defined in the Excel file.
%
% CHECK PARAMETERS:
% =================
% MES.mes_slsf_9001.ParameterExcelFile:
%   DATATYPE:
%       cellstring
%   DEFAULT VALUE:
%       {'SL_ParameterList.xlsx'}
%   DESCRIPTION:
%       Name of excel file, that contains Simulink and TargetLink
%       parameters. Note, that the  excel file must be in matlab path, as
%       no absolute path is used.
%
% MES.mes_slsf_9001.minDiagnosticsError:
%   DATATYPE:
%       boolean
%   DEFAULT VALUE:
%       false
%   DESCRIPTION:
%       Boolean parameter that treats the expected values for diagnostics
%       parameters as the minimum level.
%       If the parameter is set to true, the check does not deliver a fail
%       finding for parameters with a more strict warning/error level than
%       the desired value.
%
% NOTE:
% =====
% Excel file contains default values.
% This check only considers the Simunlink parameters. Use mes_cgtl_9002 to check
% for TargetLink parameters.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:55CEST $
% Revision:     $Rev: 15430 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_mes_slsf_9001(system, cmd_s)








































