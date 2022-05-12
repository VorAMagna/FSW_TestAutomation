% MES check: ds_0055 - Reserved Names in Stateflow
%
% function [result,cr_items,r_stats] = mes_ds_0055(system, cmd_s)
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
% ds_0055 - Reserved Names in Stateflow
% 
% The following keywords are reserved in Stateflow and must not be used for
% names of variables, events, states or graphical functions in a Stateflow chart: 
%
% abs, acos, after, asin, at, atan, atan2, before, ceil, chg, change, cos, 
% cosh, du, during, en, enter, entry, every, ex, exp, exit, fabs, floor, 
% fmod, in, log, log10, max, min, matlab, ml, pow, send, sgn, sin, sinh, 
% sqrt, t, tan, tanh, tc<digits>, trigger_id.
%
% PASS/FAIL CRITERIA:
% ================
% Each chart which does not use a reserved keyword for a variable, event, state, 
% or graphical function name will receive a pass otherwise a fail.
% 
% CHECK PARAMETERS:
% ================= 
% dSPACE.SF.ReservedKeywords:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'abs', 'acos', 'after', 'asin',...
%        'at', 'atan', 'atan2', 'before',...
%        'ceil', 'chg', 'change','cos',...
%        'cosh', 'du', 'during', 'en',...
%        'enter', 'entry', 'every', 'ex',...
%        'exp', 'exit','fabs', 'floor',...
%        'fmod', 'in', 'log', 'log10',...
%        'signed', 'max','min', 'matlab',...
%        'ml', 'pow', 'send', 'sgn',...
%        'sin', 'sinh', 'sqrt', 't', ...
%        'tan', 'tanh', 'tc', 'trigger_id'}
%   DESCRIPTION:
%       Keywords are not allowed in Stateflow Charts.
% 
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:18CEST $
% Revision:     $Rev: 6835 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0055(system, cmd_s) %#ok<INUSD>
















































































































































