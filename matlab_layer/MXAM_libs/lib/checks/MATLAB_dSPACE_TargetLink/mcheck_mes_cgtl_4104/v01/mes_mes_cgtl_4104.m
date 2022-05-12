%% No Output initialization When Chart Wakes Up
%
% [result,cr_items,r_stats] = mes_mcheck_mes_cgtl_4104(system, cmd_s)
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
% mcheck_mes_cgtl_4104 - No Output initialization When Chart Wakes Up
% The option 'Initialize Outputs Every Time Chart Wakes Up' in the Chart Properties dialog must not be checked. 
% 
% PASS/FAIL CRITERIA:
% ===================
% The check verifies the chart property 'Initialize Outputs Every Time Chart Wakes Up' of every Stateflow chart in the model.
% Failed: If the option 'Initialize Outputs Every Time Chart Wakes Up' in the Chart Properties dialog is selected.
% The check result is passed if the failed case does not apply.
%
% FIX ACTION:
% ===========
% The chart property option 'Initialize Outputs Every Time Chart Wakes Up' of every chart will be deselected.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:30CEST $
% Revision:     $Rev: 15223 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_cgtl_4104(system, cmd_s)





























































