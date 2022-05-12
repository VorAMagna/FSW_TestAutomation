%% Comparison of Floating-Point Signals in Simulink and TargetLink
%
% [result,cr_items,r_stats] = mes_mes_sltl_002_a(system, cmd_s)
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
% DESCRIPTION:
% ============
% mes_sltl_002_a - Comparison of Floating-Point Signals in Simulink and TargetLink
% Floating-point numbers must not be compared for equality "==" or
% inequality "~=". Instead, the equality or inequality of floating-point
% numbers must be tested by comparing the difference of the floating-point
% numbers against a threshold value.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each block listed in the parameter SDT.mes_sltl_002_a.CheckedBlocks.
%     - Failed 1: If input signals of type floating-point are compared by
%                 using equal ('==') or inequal ('~=').
% The check result is passed if all failed cases do not apply.
%
% SOLUTION:
% =========
% To compare a signal of type floating-point for equality or inequality
% with the value of another signal, calculate the difference between both
% values and compare that difference with a given threshold value.
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% CHECK PARAMETERS:
% =================
% SDT.mes_sltl_002_a.CheckedBlocks:
%   DATATYPE:
%       cellstring with four columns
%   DEFAULT VALUE:
%      {'If','',{'IfExpression','ElseIfExpressions'},'1:n';
%       'MultiPortSwitch','',{},'1';
%       'MultiPortSwitch','TL_MultiPortSwitch',{},'1';
%       'RelationalOperator','',{'Operator'},'1:2';
%       'RelationalOperator','TL_RelationalOperator',{'Operator'},'1:2';
%       'Switch','',{'Criteria'},'2';
%       'SwitchCase','',{},'1';
%       'Switch','TL_Switch',{'threshold.criteria'},'2'}%
%   DESCRIPTION:
%       Each row represents one block, that is checked for relational
%       operators.
%       First column:   Blocktype
%       Second column:  Masktype
%       Third column:   Parameter to be checked (could remain empty)
%       Fourth column:  Number of ports, that are checks, use x:y to check
%                       ports x to y
%
% SDT.mes_sltl_002_a.ForbiddenOperators:
%   DATATYPE:
%       cellstring
%   DEFAULT VALUE:
%       {'==','~='}
%   DESCRIPTION:
%       A list of operators that are forbidden to be used in conjunction
%       with variables of type floating-point (double). By default, the
%       operators for equality and inequality are forbidden: {'==', '~='}.
%
% NOTE:
% =====
% Default prohibited operators are '==' and '~='. They might be extended by
% '<=','<','>','>='. In case of 'smaller than'- or 'greater than'-
% comparisons with floats, results might be correct. Nevertheless, such
% operations should be treated very carefully.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:02:58CEST $
% Revision:     $Rev: 15098 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_mes_sltl_002_a(system, cmd_s)










































