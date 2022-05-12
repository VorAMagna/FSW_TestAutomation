%% Multiport Switch Block: Default path and restricted control input
%
% [result, cr_items, r_stats] = mes_proxi_0022(system, cmd_s, reg, s_regerr)
%
% SHORT DESCRIPTION:
% ==================
% The Multiport Switch blocks in Simulink and Targetlink do not support a
% default path.
% Proper behavior of the Multiport Switch block should be ensured by
% restricting the potential values of the control port (e.g. employ
% additional logic).
% Since matlab 2010b, the multiport switch blocks have default path, so
% that only the data type of the control signal is checked(must be
% integer).
%
% NOTE:
% =====
% Regarding a detailed documentaion of this proxi look into the
% documentation of the check, which calls this proxi.
%
%
% CALLED BY:
% ==========
% mes_misra_tl_5_6
% mes_ds_0047
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:31CEST $
% Revision:     $Rev: 14938 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_proxi_0022(system, cmd_s, reg, s_regerr, s_useMinmaxVar) %#ok<STOUT>












































































































































































































































































































