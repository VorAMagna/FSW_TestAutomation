% MES check: misra_slsf_0043_b - Transitions. B) Avoidance of transition actions
%
% function [result,cr_items,r_stats] = mes_misra_slsf_043_b(system, cmd_s)
%
% RETURN PARAMETERS:
% ==================
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items 
%
% INPUT PARAMETERS:
% =================
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>, for details See also mes_jc_0061
%
% MES CHECK: 
% ==========
% misra_slsf_043_b - Transitions. Part B) Avoidance of transition actions
%
% Transition actions shall be avoided.
%
% Rationale:
% Stateflow offers state-actions(entry,during and exit), condition-action
% and transition-actions. When nagivating from one state to another it is
% difficult to determine in what order there actions occur; therfore the
% preferred method of specifying actions is condition actions which are
% executed when a transition is nagivated and is not ambiguous.
% A transition action is only executed after a source state is exited and
% beofore the destination state is reached. They are not executed when the
% transition is nagivated; whereas condition actions are executed when the
% transition actions can be achieved with condition actions.
%
% PASS CRITERIA:
% ================
% Charts using no transition actions receive a pass.
% 
% FAIL CRITERIA:
% ================
% Each chart (be it pure flowchart or a state machine) which uses 
% transition actions within transition labels receives a fail.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:33CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_043_b(varargin) 

































