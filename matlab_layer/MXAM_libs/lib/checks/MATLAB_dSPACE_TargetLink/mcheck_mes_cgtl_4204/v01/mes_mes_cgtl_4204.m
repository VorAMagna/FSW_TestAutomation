%% Restrictions with Regard to the Fcn Block
%
% [result,cr_items,r_stats] = mes_mes_cgtl_4204(system, cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistics on the check result
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>,
%
% MES CHECK:
% ==========
% mes_cgtl_4204 - Restrictions with Regard to the Fcn Block
%
% The Fcn block should only be used in combination with either TargetLink
% floating point or TargetLink boolean data types for both inputs and
% outputs. No integer or fixed-point data types for inputs or outputs must
% be used.
%
% PASS/FAIL CRITERIA:
% ===================
% 	The check analyzes each TargetLink Fcn block in the model.
%
%     Failed 1: The output data type of the Fcn block is neither floating nor boolean.
%     Failed 2: The used input data type of the Fcn block is neither floating nor boolean.
%     Failed 3: The output data type and the used input data type of the
%     Fcn block are different.
%     Failed 4: The used input data type of the Fcn block cannot be evaluated.
% 
%   The check result is passed if all failed cases do not apply.
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_cgtl_4204(system, cmd_s)









































































































































































