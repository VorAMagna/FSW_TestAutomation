%% Stateflow: Undefined SF Variable Range
%
% [result,cr_items,r_stats]=mes_sdt_sc002(system,cmd_s)
% 
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistic s on the check result
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>
%
% REFERENCED GUIDELINE:
% =====================
% MES Functional Safety Guidelines
% Release 1.7 (21 June 2013)
% Corresponding Guideline: 2.1 
%
% DESCRIPTION:
% ============
% The range of all variables must be explicitely defined in the model
% explorer (Tab 'Value Attributes", section limit range).
%
% PASS/FAIL CRITERIA:
% ===================
% A chart receives a pass, if  the range of all variables is explicitely 
% defined in the model explorer (Tab 'Value Attributes", section limit 
% range).
%
% SOLUTION:
% =========
% Use the model explorer to define the ranges of each SF variable. 
% 
% FIX OPERATION:
% ==============
% No automatically fix available. 
% 
% CHECK PARAMETERS:
% =================
% No parameters are used. 
% 
% NOTE:
% =====
% Only use this check if you interested in correct ranges. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:08CEST $
% Revision:     $Rev: 6795 $
% *************************************************************************

function [result,cr_items,r_stats]=mes_sdt_sc002_e(system, cmd_s)














































































































