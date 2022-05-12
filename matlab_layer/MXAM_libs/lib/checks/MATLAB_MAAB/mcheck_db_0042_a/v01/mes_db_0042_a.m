%% Port blocks in Simulink models: Position of Inports/Outports
%
% [result,cr_items,r_stats] = mes_db_0042_a(system, cmd_s)
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
% REFERENCED GUIDELINE:
% =====================
% Control Algorithm Modeling Using Matlab,Simulink, and Stateflow
% Version 3.0
% MathWorks Automotive Advisory Board (MAAB)
% Guideline Rule ID: db_0042 (7.1.3.)
%
% DESCRIPTION:
% ============
% In a Simulink model, the ports should comply with the following rules:
% - Inports should be placed on the left side of the diagram and should be
%   aligned
% - Outports should be placed on the right side of the diagramm and should
%   be aligned
%
% PASS/FAIL CRITERIA:
% ===================
% An inport block gets a fail, if its left edge is more 'right' than the
% left edge of the most left block, wich is not considered by this check
% (i.e. inport, outport, enable, trigger, action if all three parts are
% checked). The comparison is done by the x-ccordinate returned by the
% 'position' parameter of each block.
%
% An outport block gets a fail, if its right edge is more 'left' than the
% right edge of the most right block, wich is not considered by this check
% (i.e. inport, outport, enable, trigger, action if all three parts are
% checked). The comparison is done by the x-ccordinate returned by the
% 'position' parameter of each block.
%
% A subsystem gets a fail, if all contained inports (and outports) are not
% aligned from top to bottom. Alignment is interpreted as follows: The
% x-Position of the left edge of the most right inport differs only
% MAAB.db_0042_a.Tolerance pixel from the x-position of the left edge of 
% the  most left inport (the same is checked for outports).
%
% SOLUTION:
% =========
% Position inports and outports according to this guideline. 
%
% FIX OPERATION:
% ==============
% User has the possibility to chose one inport/outport, which becomes a
% reference block. Each other block of its kind is aligned with it. 
% 
% Fix does not check, if the users choice is correct in the sense of this
% guideline, so a rerun of this check is adviseable!
%
% CHECK PARAMETERS:
% =================
% MAAB.db_0042_a.IgnoredBlocks:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       {'EnablePort' '';
%        'TriggerPort' '';
%        'ActionPort' ''};
%   DESCRIPTION:
%       Each row describes a block, first column represents the blocktype, 
%       second the masktype. Per row only ONE block. 
%       Example: {'EnablePort' ''; 'Constant' ''} -> all Enable and Constant
%       blocks will be ignored
%
% MAAB.db_0042_a.Tolerance:
%   DATATYPE: 
%       integer
%   DEFAULT VALUE:
%       10 (unit: pixel)
%   DESCRIPTION:
%       The aligment of the inports and outports is not checked sharp - 
%       this would produce to many unnecessary failures. This tolerance  
%       represents the value to what the vertical position of all inports 
%       (and outports) might differ. 
%
% NOTE:
% =====
% - Corresponding guideline allows inports/outports to move to the
%   right/left in order to avoid signal crossings. This is not supported by
%   this check, as a consistent placement of ports increases much more the
%   readability of a chart than the avoidance of a few signal crossings.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:16CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0042_a(system, cmd_s)


































































