%% TL_RULE_SIGNALATT_LIB_DATA_TYPE_CONV
%
% [result,cr_items,r_stats] = mes_mes_cgtl_4108(system, cmd_s)
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
% mes_cgtl_4108 - TL_RULE_SIGNALATT_LIB_DATA_TYPE_CONV
% The check analyzes each Data Type Conversion block in the model if the option 'Input and Output must have equal' is set to 'Real World Value'.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each Data Type Conversion block in the model.
% 
%     Failed 1: The option 'Input and Output must have equal' is not set to 'Real World Value'.
% 
% The check result is passed if the option 'Input and Output must have equal' is set to 'Real World Value'. 
%
% FIX ACTION:
% ===========
% The option 'Input and Output must have equal' of the Data Type Conversion block is set to 'Real World Value'.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:31CEST $
% Revision:     $Rev: 15223 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_cgtl_4108(system, cmd_s)













































































