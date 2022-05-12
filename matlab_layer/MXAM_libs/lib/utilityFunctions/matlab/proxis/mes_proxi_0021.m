%% Use of data types for Multiport Switch block
%
% [result, cr_items, r_stats] = mes_proxi_0021(system, cmd_s, reg, s_regerr)
%
% SHORT DESCRIPTION:
% ==================
% The first input (control port) of the Multiport Switch block should be
% driven by a signal with an unsigned integer data type.
% The input signal of the control port has to be non-negative and is cast
% to an integer number by Simulink during the simulation.
%
% NOTE:
% =====
% Regarding a detailed documentation of this proxi look into the
% documentation of the check, which calls this proxi.
%
% CALLED BY:
% ==========
% mes_misra_tl_5_7
% mes_ds_0107
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result, cr_items, r_stats] = mes_proxi_0021(system, cmd_s, reg, s_regerr)















































































































































































































































