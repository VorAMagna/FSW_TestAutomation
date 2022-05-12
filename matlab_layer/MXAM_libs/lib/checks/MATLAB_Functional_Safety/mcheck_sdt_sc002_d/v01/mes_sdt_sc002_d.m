%% Stateflow: Chart Option 'Data Range'
%
% [result,cr_items,r_stats]=mes_sdt_sc002(system,cmd_s)
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
% MES Functional Safety Guidelines
% Release 1.7 (21 June 2013)
% Corresponding Guideline: 2.1
%
% DESCRIPTION:
% ============
% To ensure consistent Data Ranges at the Stateflow interface, enable the
% 'Data Range' debugging option.
%
% PASS/FAIL CRITERIA:
% ===================
% If a chart fulfills the following conditions, a pass will be given:
% The debugging option 'Data Range' in the debug window of the
% statechart must be set.
%
% SOLUTION:
% =========
% Set the option 'Data Range' in the debug window or use the API an set the
% option [current Chart].machine.debug.RunTimeCheck.DataRangeChecks to true.
%
% FIX OPERATION:
% ==============
% Fix will set the corresponding option
% [current Chart].machine.debug.RunTimeCheck.DataRangeChecks to true.
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% Use the 'machine' options to set the 'Data Range' option.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:08CEST $
% Revision:     $Rev: 7016 $
% *************************************************************************

function [result,cr_items,r_stats]=mes_sdt_sc002_d(system, cmd_s)


























































































































































