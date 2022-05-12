%% Simulink blocks: Overlapping block labels
%
% [result,cr_items,r_stats] = misra_slsf_025_a_6(system, cmd_s)
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
% Guideline Rule ID: MISRA AC SLSF 025 (3.4.7)
%
% DESCRIPTION:
% ============
% Blocks that have multiple inputs or outputs - these must be sized such
% that port names or signal labels do not overlap.
%
% PASS/FAIL CRITERIA:
% ===================
% A Fail is given if block name is overlapped by other blocks.
%
% SOLUTION:
% =========
% Reposition the blocks.
%
% FIX OPERATION:
% ==============
% Not automatically fix available.
% 
% CHECK PARAMETERS:
% =================
% No parameters are used.
% 
% NOTE:
% =====
% - Other parts of MISRA AC SLSF 025 A are checked by misra_slsf_025_a_[i]
% - Too check for port names, use misra_slsf_025_a_5
% - As the position of signal labels could not be determined automatically,
%   this part is not checked. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:16CEST $
% Revision:     $Rev: 6180 $
% *************************************************************************

function [result,cr_items,r_stats]= mes_misra_slsf_025_a_6(system,cmd_s,reg, s_regerr)










































