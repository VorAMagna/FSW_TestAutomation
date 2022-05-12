%% Matlab Commands in Stateflow
%
% [result,cr_items,r_stats] = mes_db_0127(system, cmd_s)
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
% Guideline Rule ID: db_0127 (8.2.9.)
%
% DESCRIPTION:
% ============
% The following functions and operators must not be used in Stateflow:
% - The 'matlab(evalString,arg1,arg2,...)' or 'ml(...)' notation.
% - The 'matlab.workspace_data' or 'ml.' notation.
% - Matlab specific functions, e.g. ones, size, ... .
% - Matlab specific instructions, e.g. try ... catch.
% - Matlab specific operators, e.g. ~=, bitand,... .
% - Project specific Matlab-functions.
%
% PASS/FAIL CRITERIA:
% ===================
% Each chart that fulfill the following rules receives a pass:
% - no entry of MAAB.db_0127.ForbiddenSFVariableIdentifiers is used AND
% - no entry of MAAB.db_0127.ForbiddenSFMatlabCalls is used AND
% - no entry of MAAB.db_0127.ForbiddenSFFunctionIdentifiers is used.
%
% SOLUTION:
% =========
% Avoid the forbidden identifiers, matlab calls or function identifiers. 
%
% FIX OPERATION:
% ==============
% No automatic fix available.
%
% CHECK PARAMETERS:
% =================
% MAAB.db_0127.ForbiddenSFVariableIdentifiers:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'if' 'else' 'elseif' 'end' 'switch' 'case' 'otherwise' ...
%        'for' 'while' 'continue' 'break' 'try' 'catch' 'return' ... 
%        'error' 'warning'}
%   DESCRIPTION:
%       List of forbidden Stateflow variable names.
% 
% MAAB.db_0127.ForbiddenSFMatlabCalls:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'matlab\(\w*\)' 'ml\(\w*\)' 'matlab\.\w+' 'ml\.\w+'}
%   DESCRIPTION:
%       List of forbidden Matlab calls.
%
% MAAB.db_0127.ForbiddenSFFunctionIdentifiers:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'ones' 'zeros' 'size' 'why' 'accumarray' 'bsxfun' 'cat' ...
%        'diag' 'eps' 'length' 'eye' 'find' 'inf' 'isempty' ...
%        'isequal' 'isvector' 'isscalar' 'isinf' 'isnan' 'nan' ...
%        'permute' 'pi' 'rand' 'randn' 'xor' 'any' 'all' 'bitand' ...
%        'bitor' 'bitcmp' 'bitxor'}
%   DESCRIPTION:
%       List of forbidden function identifiers. These strings can be used 
%       as variables but should not be called as functions (if it does not 
%       appear in the stateflow.data, then not allowed in label of transions, 
%       sates and function in the format as string(...).
%
% NOTE:
% =====
% - Using one of the forbidden identifiers, matlab calls or function
%   identifiers could result in bad code generation.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:20CEST $
% Revision:     $Rev: 7182 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0127(system, cmd_s)














































































































































































































































































