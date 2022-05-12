% MES check: misra_slsf_015_b -  Vector and matrix signals--part b
%
% function [result,cr_items,r_stats] = mes_misra_slsf_015_b(system, cmd_s)
%
%
% MES CHECK: 
% ==========
%
% misra_slsf_015_b -  Vector and matrix signals--part b
% 
% A matrix signal must only be created either by feeding individual vector
% signals into a matrix concatenation block, or a matrix constant, or by
% Stateflow block.
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
% A Fail is given if a matrix signal is not from a concatenation constant
% block or stateflow block.
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% date:         $Date: 2020/07/31 16:04:06CEST $
% version:      $Rev: 15479 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_015_b(system, cmd_s)









































































































































