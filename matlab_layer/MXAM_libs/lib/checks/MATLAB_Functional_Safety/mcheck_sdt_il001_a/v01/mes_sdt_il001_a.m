%% Avoidance of Duplicated Port Signals - Source Signal
%
% [result,cr_items,r_stats] = mes_sdt_il001_a(system, cmd_s)
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
% cmd_s     - check options, syntax /<key>:<val>
%
% REFERENCED GUIDELINE:
% =====================
% MES Functional Safety Guidelines
% Release 1.7 (21 June 2013)
% Corresponding Guideline: 2.4
%
% DESCRIPTION:
% ============
% The interface of a system must be as small as possible. To this end,
%     all Inports and Outports of a system must contain signals from different sources, and
%     shadow Inport blocks are not to be used.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes the Inports and Outports of each subsystem.
% 	Failed 1: Two or more Inports or two or more Outports in the subsystem have the same source signal. 
% 	Review 2: Two or more Inports or two or more Outports in the subsystem have a Merge, Switch, or MultiportSwitch block as source.
% The check result is passed if all failed cases do not apply.
%
% SOLUTION:
% =========
%	 Solution 1: Do not use more than one Inport or Outport for the same signal. 
% If a duplicate signal is needed, duplicate the signal within the system by creating a signal branch after the Inport. 
% Regarding Output signals, duplicate an outgoing signal outside of the system. 
% Further, remove any shadow Inport blocks and use signal branches instead.
% 	Solution 2: Review the concerning Inports or Outports if they have the same source signal. 
% If they have the same source signal, follow Solution 1.
%
% FIX OPERATION:
% ==============
% No automatically fix available.
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% If a Simulink Inport directly feeds into a single TargetLink Inport only
% the Simulink Inport is checked. Similarly, if a TargetLink Outport or bus
% Outport directly feeds into a Simulink Outport only the TargetLink Outport is checked.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions GmbH
% Date:         $Date: 2020/07/31 16:03:01CEST $
% Revision:     $Rev: 6794 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_sdt_il001_a(system,cmd_s)













































































































































































































































































































































































































































































































































