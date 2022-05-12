% MES check: misra_slsf_043_a - Transitions. 
% A) Forbidden combination of condition actions and transition actions within a state machine.
%
% function [result,cr_items,r_stats] = mes_misra_slsf_043_a(system, cmd_s)
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
% misra_slsf_043_a - Transitions
% Part A) Forbidden combination of condition actions and transition actions
%         within a state machine.
%
% Condition actions and transition actions must not be combined within a
% state machine.
%
% Rationale:
% The two types of action operate in different ways that are likely to be 
% overlooked.
% 
% PASS CRITERIA:
% ================
% All charts in the current model belonging to the same state machine, 
% are required to use only condition actions or only transition actions, but
% not both types of actions. In the latter case, a fail is raised for the
% model.
% For every failed state machine, two exemplary failures are reported:
% a) the first transition using a  condition action
% b) the first transition using a transition action
% 
% Note: if charts of state machines external to the current model are 
% included (i.e. from a library), only the inlcuded charts are tested.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:33CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_043_a(system, cmd_s) %#ok<INUSD>



























































































































































