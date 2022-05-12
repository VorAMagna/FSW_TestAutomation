% MES check: tl_pr20080214_11 - Erroneous elimination of unscaled Stateflow
% relational opperation
%
% function [result,cr_items,r_stats] = mes_tl_pr20080214_11(system, cmd_s)
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
% tl_pr20080214_11- A relational operation in Stateflow might be erroneously
% eleminated if following conditions hold:
% 1. The relational operation consists of an operation on the one side and a single
% variable on other side, e.g. (a >= b * c), or (b * c + d < a)
% - AND –
% 2. None of the operands has an LSB != 1.0 or an Offset != 0.0
%    (all operands are unscaled)
% - AND –
% 3. The single variable is an integer
% - AND –
% 4. The single variable is constant with an initial value.
%
% Fix: none
% Workaround:
% Introduce an auxiliary variable for the result of the operation.
%
% PASS/FAIL CRITERIA:
% ================
% in the following case, the model will get a fail:
% 1. Expressions in States or Transitions have relational operation; and
% 2. one of the operand is integer and constant with an initial value and
% 3. all operands has LSB=1 and Offset=0
%
% FIX ACTION:
% ===========
% NONE, must be manually corrected
%
% ***********************************************************
% Copyright:  Model Engineering Solutions
% Author:     Yongke Yu (yongke.yu@model-engineers.com)
% Version:    $Rev: 6115 $
% Date:       $Date: 2020/07/31 16:05:40CEST $
% ***********************************************************

function [result,cr_items,r_stats] = mes_tl_pr20080214_11(system, cmd_s) %#ok<INUSD>






























































































































































































































































































































































