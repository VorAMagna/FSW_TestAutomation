%% Use of the Sum Block: Shape including Feedback-Loop exception 
%
% [result,cr_items,r_stats] = mes_jc_0121(system, cmd_s)
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
% Guideline Rule ID: jc_0121 (7.3.7.)
%
% DESCRIPTION:
% ============
% Shape for Sum blocks in feedbacklopps is not restricted. Nevertheless, in
% case of round shape, they should fulfill:
% - There should be no more then 3 inputs.
% - The inputs may be positioned at 90,180,270 degrees.
% - The output should be positioned at 0 degrees.
% 
% Sum blocks, that are not in a feedback loop must have rectangular shape. 
%
% PASS/FAIL CRITERIA:
% ===================
% Sum blocks, which are in a feedback loop, receive a pass if their inputs
% are positioned at 90 or 180 or 270 degree and the block is not rotated 
% (output is at 0 degree).
% 
% Sum blocks, which are not in a feedback loop, receive a pass, if their 
% shape is rectangular.  
%
% SOLUTION:
% =========
% Do not use more than two inputs. If possible, use rectangular shape.
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
% - This check only covers the feedback-loop exception of the corresponding
%   guideline
% - Only round sum-blocks are considered
% - To check for overlapping or crossing input signal lines, use the check 
%   correspond to db_0032
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:28CEST $
% Revision:     $Rev: 6566 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jc_0121(system, cmd_s)





























































































































































































































