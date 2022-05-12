%% Diagnostic settings
%
% [result,cr_items,r_stats] = mes_misra_slsf_004_a(system, cmd_s)
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
% cmd_s     - check options, syntax /<key>:<val>,
%
% DESCRIPTION:
% ============
% For diagnostics settings in Simulink parameters dialog box see 
% "Simulink diagnostic configuration" in Appendix C of MISRA AC SLSF 1.0. 
% 
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes the value of each diagnostics configuration parameter 
% listed in Appendix C of the MISRA AC SLSF document.
%  - Passed: Each parameter is set as defined in the MISRA AC SLSF document.
% The check result is failed if all passed cases do not apply.
%
% FIX ACTION:
% ===========
% The automatic repair action sets each Diagnostics configuration parameter 
% to its correct value as defined in Appendix C of the MISRA AC SLSF document.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_004_a(system,cmd_s)

























































































