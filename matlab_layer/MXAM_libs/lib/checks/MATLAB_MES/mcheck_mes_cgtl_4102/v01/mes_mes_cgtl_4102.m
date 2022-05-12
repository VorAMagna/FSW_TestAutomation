%% Use of block 'Data Type Conversion' is forbidden
% function [result,cr_items,r_stats] = mes_mes_cgtl_4102(system, cmd_s)
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
% Reference:
% mes_cgtl_4102
%
% DESCRIPTION:
% ============
% Use of the block 'Data Type Conversion' is forbidden. Alternatively, the
% tl-block 'Rescaler' must be used.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each Data Type Conversion block.
% Review: If the Data Type Conversion block resides in a TargetLink subsystem.
% The check result is passed if the review case does not apply.
%
% SOLUTION:
% =========
% Use the TargetLink block 'Rescaler' instead of the Simulink block 'Data Type
% Conversion' or else justify the necessity for the model-in-the-loop simulation.
%
% FIX OPERATION:
% ==============
% No fix available
%
% CHECK PARAMETERS:
% =================
% No parameters needed.
%
% NOTE:
% =====
%
%
% PUBLIC INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions GmbH
% Date:         $Date: 2020/07/31 16:03:51CEST $
% Revision:     $Rev: 15194 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_mes_cgtl_4102(system, cmd_s)






































