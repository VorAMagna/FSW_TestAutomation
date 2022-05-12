% MES check: tl_pr20051017_01 - Stateflow: overflow in relational operation
%
% function [result,cr_items,r_stats] = mes_tl_pr20051017_01(system, cmd_s)
%
% INPUT ARGUMENTS:
% =================
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>, for details See also mes_jc_0061
%
% RETURN VALUES:
% ==================
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
%
% MES CHECK:
% ==========
% tl_pr20051017_01 - Stateflow: overflow in relational operation
%
% TargetLink does not check relational operations in Stateflow for overflow. Under the following
% conditions the generated code for relational operations in Stateflow is incorrect:
%    - one operand is a variable
%   AND
%   - the other operand is a constant or an arithmetic operation
%   AND
%   - the constant or the result of the arithmetic operation cannot be
%     represented within the implemented range of the variable.
% Workaround:
% Introduce an auxiliary variable for the constant/arithmetic operation.
%    NOTE: there is no workarround for conditions, because here, no assignment can
%    be added to the condition expression (test, if the code must be
%    patched)
%
% APPLIES TO
% ===========
% relational expressions in stateflow ..
%   -
%   - transition conditions
%   - transition actions
%   - states
% (note: report statistics and progress bar count sf-charts, not rel.ops )
%
% PASS/FAIL CRITERIA:
% ===================
% a fail is given for a transition or a state, if all three of the above
% mentioned conditions are met
%
% FIX ACTION:
% ===========
% none, advice: introduce an temporary variable for the constant/arithmetic
% operation
%
%
% ***********************************************************
% Copyright: Model Engineering Solutions
% Version:   $Rev: 6650 $
% Date:      $Date: 2020/07/31 16:05:37CEST $
% author: Jörg Sangals (joerg.sangals@model-engineers.com)

function [result,cr_items,r_stats] = mes_tl_pr20051017_01(system, cmd_s) %#ok<INUSD>












































































































































































































































































































































































