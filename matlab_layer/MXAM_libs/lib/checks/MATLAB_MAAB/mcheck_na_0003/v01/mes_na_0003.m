%% Simple logical expressions in If Condition block
%
% [result,cr_items,r_stats] = mes_na_0003(system, cmd_s)
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
% Guideline Rule ID: na_0003 (7.3.1.)
%
% DESCRIPTION:
% ============
% A logical expression may be implemented within an If Condition block
% instead of building it up with logical operation blocks, if the
% expression contains two or fewer primary expressions. A primary
% expression is defined here to be one of the following:
% - An input
% - A constant
% - A constant parameter
% - A parenthesized expression containing no operators except zero or one
%   instances of the following operators: <, <= , > , >= , ~=, ==, ~ . (See
%   for the following examples.)
%
% Exception:
% A logical expression may contain more than two primary expressions if
% both of the following are true:
% - The primary expressions are all inputs
% - Only one type of logical operator is present
% 
% Examples of Acceptable exceptions:
%  u1 || u2 || u3 || u4 || u5
%  u1 && u2 && u3 && u4
% 
% Examples of Primary Expressions:
% - u1
% - 5
% - K
% - (u1 > 0)
% - (u1 <= G)
% - (u1 > U2)
% - (~u1)
% - (EngineState.ENGINE_RUNNING)
% 
% Examples of Acceptable Logical Expressions:
% - u1 || u2
% - (u1 > 0) && (u1 < 20)
% - (u1 > 0) && (u2 < u3)
% - (u1 > 0) && (~u2)
% - (EngineState.ENGINE_RUNNING) && (PRNDLState.PRNDL_PARK)
%
% Examples of unacceptable logical expressions include:
%  - u1 && u2 || u3 (too many primary expressions)
%  - u1 && (u2 || u3) (unacceptable operator within primary expression)
%  - (u1 > 0) && (u1 < 20) && (u2 > 5) (too many primary expressions that are not inputs)
%  - (u1 > 0) && ((2*u2) > 6) (unacceptable operator within primary expression)
%
% PASS/FAIL CRITERIA:
% ===================
% A IF condition block will get a a pass if every condition contains two or
% fewer primary expressions,or the condition contains more than two primary
% expressions, but all the primary exppressions are inputs and only one
% type of logical operator is present; otherwise, the IF condition block
% will get a fail.
%
% SOLUTION:
% =========
% Use simple condition expressions in an If block, otherwise use logical
% operation blocks
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
% In the example EngineState.ENGINE_RUNNING and PRNDLState.PRNDL_PARK are 
% enumeration literals
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:38CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0003(system, cmd_s)












































































































































































































