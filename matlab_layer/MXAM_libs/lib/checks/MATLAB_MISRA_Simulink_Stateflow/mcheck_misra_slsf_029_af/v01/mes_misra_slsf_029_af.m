%% Signal and bus line positioning, Part 1: Branchings and diagonal signal lines
%
% [result,cr_items,r_stats]=mes_misra_slsf_029_af(system,cmd_s)
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
% Guideline Rule ID: MISRA AC SLSF 029 (3.4.11)
%
% DESCRIPTION:
% ============
% Signals lines 
% - are drawn with right angles
% - split not into more than two sublines. If they split into two sublines,
% these sublines must not originate in the opposite or same direction.
%
% PASS/FAIL CRITERIA:
% ===================
% A signal line receives a fail if 
% - it is drawn diagonal
% - is splits into more than 2 sublines
% - sublines originating in one branching point in opposite or same 
%   direction
%
% SOLUTION:
% =========
% Change the layout of your model.
%
% FIX ACTION:
% ===========
% No automatic fix available.
%
% CHECK PARAMETERS:
% =================
% No parameters
%
% NOTE:
% =====
% - This check is one of three checks, that all together cover guideline
% misra_slsf_029. Its strongly recommended first to run this check 
% misra_slsf_029_af and then misra_slsf_029_be (overlapses) and 
% misra_slsf_029_c (crossings).
% This might reduce the workload for misra_slsf_029_be and misra_slsf_029_c 
% significantly.
% 
% PUBLISHING INFORMATION
% *************************************************************************
% copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:20CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_029_af(system, cmd_s)


















































