%% Use of Bitfields
%
% [result,cr_items,r_stats] = mes_mes_cgtl_4112(system, cmd_s)
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
% mes_cgtl_4112 - Use of Bitfields
% The option Use bitfields in state machines should not be selected if compliance to MISRA rule 13 is desired.
% The recommendation is only for TargetLink versions older than TargetLink 4.1 because of a MISRA C rule. For newer versions, the rule can be ignored.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes the TargetLink settings in the Main Dialog (only if the TargetLink version is <4.1)
% Failed 1: The option 'Use bitfields in state machines' in the TargetLink Main Dialog Tab 'Advanced' is selected.
% The check result is passed if all failed cases do not apply.
%
% FIX ACTION:
% ===========
% The option 'Use bitfields in state machines' in the TargetLink Main Dialog Tab 'Advanced' is unselected.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:31CEST $
% Revision:     $Rev: 15223 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_cgtl_4112(system, cmd_s)










































































































