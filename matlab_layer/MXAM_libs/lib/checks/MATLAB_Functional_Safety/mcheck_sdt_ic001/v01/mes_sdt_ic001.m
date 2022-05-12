%% Merge Blocks: Initial value of the Output
%
% [result,cr_items,r_stats]=mes_sdt_ic001(system,cmd_s)
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
% MES Functional Safety Guidelines
% Release 1.7 (21 June 2013)
% Corresponding Guideline: 2.3
%
% DESCRIPTION:
% ============
% For Simulink and TargetLink Merge blocks, an initial output must be
% explicitely specified. Inheriting the initial value by specifying '[]'
% is not allowed.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes the initial value of each Simulink and TargetLink
% Merge block in the model.
%     - Failed1: The Merge block specifies its initial output value as
%                '[]'.
% The check result is passed if all failed cases do not apply.
%
% SOLUTION:
% =========
% Explicitly define an initial output value for each Merge block.
%
% FIX OPERATION:
% ==============
% No automatic repair action available.
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% An undefined initial value may cause different simulation
% behavior between Simulink and TargetLink, because Simulink only
% propagates initial values if they are requested, whereas TargetLink
% always propagates initial values.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:00CEST $
% Revision:     $Rev: 6794 $
% *************************************************************************

function [result,cr_items,r_stats]=mes_sdt_ic001(system, cmd_s)
























































































