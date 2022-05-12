% MES check: misra_slsf_018 - Usage of "from" and "goto" Blocks - Tag (Goto)
%
% OUTPUT PARAMETERS:
% ==================
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistic s on the check result
%
% INPUT PARAMETERS:
% =================
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>, for details See also mes_jc_0061
%
% REFERENCED GUIDELINE:
% =====================
% MISRA AC SLSF - Modeling design and style guidelines for the application
% of Simulink and Stateflow
% Version 1.0
% The Motor Industry Software Reliability Association
% Guideline Rule ID: MISRA AC SLSF 018 B (3.4.11)
%
% DESCRIPTION:
% ==========
% The Tag of "from" and "goto" blocks must match the corresponding signal label or bus label.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each Goto block in the model.
%    Failed 1: The signal to the Goto block does not have a name or an inherited name and the check parameter MISRA_SLSF.mes_misra_slsf_018_b_1.CreateFindingEmptySignal is set to true (default).
%    Failed 2: The Tag of the Goto block does not match the name of its input signal.
% The check result is passed if all failed cases do not apply.
%
% CHECK PARAMETER:
% ===================
% Set the check parameter
% MISRA_SLSF.mes_misra_slsf_018_b_1.CreateFindingEmptySignal to 'true' so that the
% check creates a finding for empty name signals. Set it to 'false' so that
% the check gives no findings for empty name signals.
%
% SOLUTION:
% =========
% Match the Tag of Goto block and the signal label of input signal to Goto block.
%
% REPAIR ACTION:
% ===========
% No automatic repair action available.
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% version:      $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_018_b_1(system,cmd_s,reg,s_regerr)







































































































