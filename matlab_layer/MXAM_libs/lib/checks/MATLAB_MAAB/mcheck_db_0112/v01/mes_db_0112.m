%% Zero-based indexing
%
% [result,cr_items,r_stats] = mes_db_0112(system, cmd_s)
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
% Guideline Rule ID: db_0112 (7.1.2.)
%
% DESCRIPTION:
% ============
% Use a consistent vector indexing method for all blocks. When possible, use
% zero-based indexing to improve code efficiency. However, since MATLAB
% blocks do not support zero-based indexing, one-based indexing can be used
% for models containing MATLAB blocks.
%
% PASS/FAIL CRITERIA:
% ===================
% This check consideres following blocks: 
%   - MultiportSwitch, 
%   - Assignement,
%   - Selector
%   - ForIterator. 
% A fail is given to
% - a MultiSwitch if its parameter 'DataPortOrder' is not set to
%   'Zero-based contiguous'
% - an Assignment, Selector or ForIterator block if their parameter
%   'IndexMode' is not set to 'Zero-based'
%
% SOLUTION:
% =========
% Use zero based indexing for the blocks that have index parameter
%
% FIX OPERATION:
% ==============
% Automatic fix will set the parameter
% - 'DataPortOrder' of each MultiportSwitch to 'Zero-based contiguous'
% - 'IndexMode' of each Assignment, Selector and ForIterator block to
%   'Zero-based'
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% - List of considered blocks is hard-coded. 
% - SL Block 'Index Vector' (standard library) is covered by 'Multiport
%   Switch'
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:18CEST $
% Revision:     $Rev: 6334 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0112(system, cmd_s)








































