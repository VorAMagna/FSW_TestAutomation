%% Number of inputs to variant subsystems
%
% [result,cr_items,r_stats] = mes_na_0020(system, cmd_s)
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
% Guideline Rule ID: na_0020 (8.6.1.)
%
% DESCRIPTION:
% ============
% Simulink requires variant subsystems to have the same number of inputs.
% However, the variant subsystem might not use all of the inputs. In these
% instances, terminate the unused inputs with the Terminator block.
%
% PASS/FAIL CRITERIA:
% ===================
% A variant subsystem gets a pass if all its variant subsystems have same
% number of inputs and outputs and same number of ports as their parent,
% otherwise, a fail will given.
%
% SOLUTION:
% =========
% add same number inputs and outputs to all variant subsystems, if one
% input or output is not used, use terminator or ground block to terminate
% them.
%
% FIX OPERATION:
% ==============
% No automatic fix available
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% Number of outports of variant subsystems should be same too.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:42CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0020(system, cmd_s)

































































































































