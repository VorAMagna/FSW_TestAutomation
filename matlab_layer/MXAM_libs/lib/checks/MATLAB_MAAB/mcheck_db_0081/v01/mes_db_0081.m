%% Unconnected Ports and Signals (Ground and Terminator Blocks)
%
% [result,cr_items,r_stats] = mes_db_0081(system, cmd_s)
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
% Guideline Rule ID: db_0081 (7.2.4.)
%
% DESCRIPTION:
% ============
% A system must not have any:
% - Unconnected subsystem or basic block inputs.
% - Unconnected subsystem or basic block outputs.
% - Unconnected signal lines.
% - An otherwise unconnected input should be connected to a ground block.
% - An otherwise unconnected output should be connected to a terminator block.
%
% PASS/FAIL CRITERIA:
% ===================
% Each block that has an unconnected Inport or Outport receives a fail.
% Each line that has neither a source nor a destination receives a fail.
%
% SOLUTION:
% =========
% Use Terminator or Ground blocks to avoid unconnected ports.
%
% FIX OPERATION:
% ==============
% All unconnected inports/outport are connected with a terminator/ground
% block. 
% Signal lines that have neither a source nor a destination block will be
% deleted.
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% If using automatic fix, simulink function addterms is used. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:17CEST $
% Revision:     $Rev: 6355 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0081(system, cmd_s)











































