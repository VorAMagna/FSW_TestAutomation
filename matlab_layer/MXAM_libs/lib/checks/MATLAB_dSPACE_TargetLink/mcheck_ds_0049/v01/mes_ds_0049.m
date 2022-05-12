% MES check: ds_0049 - Limitations with regard to the Bus Creator block
%
% function [result,cr_items,r_stats] = mes_ds_0049(system, cmd_s)
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
% ds_0049 - Limitations with regard to the Bus Creator block
%
% The Output as nonvirtual Bus option of the Bus Creator block must not be
% used in TargetLink versions before TargetLink 3.0.
%
% The option serves to specify nonvirtual buses, which were introduced with
% Release R14 but are currently not supported by TargetLink.
%
% PASS CRITERIA:
% ==============
% In TargetLink versions before TargetLink 3.0, each Bus Creator block
% whose option "Output as nonvirtual bus" is deselected will receive a
% pass. In TargetLink versions after TargetLink 3.0, check is not applied.
%
% FAIL CRITERIA:
% ================
% In TargetLink versions before TargetLink 3.0,each Bus Creator block whose
% option "Output as nonvirtual bus" is selected will receive a fail.
%
% FIX ACTION:
% ===========
% The option "Output as nonvirtual bus" of Bus Creator block will be deselected.
% 
% CHECK PARAMETERS:
% =================
% dSPACE.SettingsOfBuscreatorBlock:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'NonVirtualBus','off'}
%   DESCRIPTION:
%       Settings of Bus options. Each row represents a key-value
%       pair. First column is the key, second column the value.        
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:16CEST $
% Revision:     $Rev: 7185 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0049(system, cmd_s) %#ok<INUSD>
















































































