%% Model information
%
% [result,cr_items,r_stats] = mes_misra_slsf_022_b(system, cmd_s)
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
% GUIDELINE:
% ==========
% Document: MISRA AC SLSF Version 1.0 (2009)
% Guideline ID: MISRA AC SLSF 0022, Part B
%
% DESCRIPTION:
% ============
% The top-level model must contain a tool information block specifying the
% Simulink and Stateflow versions that were used to create and validate the model.
% Note: This information should be displayed using a model information block
%
% PASS/FAIL CRITERIA:
% ===================
% If there is a model info block on the top level of the model with
% information about the Matlab, Simulink and Stateflow version, the check
% will give a pass.
% 
% SOLUTION:
% =========
% Use the model info block on the top level of the model with information
% about the Matlab, Simulink and Stateflow Information.
%
% FIX OPERATION:
% ==============
% No fix.
%
% CHECK PARAMETERS:
% =================
% MISRA_SL_SF.misra_slsf_022_b.Tools
% DATATYPE: 
%       cellstring
% DEFAULT VALUE:
% {'Matlab','Simulink','Stateflow'}
% DESCRIPTION: 
% List of tools whose version information will be verified by the check.
% Syntax-{'tool1,'tool2',....'toolN'}
% 
% NOTE:
% =====
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:13CEST $
% Revision:     $Rev: 15479 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_022_b(system,cmd_s)
































