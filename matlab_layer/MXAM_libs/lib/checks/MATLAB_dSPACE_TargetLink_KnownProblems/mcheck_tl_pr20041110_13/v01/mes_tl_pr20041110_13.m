% MES check: tl_pr20041110_13 - State variables with local scope are not
% re-initialized
%
% function [result,cr_items,r_stats] = mes_tl_pr20041110_13(system, cmd_s)
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
% tl_pr20041110_13 - State variables with local scope are not re-initialized
%
% State variables are not re-initialized in init functions if they have local scope. This problem affects the
% following blocks if they reside in an enabled or an action port triggered subsystem which has set
% 'States when enabling' resp. 'States when action is resumed' to 'reset':
% - Stateflow
% - FIR Filter
% - Unit Delay
% - Discrete State-Space
% - Discrete-Time Integrator
% - Custom Code
% - Discrete Transfer Function
% - Discrete Filter
% - Unit Delay Reset Enabled
% - Blocks which need a FirstRun symbol in code.
%
% SOLUTION:
% =========
% Select global scope for block state variables which have to be reset or
% keep their variable classes set to 'default'. If the FirstRun symbol is
% specified via template in the Data Dictionary, select here global scope
% or keep the variable class set to 'default'.
%
% PASS/FAIL CRITERIA:
% ================
% Failures for blocks:
%
% - Stateflow: data objects of local scope exist
% - FIR Filter: Variablae Class of Delay Line has local scope
% - Unit Delay,Discrete-Time Integrator,Unit Delay Reset Enabled: Variable Class of state variable has local scope. Property
%   'state.variable' can be directly specified by the user
% - Rate Limiter Block,J-K-FlipFlop,D-FlipFlop (Blocks which need a FirstRun Symbol):
%   Variable class template with VarClassSpec 'FirstRun' exists and has a variable
%   class of local scope
% - Getriggerte Chart: event with 'Input from Simulink' scope exists which
%   means a FirstRun symbol is needed. Faulty if variable class template
%   with VarClassSpec 'FirstRun' exists and has a variable class of local
%   scope
%
% NOTE:
% =====
% - A block or variable which uses a default class is mapped to a template.
%   The check looks for variable class templates in the DD which has a
%   variable class with local scope.
%   For SL blocks: Template VariableClassSpec = SLGlobal || SLGlobalInit ||
%   SLFcnInput || SLFcnOutput
%   For SF blocks: Template VariableClassSpec = SFGlobal || SFGlobalInit ||
%   SFFcnInput || SFFcnOutput
% - Custom Code block is checked by TL
% - MATLAB will give warnings when the state of a stateflow data object is
%   deficient. Nevertheless the check will give a failure in this case.
% - For discrete blocks 'TL_DiscreteTransferFcn','TL_DiscreteFilter',Discrete
%   State-Space: the state variable is not directly accessable but via the default variable
%   class (DD). TargetLink detects scopes which are too small when reading the template.
%   (checked b TL)
% - Blocks which need a FirstRun Symbol:
%    - Triggered Subsystems (checked by TL)
%    - Triggered Charts,Rate Limiter
%    Blocks,J-K-FlipFlop's,D-FlipFlop's(checked)
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% version:      $Id: mes_tl_pr20041110_13.m 1.1 2020/07/31 16:05:36CEST Vojnic-Hajduk, Vladimir (vladvojn) Exp  $
% ***********************************************************

function [result,cr_items,r_stats] = mes_tl_pr20041110_13(system, cmd_s) %#ok<INUSD>
































































































































































































































































































































































































































































