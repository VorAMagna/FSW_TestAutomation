%% Switch-Case Blocks: Default Path
%
% [result,cr_items,r_stats] = mes_sdt_ic003(system,cmd_s)
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
% Release 1.7 (21 June 2013)
% Corresponding Guideline: 2.3 
%
% DESCRIPTION:
% ============
% The "Show default case" option for the Simulink Switch-Case block 
% should be set, and the default case and else outputs must be properly 
% connected. 
%
% PASS/FAIL CRITERIA:
% ===================
% A pass is given to Switch-Case blocks, if 
% - option 'Show default case' is enabled and
% - default path is connected to any block but a terminator block
% 
% SOLUTION: 
% =========
% Set option 'Show default case' for each Switch-Case block and each If
% block. 
% Make sure, that the default path are connected. 
%
% FIX OPERATION:
% ==============
% The parameter 'Show default case' of Switch Case blocks will be set.
% 
% CHECK PARAMETERS:
% =================
% No parameters are used. 
% 
% NOTE:
% =====
% - All switch case instructions in the generated code should have 
%   a default branch to avoid undefined states during program execution   
% - For unconnected default/else paths,  there is no fix action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:00CEST $
% Revision:     $Rev: 7017 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_sdt_ic003(system,cmd_s)






































































































































