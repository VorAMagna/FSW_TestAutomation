% MES check: misra_slsf_016_b - Busses-part b
%
% function [result,cr_items,r_stats] = mes_misra_slsf_016_b(system, cmd_s)
%
%
% MES CHECK: 
% ==========
%
% misra_slsf_016_b -  Busses--part b
% 
% All busses must be named.
%
% Rationale: to distinguish clearly between buses and all other signals
% carrying more than a single data element. This rule is designed to
% provide forward compatibility.
%
% CHECK PREREQUISITES:
% ====================
% The model is assumed to be in compiled mode.
%
% PASS/FAIL CRITERIA:
% ================
% A Fail is given if a bus signal has no name or propagated name.
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% date:         $Date: 2020/07/31 16:04:07CEST $
% version:      $Rev: 15479 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_016_b(system, cmd_s)





























































































































