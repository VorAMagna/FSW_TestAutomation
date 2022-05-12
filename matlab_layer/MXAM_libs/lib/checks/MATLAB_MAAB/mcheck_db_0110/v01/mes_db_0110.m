%% Tunable parameters in basic blocks
%
% [result,cr_items,r_stats] = mes_db_0110(system, cmd_s)
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
% Guideline Rule ID: db_0110 (7.4.3.)
%
% DESCRIPTION:
% ============
% To ensure that a parameter is tunable, it must be entered in a block
% dialog field:
% - without any expression,
% - without a data type conversion,
% - without selection of rows or columns,
%
% PASS/FAIL CRITERIA:
% ===================
% A fail is given to each block, that contains any of the three listet
% cases in the block dialog field. 
%
% SOLUTION:
% =========
% Numeric manipulation (as intended with expressions), data type conversion
% or element selection (as intended with Selection of rows or columns) should
% explicitly be done outside the Parameter block within Simulink. Configurable
% parameters should be entered as named constants. In general parameters should
% not be passed to subsystems via mask parameters but using a Const block as
% external input to the subsystem.
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
% Using '(' in a parameter will  result in a fail. Therefore it is not
% possible to use any function call as a parameter.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:17CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0110(system, cmd_s)











































