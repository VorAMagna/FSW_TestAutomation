%% Use of Relational Operator block
%
% [result,cr_items,r_stats] = mes_jc_0131(system, cmd_s)
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
% Guideline Rule ID: jc_0131 (7.3.8.)
%
% DESCRIPTION:
% ============
% When the relational operator is used to compare a signal to a constant
% value the constant input should be the second (lower) input.
%
% PASS/FAIL CRITERIA:
% ===================
% If a relational operator compares a signal to a constant value, this 
% block receives a fail, if the constant is not the lower input.
%
% SOLUTION:
% =========
% Change the inputs. 
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
% Relational operator that are not connected to a constant block are
% ignored
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:28CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jc_0131(system, cmd_s)

































































































