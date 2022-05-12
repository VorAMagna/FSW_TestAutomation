%% Tolerance Value of TargetLink Constant and Gain Block
% function [result,cr_items,r_stats] = mes_mes_cgtl_4101(system, cmd_s)
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
% mes_cgtl_4101
%
% DESCRIPTION:
% ============
% If the class defined for the output value of a TargetLink Constant block 
% or a TargetLink Gain block is set to default, a tolerance value can be 
% specified. The default configuration sets this option to 1
% This value defines the maximum deviation (in percent) with which the variable is to be implemented.
% 
% To ensure that the code generator does not optimize the output of a TargetLink
% Constant block or a TargetLink Gain block, the value of the Tolerance option should be set to 0%. 
% 
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each TargetLink Constant and Gain block.
% Failed: if the tolerance value is not set to 0.
% The check result is passed if the failed case does not apply. 
% %
% SOLUTION:
% =========
% Set the option 'tolerance' of all TL blocks 'Constant' and 'Gain' to 0.
%
% FIX OPERATION:
% ==============
% The fix sets the option of all TL blocks 'Constant' and 'Gain' to 0.
%
% CHECK PARAMETERS:
% =================
% No parameters needed.
%
% PUBLIC INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions GmbH
% Date:         $Date: 2020/07/31 16:03:50CEST $
% Revision:     $Rev: 15194 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_mes_cgtl_4101(system, cmd_s)









































