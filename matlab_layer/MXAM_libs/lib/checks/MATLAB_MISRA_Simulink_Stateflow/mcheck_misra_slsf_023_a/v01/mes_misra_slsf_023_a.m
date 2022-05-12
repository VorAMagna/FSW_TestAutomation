%% Color of blocks
%
% [result,cr_items,r_stats] = mes_misra_slsf_023_a(system, cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistic s on the check result
% for details use 'open mes_check_info'
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>, 
% for details use 'open mes_check_info'
%
% DESCRIPTION:
% ============
% All blocks in a model should have a black foreground and white background.
% exceptions:
% �  Blocks that are defined in the default Simulink libraries that have black
% filled backgrounds
% �  3rd Party blocks
% �  Graphical Subsystem Masks
%
% PASS/FAIL CRITERIA:
% ===================
% A block receives a fail if it does not have black foreground and white
% background color.
%
% SOLUTION:
% =========
% For each block set the foreground color on black and the background color
% on white.
%
% FIX OPERATION:
% ==============
% 
%
% CHECK PARAMETERS:
% =================
% No parameters needed.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:13CEST $
% Revision:     $Rev: 15479 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_023_a(system,cmd_s)















































