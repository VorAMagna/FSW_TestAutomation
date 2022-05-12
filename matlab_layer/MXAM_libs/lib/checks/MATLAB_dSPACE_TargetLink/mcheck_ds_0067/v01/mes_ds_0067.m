% MES check: ds_0067 - Arrays at Interfaces of Graphical Functions
%
% function [result,cr_items,r_stats] = mes_tl_0037(system, cmd_s)
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
% ds_0067 - Arrays at Interfaces of Graphical Functions
%
% Graphical Functions can only be used in conjunction with scalar input and
% output signals. Vectors and matrices are not supported as 
% interface variables.
%
% This check requires the model to be in COMPILE MODE!
%
% PASS CRITERIA:
% ================
% Graphical Functions which use scalar input and output signals pass.
%
% FAIL CRITERIA:
% ================
% Graphical Functions whose "CompiledSize" of any data objects within the
% Graphical Funcion is greater than one.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:21CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0067(system, cmd_s) %#ok<INUSD>









































































































