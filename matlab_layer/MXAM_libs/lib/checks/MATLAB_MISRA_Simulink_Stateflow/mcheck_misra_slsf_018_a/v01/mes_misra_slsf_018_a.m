% MES check: misra_slsf_018 - Use of ''from'' and ''goto'' Blocks - Visibility
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
% Guideline Rule ID: MISRA AC SLSF 018 A (3.4.11)
%
% DESCRIPTION
% ==========
% The Tag visibility of a Goto block is set to 'local'.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each Goto block in the model.
% Failed 1: The tag visibility of the Goto block is Global or Scoped.
% The check result is passed if all failed cases do not apply.
%
% SOLUTION:
% =========
% Set the tag visibility of the Goto block to Local.
%
% FIX ACTION:
% ===========
% The automatic repair action sets the tag visibility of the Goto block to Local.
%
% CHECK PARAMETERS:
% =================
% No parameters
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% version:      $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_018_a(system,cmd_s)



































