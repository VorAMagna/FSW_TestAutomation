%% Simulink block From and Goto: Matching Sizes
%
% [result,cr_items,r_stats] = mes_misra_slsf_025_a_2(system, cmd_s)
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
% MISRA AC SLSF - Modeling design and style guidelines for the application
% of Simulink and Stateflow
% Version 1.0 
% The Motor Industry Software Reliability Association
% Guideline Rule ID: MISRA AC SLSF 025 A(3.4.7)
%
% DESCRIPTION:
% ============
% 'goto' and 'from' blocks manually and automatically generated may use a 
% size different from the default, e.g. to ensure the tags of “goto” and 
% 'from' blocks are readable (note: matching 'goto' and 'from' blocks 
% should be the same size).
%
% PASS/FAIL CRITERIA:
% ===================
% A Warning is given if matching 'from' and 'goto' have different size and do 
% not have default size (this is necessary, because per default 'from' and 
% 'goto' blocks do not have matching size)
% 
% SOLUTION:
% =========
% Use the default shape and size on all blocks
%
% FIX OPERATION:
% ==============
% No fix available. 
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% - Other parts of MISRA AC SLSF 025 A are checked by misra_slsf_025_a_[i]
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:14CEST $
% Revision:     $Rev: 6319 $
% *************************************************************************

function [result,cr_items,r_stats]= mes_misra_slsf_025_a_2(system,cmd_s,reg, s_regerr)





































































































































