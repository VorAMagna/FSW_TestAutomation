%% Multiport Switch Block - Control Input
%
% [result,cr_items,r_stats] = mes_misra_slsf_013_b(system,cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistic s on the check result
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>
%
% MES CHECK:
% ==========
% mes_misra_slsf_013_b - Use of Multiport Switch Block
%
% The control input into the "multiport switch" block must be an unsigned
% integer.
%
% RATIONALE:
% ==========
% Together with MISRA AC SLSF 013C the A, B part of the guideline ensures
% correct behaviour of the "multiport switch" block and the model under all
% circumstances; i.e. no negative or non integer numbers, as the "multiport
% switch" block does not support a default path.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each Multiport Switch block if its control input has an unsigned integer data type.
% 
%     Failed 1: The control input is not connected.
%     Failed 2: The control input has the variable class 'default' and no data type set.
%     Failed 3: The control input does not have an unsigned integer data type.
%     Review 4: The data type of the control input is an enumeration type.
%     Warning 5: The control input cannot be determined.
% 
% The check result is passed if all failed, review, and warning cases do not apply.
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:06CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_013_b(system,cmd_s)








































































































































