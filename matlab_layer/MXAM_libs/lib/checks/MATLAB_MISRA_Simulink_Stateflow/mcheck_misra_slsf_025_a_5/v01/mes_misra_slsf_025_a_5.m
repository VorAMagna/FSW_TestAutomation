%% Simulink Subsystems: Sufficient Size to display Portnames
%
% [result,cr_items,r_stats] = misra_slsf_025_a_5(system, cmd_s)
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
% Guideline Rule ID: MISRA AC SLSF 025 A (3.4.7)
%
% DESCRIPTION:
% ============
% Blocks that have multiple inputs or outputs - these must be sized such
% that port names or signal labels do not overlap.
%
% PASS/FAIL CRITERIA:
% ===================
% If portnames of a subsystem overlap each other, this subsystem receives a
% fail.
%
% SOLUTION:
% =========
% Change the size of subsystem, such that its port name is shown completely.
%
% FIX OPERATION:
% ==============
% The size of subsystems will be changed such that their port names will be
% shown clearly.
% 
% CHECK PARAMETERS:
% =================
% No parameters are used.
% 
% NOTE:
% =====
% - Other parts of MISRA AC SLSF 025 A are checked by misra_slsf_025_a_[i]
% - To check for block labels, use misra_slsf_025_a_6
% - As the position of signal labels could not be determined automatically,
%   this part is not checked. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:15CEST $
% Revision:     $Rev: 6179 $
% *************************************************************************

function [result,cr_items,r_stats]= mes_misra_slsf_025_a_5(system,cmd_s,reg, s_regerr)
















































