%% Annotation appearance
%
% [result,cr_items,r_stats] = mes_misra_slsf_024_a(system, cmd_s)
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
% Drop shadow must not be enabled on any blocks. Exception: third party library
% blocks.
%
% PASS/FAIL CRITERIA:
% ===================
% For blocks with option 'Show drop Shadow', the check will give a fail.
%
% SOLUTION:
% =========
% Use the option 'Hide Drop Shadow' for all blocks.
%
% FIX OPERATION:
% ==============
% The fix-option sets the option 'Hide Drop Shadow' for all blocks.
%
% CHECK PARAMETERS:
% =================
% No parameters needed.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:14CEST $
% Revision:     $Rev: 15479 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_024_a(system,cmd_s)









































