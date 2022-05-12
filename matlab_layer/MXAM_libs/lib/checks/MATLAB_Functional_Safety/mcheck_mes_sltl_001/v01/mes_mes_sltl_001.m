%% Magic Constants in Constant blocks
%
% [result,cr_items,r_stats] = mes_mv_001(system, cmd_s)
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
%
% DESCRIPTION:
% ============
% The value of a Constant block must be entered as a named constant or
% variable. Expressions entered as value in a Constant block must not contain numerical values.
% exceptions: The values 0 and 1 are allowed.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each Simulink and TargetLink Constant block in a model.
%     Failed 1: If the value of the Constant block is a numerical value and no named constant.
%     Exception: The values 0 and 1 are allowed.
%     Failed 2: If the value of the Constant block is an expression containing numerical values.
% The check result is passed if the failed cases do not apply.
%
% FIX ACTION:
% ==============
% No automatic repair option available.
%
% CHECK PARAMETERS:
% =================
% SDT.mes_sltl_001.DataTypes
% 'all' - All numerical values are considered.
% 'integer' - Only integer values are considered.
% 'float' - Only float values are considered. 
% Note: If the check parameter SDT.mes_sltl_001.CheckExpressions is set to
% '1', expressions with numerical values will issue a failed in every case.
%
% SDT.mes_sltl_001.CheckExpressions
% 1 - Expressions entered as value in Constant blocks are checked regarding magic constants.
% 0 - Expressions entered as value in Constant blocks are not checked.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:02:58CEST $
% Revision:     $Rev: 7355 $
% *************************************************************************

function [result,cr_items,r_stats]=mes_mes_sltl_001(system,cmd_s)








































































































































































