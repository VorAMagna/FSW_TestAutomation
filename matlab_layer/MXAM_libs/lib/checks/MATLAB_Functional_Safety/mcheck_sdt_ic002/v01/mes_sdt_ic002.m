%% Conditional Subsystems: Initial value of the Output 
%
% [result,cr_items,r_stats]=mes_sdt_ic002(system,cmd_s)
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
% REFERENCED GUIDELINE:
% =====================
% MES Functional Safety Guidelines
% Release 1.7 (21 June 2013)
% Corresponding Guideline: 2.3
%
% DESCRIPTION:
% ============
% a) The initial output of outports in conditional subsystems should be
% specified.
% b) Diagnostic Setting 'Check undefined subsystem initial output' should
% be set.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes the Model Configuration Parameters and each Outport block in the model:
% Failed 1: The diagnostics setting 'Check undefined subsystem initial output' is not set.
% Failed 2: The Outport block contained in a conditional subsystem has no specified initial output.
% The check result is passed if all failed cases do not apply.
%
% SOLUTION:
% =========
% Explicitely define an initial output for each conditionally executed
% subsystem.
%
% FIX OPERATION:
% ==============
% No automatic fix available
%
% CHECK PARAMETERS:
% =================
% SDT.ic002.IgnoreCheckInitialOutput:
%   DATATYPE:
%       boolean
%   DEFAULT VALUE:
%       false (0)
%   DESCRIPTION:
%       If true, checking of diagnostic option 'Check undefined subsystem
%       initial output' will be ignored.
%
% SDT.ic002.AllowCheckTriggerSource:
%   DATATYPE:
%       boolean
%   DEFAULT VALUE:
%       false (0)
%   DESCRIPTION:
%       If true, allows Trigger ports as source for outputs of conditional
%       subsystems.
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
% Revision:     $Rev: 15570 $
% *************************************************************************

function [result,cr_items,r_stats]=mes_sdt_ic002(system, cmd_s)















































































































































































































