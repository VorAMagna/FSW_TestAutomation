% MES check: misra_slsf_016_d - Busses-part d
%
% function [result,cr_items,r_stats] = mes_misra_slsf_016_d(system, cmd_s)
%
%
% MES CHECK: 
% ==========
%
% misra_slsf_016_d -Busses--part d
% 
% A bus must only be operated on by bus capable Simulink blocks.
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
% A Fail is given if the input of a not bus capable block is a bus.
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% date:         $Date: 2020/07/31 16:04:08CEST $
% version:      $Rev: 15479 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_016_d(system, cmd_s)

























































































































































