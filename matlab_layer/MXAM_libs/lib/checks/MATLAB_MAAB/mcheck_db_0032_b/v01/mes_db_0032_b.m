%% Simulink signal appearance, Part2: Overlapses
%
% [result,cr_items,r_stats] = mes_db_0032_b(system, cmd_s)
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
% Guideline Rule ID: db_0032 (7.1.11.)
%
% DESCRIPTION:
% ============
% Signal lines 
% - are not drawn one upon the other
% - are not drawn upon the edges of any block
%
% PASS/FAIL CRITERIA:
% ===================
% Each line, that is drawn upon another line or upon the edge of any block
% OR is closer to one of these two than the minimal distance in parameter
% MAAB.db_0032_b.MinDist gets a fail. 
%
% SOLUTION:
% =========
% Change the layout of your model.
%
% FIX OPERATION:
% ==============
% No automatic fix available.
%
% CHECK PARAMETERS:
% =================
% MAAB.db_0032_b.MinDist:
%   DATATYPE: 
%       integer
%   DEFAULT VALUE:
%       10 (unit: pixel)
%   DESCRIPTION:
%       Minimal distance between line and line or line and egde of block. 
%       It distance is closer, a fail is returned.
%
% NOTE:
% =====
% - This check is one of four checks, that all together cover guideline
%   db_0032. 
% - The part 'are not drawn upon the edges of any block' has been added to
%   MAAB Guideline db_0032 as it seems a obvious extension. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:14CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0032_b(system, cmd_s)





















































