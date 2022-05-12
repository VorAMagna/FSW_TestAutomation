%% Prohibited Simulink sinks
%
% [result,cr_items,r_stats] = mes_hd_0001(system, cmd_s)
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
% Guideline Rule ID: hd_0001 (7.3.4.)
%
% DESCRIPTION:
% ============
% Control algorithm models must be designed from discrete blocks.
% The following sinks blocks are not allowed:
% - To File
% - To Workspace
% - Stop Simulation
%
% PASS/FAIL CRITERIA:
% ===================
% A fail is given to each prohibited sink.
%
% SOLUTION:
% =========
% Consider using the Simulink Signal logging and Signal and Scope Manager 
% for data logging and viewing requirements.
%
% FIX OPERATION:
% ==============
% No automatic fix operation available. 
%
% CHECK PARAMETERS:
% =================
% MAAB.hd_0001.ProhibitedSink:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'Scope','';'SubSystem','XY scope.';'ToFile','';...
%        'ToWorkspace','';'Stop','';'FloatingScope',''}
%   DESCRIPTION:
%       Each row defines a prohibited sink. First column represents 
%       blocktype, second column the masktype. 
%
% NOTE:
% =====
% Default values of MAAB.hd_0001.ProhibitedSink consists prohibits more
% sinks than the corresponding guideline. The additional blocks have been
% added based on experience. If these defaults are to strict, delete them
% out of MAAB.hd_0001.ProhibitedSink.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:25CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_hd_0001(system, cmd_s)


















































