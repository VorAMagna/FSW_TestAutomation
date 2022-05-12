%function [result,cr_items,r_stats] = mes_tl_pr20050721_08(system, cmd_s)
% MES check: tl_pr20050721_08 - Handling of expr. w/ SF int.types can differ
% from SR semantics
%
% function [result,cr_items,r_stats] = mes_tl_pr20050721_08(system, cmd_s)
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
% tl_pr20050721_08 - Handling of expr. w/ SF int.types can differ from SL semantics
% If an operation of variables with a Stateflow integer type is assigned to
% a floating point variable, TargetLink and Simulink/Stateflow behave
% differently. TargetLink computes the operation on the right hand side in
% floating point whereas Simulink/Stateflow performs an integer operation.
%
% EXAMPLE:
% Int16 var1 = 11;
% Int16 Var2 = 3;
% double result
% result=var1/var2;
% evaluates to 3.0 in Simulink/Stateflow and 3.66 in TargetLink
% Workaround:
% Assign the result of the right hand side to an intermediate integer
% variable, e.g.
% Int16 var1 = 11;
% Int16 Var2 = 3;
% double result;
% Int16 resuli;
% resulti=var1/var2;
% result=result;
%
% APPLIES TO:
% ===========
% assignments in stateflow ...
%     - states
%     - transition actions
%     - condition actions
% (note: report statistics and progress bar count sf-charts, not assignments )
%
% PASS/FAIL CRITERIA:
% ================
% The check fails, if one or more assignments
% are found in a stateflow assigment
% that are of the following type:
% - left hand side is a float variable
% - the right hand side is  an operation with vars of sf integer type only
%    e.g. ivar1 * ivar2
%
%
% FIX ACTION:
% ===========
% NOT AVAILABLE. As a workaround, assign the operation to a temporary
% integer type variable which is assigned lateron to the float variable
%
% ***********************************************************
% Copyright: Model Engineering Solutions
% Version:   $Rev: 6155 $
% Date:      $Date: 2020/07/31 16:05:36CEST $
% Author: Jörg Sangals (joerg.sangals@model-engineers.com)

function [result,cr_items,r_stats] = mes_tl_pr20050721_08(system, cmd_s) %#ok<INUSD,INUSD>





























































































































































































































































































































































