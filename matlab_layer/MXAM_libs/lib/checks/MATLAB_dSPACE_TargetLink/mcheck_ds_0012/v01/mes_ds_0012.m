% MES check: ds_0012 - Block Priorities
% 
% function [result,cr_items,r_stats] = mes_ds_0012(system, cmd_s)
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
% ds_0012 - Block Priorities
%
% Block priorities must not be used to specify the block execution order in
% Simulink (to be set via: Block Properities --> General --> Priority)
%
% The use of block priorities leads to an intransparent modeling style and
% is therefore not supported (ignored) by TargetLink.
%
% PASS CRITERIA:
% ================
% A pass is given to each block (subsystems included) for which the 
% block priority has NOT been set.
%
% FAIL CRITERIA:
% ================
% A fail is given to a block (subsystems included) for which a block 
% priority has been set.
%
% FIX ACTION:
% ===========
% The value of property "priority" of blocks and subsystems will be removed.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:04CEST $
% Revision:     $Rev: 15194 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0012(system, cmd_s)  %#ok<INUSD>






























































