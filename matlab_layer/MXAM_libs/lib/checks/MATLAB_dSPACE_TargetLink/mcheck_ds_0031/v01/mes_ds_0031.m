% MES check: ds_0031 - Limitations with regard to the Sum Block
%
% function [result,cr_items,r_stats] = mes_tl_0011(system, cmd_s)
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
% ds_0031 - Limitations with regard to the Sum Block
%
% The Icon shape: rectangular option should be used for the Block
% Parameters of the Sum block.
%
% Remark:  Round icon shapes for the Sum block are transformed into
% rectangular shapes during conversion from Simulink to TargetLink. 
% On some occasions, this can lead to improper connections.
%
% PASS CRITERIA:
% ================
% A pass is given to every Sum block which uses the rectangular 
% option for the property 'Icon shape'.
%
% FAIL CRITERIA:
% ================
% A fail is given to every Sum block which uses the round option for the
% property 'Icon shape'.
%
% FIX ACTION:
% ===========
% The property "Icon shape" of sum blocks will be set to "rectangular".
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:10CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0031(varargin) %#ok<INUSD>












































