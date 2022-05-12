%% Avoidance of Implicit Saturation in TargetLink blocks
%
% [result,cr_items,r_stats] = mes_tl_001(system, cmd_s)
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
% TargetLink blocks and TargetLink properties of Stateflow objects that can be
% configured to saturate on overflow must not have TargetLink's 'Saturate' option
% selected. Instead, saturation shall be made explicit by using sufficiently
% large output data types and by adding a subsequent Saturation block.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each TargetLink block and each Stateflow object that 
% has the TargetLink 'Saturate' option.
%  - Failed 1: The option is selected for the TargetLink block.
%  - Failed 2: The option is selected for the Stateflow object.
% The check result is passed if all failed cases do not apply.
%
% FIX OPERATION:
% ==============
% No automatic repair action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result,cr_items,r_stats] = mes_mes_tl_001(system,cmd_s)































































































































































































