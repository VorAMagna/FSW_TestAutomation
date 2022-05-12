%% Dead Zone block: Prohibited input signals
%
% [result, cr_items, r_stats] = mes_proxi_0014(system, cmd_s, reg, s_regerr)
%
% SHORT DESCRIPTION:
% ==================
% Dead Zone blocks must not have vector signals (one-dimensional signal 
% arrays) as well as busses containing more than one signal as input
% signals.
%
% NOTE:
% =====
% Regarding a detailed documentaion of this proxi look into the 
% documentation of the check, which calls this proxi.
%
% CALLED BY:
% ==========
% mes_mr1050_b
% mes_ds_0021
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:31CEST $
% Revision:     $Rev: 6559 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_proxi_0014(system,cmd_s,reg, s_regerr,uff)























































































































































