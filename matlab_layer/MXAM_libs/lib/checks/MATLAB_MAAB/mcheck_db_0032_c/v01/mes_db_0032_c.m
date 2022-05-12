%% Simulink signal appearance, Part3: Crossings
%
% [result,cr_items,r_stats] = mes_db_0032_c(system, cmd_s)
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
% - should not cross each other, if possible
% - do not cross any blocks or annotations
%
% PASS/FAIL CRITERIA:
% ===================
% A signal line receives a warning if it crosses another signal line
% A signal line receives an error if it crosses a block or a signal line
% and a block. 
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
% No parameters are used.
%
% NOTE:
% =====
% If a signal line crosses the source or destination point of a signal
% line, this is not treated as 'line-line' - crossing. Reason:
%    - Case: Source or Destination point is a block -> Signal line would
%      overlap with edges of block, corresponding check of guideline rule
%      db_0032 would throw a fail
%    - Case: Source or Destination point is a branching point -> It has to
%      be differentiate, if this signal line originate from this branching
%      point or not, corresponding check of guideline rule db_0032 would
%      throw a fail. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:15CEST $
% Revision:     $Rev: 6468 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0032_c(system, cmd_s)


















































