% MES check: tl_pr20061030_09 - Wrong code for a relational operation in
% Stateflow.
%
% function [result,cr_items,r_stats] = mes_tl_pr20061030_09(system, cmd_s)
%
% RETURN PARAMETERS:
% ==================
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
%
% INPUT PARAMETERS:
% =================
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>, for details See also mes_jc_0061
%
% MES CHECK:
% ==========
% tl_pr20061030_09 - If a relational operation is specified in Stateflow
% which has
%   1. a single unsigned variable as one operand and
%   2. a mathematical operation (e.g subtraction) which can lead to
%   negative results as second operand,
% the generated code will be wrong for negative results of the mathematical
% operation. This problem arises, because TargetLink assumes, that the
% result of the mathematical operation fits into the variable of the other
% operand. Whenever a single variable is compared to an operation result,
% TargetLink wrongly assumes that the result of the operation fits the
% single variable.
%
% Fix: none
% Workaround: introduce an auxiliary variable for the result of the
% arithmetic operation.
%
% PASS/FAIL CRITERIA:
% ================
% In the following case, the model will get a fail:
% 1. Expression(s) in stateflow states or transitions have
%    relational operation
%  AND
% 2. one of the operand is an unsigned variable
%  AND
% 3. the second operand is a mathematical operation which may lead to
%    negative results as second operand.
%
% Note: the judgement that a mathematical operation may lead to negative
%       result is not always right. In the follwing case, a conservative
%       possibility is taken:
%       For operations * /, if one operand may take negative value, then
%       the result of the operationis considerd as negative. Actually, the
%       operands may all be absolute negative, and both operands may be
%       same, then the result may be positive, this is not considered
%
% FIX ACTION:
% ===========
% NONE, must be manually corrected
% See also: mes_tl_pr20051017_01
%
% ***********************************************************
% Version: $Rev: 6115 $
% Date:    $Date: 2020/07/31 16:05:38CEST $
% Copyright: Model Engineering Solutions
% ***********************************************************

function [result,cr_items,r_stats] = mes_tl_pr20061030_09(system, cmd_s) %#ok<INUSD>































































































































































































































































