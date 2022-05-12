%% Comparison of Floating-Point Signals in Stateflow
%
% [result,cr_items,r_stats] = mes_mes_sltl_002_b(system, cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistic s on the check result
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>,
%
% DESCRIPTION:
% ============
% mes_sltl_002_b - Comparison of Floating-Point Signals in Stateflow
% Floating-point numbers must not be compared for equality "==" or
% inequality "~=". Instead, the equality or inequality of floating-point
% numbers must be tested by comparing the difference of the floating-point
% numbers against a threshold value.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each Stateflow variable of type floating-point.
%     - Failed 1: If the variable is compared by using equal ('==') or
%                 inequal ('~=').
% The check result is passed if all failed cases do not apply. 
%
% SOLUTION:
% =========
% To compare a Stateflow variable of type floating-point (double) for
% equality or inequality with the value of another variable, calculate the
% difference between both values and compare that difference with a given
% threshold value.
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% CHECK PARAMETERS:
% =================
% SDT.mes_sltl_002_b.ForbiddenOperators:
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
% Date:         $Date: 2020/07/31 16:02:59CEST $
% Revision:     $Rev: 7140 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_mes_sltl_002_b(system, cmd_s) %#ok<INUSD>








































