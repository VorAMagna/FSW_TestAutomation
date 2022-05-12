%% Position of block names
%
% [result,cr_items,r_stats] = mes_db_0142(system, cmd_s)
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
% Guideline Rule ID: db_0142 (7.1.7.)
%
% DESCRIPTION:
% ============
% If shown the name of each block should be placed below the block.
%
% PASS/FAIL CRITERIA:
% ===================
% A pass is given to those blocks, which have their name placed below the 
% block if it is shown.
%
% SOLUTION:
% =========
% Set the option 'NamePlacement' to 'normal'.
%
% FIX OPERATION:
% ==============
% The option 'NamePlacement' will be set to 'normal'.
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% If a block is not orientated 'left' or 'right', the block name appears to
% the left (or right) of the block if its 'NamePlacement' is 'normal'. This
% will not throw an error, because if its name would be positioned below the
% block, it would overlap with signal lines. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:23CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0142(system, cmd_s)

















































