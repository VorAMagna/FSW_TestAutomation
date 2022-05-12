%% Assertion Signals in Model Verification Library
%
% [result,cr_items,r_stats] = mes_mes_cgtl_4106(system, cmd_s)
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
% mes_cgtl_4106 - Assertion Signals in Model Verification Library
% 
% The "Output Assertion Signal" option for all blocks from the Model Verification Library must not be used. 
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyses each block of the "Model Verification Library".
%   The result is failed when the option "Output Assertion Signal" is enabled.
% The result is passed when the failed cases does not apply.
%
% FIX ACTION:
% ===========
% "Output Assertion Signal" option will be disabled.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:30CEST $
% Revision:     $Rev: 15223 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_cgtl_4106(system, cmd_s)




















































































