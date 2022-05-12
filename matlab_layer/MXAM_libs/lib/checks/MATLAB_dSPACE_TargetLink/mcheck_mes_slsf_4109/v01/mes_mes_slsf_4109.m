%% Relational Operator with IsInf, IsNaN, IsFinite Checks
%
% [result,cr_items,r_stats] = mes_mes_slsf_4109(system, cmd_s)
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
% mes_slsf_4109 - Relational Operator with IsInf, IsNaN, IsFinite Checks
%
% DESCRIPTION:
% ==========
% For Relational Operator blocks, the relational Operator must not be set to IsInf, IsNaN, IsFinite. 
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each Relational Operator block in the model.
% Failed 1: The parameter 'Relational operator' is set to IsInf, IsNaN or IsFinite.
% The check result is passed if all failed cases do not apply.
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:34CEST $
% Revision:     $Rev: 15223 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_slsf_4109(system, cmd_s)

































































































