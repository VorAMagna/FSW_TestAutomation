% MES check: misra_slsf_017_b - Unconnected signal lines
%
% function [result,cr_items,r_stats]=mes_misra_slsf_017_b(system,cmd_s)
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
% misra_slsf_017 Unconnected blocks,signal lines and busses.
% Part B) A model must contain no unconnected signal lines or busses.
% Signal and lines (including bus signals) should be connected with source
% and destination blocks. Unconnected signal lines (having neither source
% nor destination blocks) should be deleted.
% See mxam check misra_slsf_017_a for block ports, which also detects
% partially connected signals.
%
% PASS/FAIL CRITERIA:
% ===================
% A pass is given if all signal lines and buses are connected to source
% and destination block.
% Note: partially connected lines are found by mxam check misra_slsf_017_a.
%
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% version:      $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_017_b(varargin) %#ok<INUSD>



































