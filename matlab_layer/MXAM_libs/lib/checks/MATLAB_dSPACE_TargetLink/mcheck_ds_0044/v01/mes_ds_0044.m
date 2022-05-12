% MES check: ds_0044 - Restrictions with Regard to the Merge Block
%
% function [result,cr_items,r_stats] = mes_ds_0044(system, cmd_s) 
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
% ds_0044 - Restrictions with Regard to the Merge Block
%
% The Allow unequal port widths parameter must not be checked for the Merge block.
% 
% Remark: TargetLink does not support the option for the reason of code efficiency. 
%
% PASS CRITERIA:
% ================
% A pass is given to every Merge block whose 'Allow unequal port widths' 
% parameter is NOT checked.
%
% FAIL CRITERIA:
% ================
% A pass is given to every Merge block whose 'Allow unequal port widths' 
% parameter is checked.
%
% FIX ACTION:
% ===========
% The parameter "Allow unequal port widths" of Merge blocks will be set to 'off'.
% 
% CHECK PARAMETERS:
% =================
% dSPACE.SettingsOfMergeBlock:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE: 
%       {'AllowUnequalInputPortWidths','off'}
%   DESCRIPTION:
%       Settings of Merge block options. Each row represents a key-value
%       pair. First column is the key, second column the value. 
% 
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:15CEST $
% Revision:     $Rev: 6835 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0044(system, cmd_s) %#ok<INUSD>
























































































