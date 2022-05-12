%% TL_RULE_STATEFLOW_GRAPH_FUNC_MULTIPLE_OUTS
%
% [result,cr_items,r_stats] = mes_mes_cgtl_4302(system, cmd_s)
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
% mes_cgtl_4302 - TL_RULE_STATEFLOW_GRAPH_FUNC_MULTIPLE_OUTS
% 
% Stateflow graphical functions should have a single output.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each graphical function in each chart of the model.
%     Failed 1: The graphical function has more than one output.
% The check result is passed if all failed cases do not apply.
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:33CEST $
% Revision:     $Rev: 15223 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_cgtl_4302(system, cmd_s)


































































































