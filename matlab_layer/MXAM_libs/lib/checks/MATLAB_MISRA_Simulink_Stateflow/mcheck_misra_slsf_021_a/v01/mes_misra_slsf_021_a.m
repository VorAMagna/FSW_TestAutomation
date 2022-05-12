%% Annotation appearance
%
% [result,cr_items,r_stats] = mes_misra_slsf_021_a(system, cmd_s)
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
% DESCRIPTION:
% ============
% Annotations should not have drop shadow enabled. Exception: Third party
% library blocks.
%
% PASS/FAIL CRITERIA:
% ===================
% For annotations which have drop shadow enabled the check will give a
% fail.
%
% SOLUTION:
% =========
% Use the option 'Hide Drop Shadow' for annotations.
%
% FIX OPERATION:
% ==============
% The fix-option sets the option 'Hide Drop Shadow' for annotations.
%
% CHECK PARAMETERS:
% =================
% No parameters needed.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:12CEST $
% Revision:     $Rev: 15479 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_021_a(system,cmd_s) 









































