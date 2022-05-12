%% Arithmetical Operators: Option 'Require all Inputs to have same data type'
%
% [result,cr_items,r_stats] =  mes_sdt_sc004_a(system,cmd_s)
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
% MES Functional Safety Guidelines
% Release 1.7 (21 June 2013)
% Corresponding Guideline: 2.1 
%
% DESCRIPTION:
% ============
% Arithmetic blocks with two or more input signals (sum, product, dot 
% product) must not use inconsistent or inadequate input data types.
% 
% Therefore, the block option 'Require all inputs to have same data type' 
% should be set
% 
% PASS/FAIL CRITERIA:
% ===================
% The check inspects all Simulink and TargetLink product, sum, and dot
% product blocks. Any inspected block receives a fail, if its option 
% 'require same data types' is not enabled
%
% SOLUTION:
% =========
% Enable the option 'require same data types'
% 
% FIX OPERATION:
% ==============
% Fix will enable the option 'require same data types'
% 
% CHECK PARAMETERS: 
% =================
% No parameters are used. 
% 
% NOTE:
% =====
% Adjusting this option might lead to further errors in your model. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:09CEST $
% Revision:     $Rev: 15194 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_sdt_sc004_a(system, cmd_s)

































































































































