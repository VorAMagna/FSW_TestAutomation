% MES check: ds_0037_b - Default output of Switch Case block must be
% properly connected
%
% function [result,cr_items,r_stats] = mes_ds_0037_b(system,cmd_s)
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
% ds_0037_b - Default output of Switch Case block must be properly
% connected
%
% This check tests whether the default output of the switch case block 
% is connected.
% Note: Only those blocks are checked, which have the option 'Show
% default case' enabled. 
%
% PASS/FAIL CRITERIA:
% ===================
% Checked are all Switch Case blocks which have the option
% 'Show default case' enabled.
% A pass is given to Switch Case blocks, if the default output is 
% connected, a fail otherwise.
%
% REFERENCE:
% ==========
% dSPACE Modeling guidelines for ML/SL/SF/TL, version 2.1
% chapter 2.10.2
% Note: this check only test compliance with the second
% criterion of the guideline.
%
% See also: mes_ds_0037_a
% 
% CHECK PARAMETERS:
% =================
% dSPACE.checkds0037b.CheckIfBlocks:
%   DATATYPE: 
%       boolean
%   DEFAULT VALUE:
%       true (1)
%   DESCRIPTION:
%       If true, also If blocks are checked. Otherwise only SwitchCases are
%       considered. 
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:13CEST $
% Revision:     $Rev: 6835 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0037_b(system,cmd_s) %#ok<INUSD>
















































































































