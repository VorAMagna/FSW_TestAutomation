%% Restrictions with Regard to the From and Goto Block
%
% [result,cr_items,r_stats] = mes_mes_slsf_4110(system, cmd_s)
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
% mes_slsf_4110 - Restrictions with Regard to the From and Goto Block
%   This check analyses if all "goto" blocks have the tag 'visibility' set
%   to 'local'.
% PASS/FAIL CRITERIA:
% ===================
% This check analyzes all "goto" blocks.
%
%     Failed 1: The tag visibility of "goto" blocks is not set to "local".
%
% The check result is passed if failed case do not apply.
%
% FIX ACTION:
% ===========
% Sets the tag visibility of 'Goto' blocks to 'local'.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:34CEST $
% Revision:     $Rev: 15223 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_slsf_4110(system, cmd_s)








































