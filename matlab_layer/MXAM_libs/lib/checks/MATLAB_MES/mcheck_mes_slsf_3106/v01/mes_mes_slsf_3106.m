%% Avoid Global Stateflow Functions
% [result,cr_items,r_stats] = mes_mes_slsf_3106(system, cmd_s)
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
% DESCRIPTION:
% ============
% Do not use the option 'Export Chart Level Functions (Make Global)' to define global Stateflow functions which can be used across different charts.
% If this is necessary, use global Stateflow functions only with a fixed interface, i.e. the function should not have input parameters.
% Especially, the option 'Allow exported functions to be called by Simulink' should not be selected (available since R2014b).
%
% PASS/FAIL CRITERIA
% ==================
% Check verifies each chart of the model.
%
% Failed1: If the chart property 'Export Chart Level Graphical Functions (make global)' is selected and if there is a Stateflow global function with input parameters which are also called in other charts.
%
% Failed2: If the chart property 'Allow exported functions to be called by Simulink' (available since R2014b) is selected.
%
% Review: If the chart property 'Export Chart Level Graphical Functions (make global)' is selected and if there is a Stateflow global function without input parameters which are also called in other charts.
%
% Passed, if the above conditions are not true.
%
% CHECK PARAMETERS:
% =================
% MES.mes_slsf_3106.IgnoredFunctions:
%   DATATYPE:
%       cellstring
%   DEFAULT VALUE:
%       {''}
%   DESCRIPTION:
%       In this parameter names of functions can be listed, which will be
%       ignored
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:54CEST $
% Revision:     $Rev: 15306 $
% *************************************************************************

function [result,cr_items,r_stats]= mes_mes_slsf_3106(system,cmd_s) %#ok<INUSD>


































































































































































































