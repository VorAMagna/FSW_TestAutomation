%%  Stateflow port names
%
% [result,cr_items,r_stats] = mes_db_0123(system, cmd_s)
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
% Control Algorithm Modeling Using Matlab,Simulink, and Stateflow
% Version 3.0
% MathWorks Automotive Advisory Board (MAAB)
% Guideline Rule ID: db_0123 (8.1.1.)
%
% DESCRIPTION:
% ============
% The name of a Stateflow input/output should be the same as the 
% corresponding signal.
% Exception: Reusable Stateflow blocks may have different port names.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each Stateflow Chart in the model that does not originate from a library.
% 
%     Failed 1: The names of the inputs of the Stateflow Chart do not correspond to the respective names of the input signals.
%     Failed 2: The names of the outputs of the Stateflow Chart do not correspond to the respective names of the output signals.
% 
% The check result is passed if all failed cases do not apply. 
%
% SOLUTION:
% =========
% Rename the inputs and outputs of Stateflow Charts according to the corresponding signal names.
%
% FIX OPERATION:
% ==============
% No automatic fix available. 
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:19CEST $
% Revision:     $Rev: 7392 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0123(system, cmd_s)




































