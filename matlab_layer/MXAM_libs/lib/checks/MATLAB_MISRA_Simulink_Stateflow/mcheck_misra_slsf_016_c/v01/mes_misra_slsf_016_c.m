%% Busses-part c
%
% [result,cr_items,r_stats] = mes_misra_slsf_016_c(system, cmd_s)
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
% A bus must not contain unnamed signals.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each signal in a Bus Creator block.
% 
% Failed: If the signal is not named.
% The check result is passed if the failed case does not apply. 
%
% SOLUTION:
% =========
% Rename each bus signal of a bus creator such that the bus signal names
% are unique within the bus creator.
%
% FIX OPERATION:
% ==============
% No automatic fix available.
%
% CHECK PARAMETERS:
% =================
% No parameters are used. 
% 
% NOTE:
% =====
% Only busses are considered.  
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:08CEST $
% Revision:     $Rev: 15479 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_016_c(system, cmd_s)





















































































