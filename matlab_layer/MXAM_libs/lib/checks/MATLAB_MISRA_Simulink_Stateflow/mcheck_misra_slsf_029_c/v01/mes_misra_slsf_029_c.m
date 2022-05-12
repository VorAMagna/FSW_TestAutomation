%% Signal and bus line positioning,  Part3: Crossings
%
% [result,cr_items,r_stats]=mes_misra_slsf_029_c(system,cmd_s)
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
% MISRA AC SLSF - Modelling design and style guidelines for the application
% of Simulink and Stateflow
% Version 1.0 
% The Motor Industry Software Reliability Association
% Guideline Rule ID: MISRA AC SLSF 029 (3.4.11)
%
% DESCRIPTION:
% ============
% Signal lines 
% All signal and bus lines must not cross any Simulink block, subsystem or label. 
%
% PASS/FAIL CRITERIA:
% ===================
% A signal line receives an error if it crosses a block.
% The check result is passed if the failed case does not apply.
%
% SOLUTION:
% =========
% Change the position of the block, so that its signal line does not cross any other block.
%
% FIX ACTION:
% ===========
% No automatic fix available.
%
% CHECK PARAMETERS:
% =================
% No parameter
%
% NOTE:
% =====
% - This check is one of three checks, that all together cover guideline
% misra_slsf_029. Its strongly recommended first to run check 
% misra_slsf_029_af and then misra_slsf_029_be (overlapses) and 
% misra_slsf_029_c (crossings).This might reduce the workload for 
% misra_slsf_029_be and misra_slsf_029_c significantly.
% - Corresponding guideline demands, that signals should not cross labels.
% This is not possible to check. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:21CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_029_c(system, cmd_s)

















































