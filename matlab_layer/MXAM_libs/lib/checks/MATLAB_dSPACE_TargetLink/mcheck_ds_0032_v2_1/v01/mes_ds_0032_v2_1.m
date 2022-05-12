%% Restrictions with Regard to the Math Function Block
%
% [result,cr_items,r_stats] = mes_ds_0032_v2_1(system, cmd_s)
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
% dSpace - Modeling Guidelines for MATLAB/Simulink and TargetLink
% Version 2.1
% TargetLink Product Management
% Guideline Rule ID: 2.7.5
%
% DESCRIPTION:
% ============
% For Math function block, the Function: magnitude^2 option should not be specified. The 
%   Function: square option should be used as an alternative. 
%
% PASS/FAIL CRITERIA:
% ===================
% A pass is given to every Math Block which does not use the
% 'magnitude^2' option for parameter 'Function'.
%
% SOLUTION:
% =========
% Do not use 'magnitude^2' option for parameter 'Function'. You can change
% it by using the GUI of the block or by using the Simulink API
% (parameter 'Function')
%  
% FIX ACTION:
% ===========
% The option of parameter 'Function' of Math blocks will be set to 'square'.
%
% CHECK PARAMETERS:
% =================
% No parameters
%
% NOTE:
% =====
% - The option is not supported by TargetLink.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:10CEST $
% Revision:     $Rev: 7176 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_ds_0032_v2_1(system, cmd_s)




















































