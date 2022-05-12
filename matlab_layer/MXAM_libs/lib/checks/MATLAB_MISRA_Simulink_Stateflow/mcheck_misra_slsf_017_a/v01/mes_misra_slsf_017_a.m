% MES check: misra_slsf_017_a - unconnected blocks
%
% function [result,cr_items,r_stats]=mes_misra_slsf_017_a(system,cmd_s)
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
% misra_slsf_017 Unconnected blocks, signal lines and busses.
% Part A)  A model must contain no unconnected blocks. All unused
% input and output ports must be connected to 'ground' and 'terminator
% blocks respectively.
% Notes: 
% - This check detects also un- or only partially connected bus selector 
%   and bus creator blocks. 
% - See mxam check misra_slslf_017_b for part B of this misra guideline,
%   checking unconnected signal and bus lines.
%
% RATIONALE
% =========
% The use of 'terminator' and 'ground' blocks indicates that the ports are
% intentionally not used.
% If it is expected that all connections in a model are complete, genuine
% connection problems will be easier to identify.
%
% PASS CRITERIA:
% ===================
% A pass is given if all the input and output ports are connected with other blocks.
% If applied to a library, a 'pass' is returned without any checking.
%
% SOLUTION
% ========
% Connect all inports with ground blocks and outports with terminator blocks 
% Use the repair option of this check to repair the found rule violations.
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% version:      $Rev: 6356 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_017_a(system, cmd_s)



































