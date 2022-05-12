%% Stateflow Transitions and States: Execution Order
%
% [result, cr_items, r_stats] = mes_misra_slsf_034_b(system, cmd_s, reg, s_regerr)
%
% MES CHECK: 
% ==========
% User definition of transition execution order from junctions and states
% must not be enabled(release 14 and later)
%
% PASS/FAIL CRITERIA
% ==================
% If stateflow property UserSpecifiedStateTransitionExecutionOrder is
% 'off', the chart gets a pass, otherwise, a fail will be given.
%
% FIX ACTION
% ==========
% The "UserSpecifiedStateTransitionExecutionOrder" option will be set to
% 'off'
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% date:         $Date: 2020/07/31 16:04:23CEST $
% version:      $Rev: 14926 $
% ***********************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_034_b(system, cmd_s, reg, s_regerr)










































