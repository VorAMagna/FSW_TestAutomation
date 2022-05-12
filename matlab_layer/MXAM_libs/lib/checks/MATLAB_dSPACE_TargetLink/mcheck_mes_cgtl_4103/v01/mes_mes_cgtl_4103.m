%% No Support for Mealy or Moore State Machine Types
%
% [result,cr_items,r_stats] = mes_mcheck_mes_cgtl_4103(system, cmd_s)
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
% MES CHECK: 
% ==========
% mcheck_mes_cgtl_4103 - No Support for Mealy or Moore State Machine Types
% The options Mealy and Moore for the 'State Machine Type' in the Chart properties dialog must not be used. Instead, the 'State Machine Type' has to be set to 'Classic'. 
%
% PASS/FAIL CRITERIA:
% ===================
% The check verifies the chart property 'State Machine Type' of every Stateflow chart in the model.
% Failed: If the option ''State Machine Type' in the Chart Properties dialog is set to 'Mealy or Moore'.
% The check result is passed if the failed case does not apply.
%
% FIX ACTION:
% ===========
% The chart property option 'State Machine Type' of every chart is set to 'Classic'.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:29CEST $
% Revision:     $Rev: 15223 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_cgtl_4103(system, cmd_s)





























































