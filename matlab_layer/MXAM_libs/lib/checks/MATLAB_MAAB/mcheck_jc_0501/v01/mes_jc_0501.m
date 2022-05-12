%% Format of entries in a State block
%
% [result,cr_items,r_stats] = mes_jc_0501(system, cmd_s)
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
% Guideline Rule ID: jc_0501 (8.1.6)
%
% DESCRIPTION:
% ============
% A new line should:
%   - Start after the entry (en), during (du) and exit (ex) statements.
%   - Start after the completion of an assignment statement ';'.
%
% PASS/FAIL CRITERIA:
% ===================
% A fail is given to each state, that have an entry (en), during (du) or
% exit (ex) action or a ';' and is not followed by a new line. 
%
% SOLUTION:
% =========
% Add line feed after entry(en), during(du) and exit(ex) statemens and ';' 
% characters.
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
% Increase readability by using more than one line. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:32CEST $
% Revision:     $Rev: 6720 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jc_0501(system, cmd_s)







































