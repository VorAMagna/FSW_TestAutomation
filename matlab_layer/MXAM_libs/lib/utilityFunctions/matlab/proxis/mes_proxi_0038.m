%% From/Goto Blocks: General useage
%
% [result, cr_items, r_stats] = mes_proxi_0038(system, cmd_s, reg, s_regerr)
%
% SHORT DESCRIPTION:
% ==================
% From and Goto blocks must only be used on the same hierarchy level
% (local scope). The Tag of From and Goto blocks is the name of the
% corresponding signal or bus. The Tag visibility of a Goto block is
% set to 'local'. Tag of Goto blocks must be unique. (More than one
% From block can have same tag) Every Goto block must have one or more
% matching From block. Every From block must have exactly one matching
% goto block
%
% NOTE:
% =====
% Regarding a detailed documentaion of this proxi look into the 
% documentation of the check, which calls this proxi.
%
% CALLED BY:
% ==========
% mes_dcapt_jm_0009
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:34CEST $
% Revision:     $Rev: 6102 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_proxi_0038(system, cmd_s, reg, s_regerr)





























































































































































































































