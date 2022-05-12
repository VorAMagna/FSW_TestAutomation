%% General Naming Conventions: Reserved Names
%
% [result,cr_items,r_stats]=mes_ds_0079_c(system,cmd_s)
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
% dSpace Modeling Guidelines for MATLAB/Simulink/Stateflow and
% TargetLink, Version 3.0, 10.06.2010
% Guideline Rule ID: 4.1
%
% DESCRIPTION:
% ============
% Identifiers within a model (in particular for parameters, subsystem names
% and port names) should be valid ANSI C identifiers. Names should be
% different from the following reserved names:
%
% auto, break, case, catch, char, const, continue, default, do, double,
% else, elseif, end, enum, extern, float, for, function, global, goto, if,
% int, long, otherwise, persistent, register, return, short, signed,
% sizeof, static, struct, switch, try, typedef, union, unsigned, void,
% volatile, while
%
% PASS/FAIL CRITERIA:
% ===================
% A fail is given for each identifier of
% - a signal-line or
% - a block or
% - a port of a block or
% - any tuneable Parameter defined within the model or
% - any workspace variable or
% - any typedef within the data dictionary
%
% which is equal to one entry of the blacklist.
%
% SOLUTION:
% =========
% Rename identifiers, such that code generation wont lead to any errors.
%
% FIX OPERATION:
% ==============
% No automatic fix available.
%
% CHECK PARAMETERS:
% =================
% dSPACE.ForbiddenIdentifierNames:
%   DATATYPE:
%       cellstring
%   DEFAULT VALUE:
%       {'auto', 'break', 'case', 'catch', 'char', 'const', 'continue', 'default',...
%        'do', 'double', 'else', 'elseif', 'end', 'enum', 'extern', 'float',...
%        'for', 'function', 'global', 'goto', 'if', 'int', 'long', 'otherwise',...
%        'persistent', 'register', 'return', 'short', 'signed', 'sizeof', 'static',...
%        'struct', 'switch', 'try', 'typedef', 'union', 'unsigned', 'void', 'volatile', 'while'}
%   DESCRIPTION:
%       Each member of dSPACE.ForbiddenIdentifierNames is a forbidden
%       identifier and is not allowed to use as a blockidentifier, a
%       signal-line label or asa value of an editable blockparameter.
%
% NOTE:
% =====
% - This check only gives a fail, if the whole string (i.e. value, label,
%   identifier) is a member of the blacklist. So 'else' produces a
%   fail, but not 'welse'  nor 'this else'.
% - This check returns a fail for worspace variables and data dicitionary
%   entries which are not used correctly even if they are not used within
%   the current model
% - For typedefs within the data dictionary, 'void' is no prohibited
%   identifier
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:23CEST $
% Revision:     $Rev: 6835 $
% *************************************************************************

function [result,cr_items,r_stats]=mes_ds_0079_c(system,cmd_s) %#ok<INUSD>



















































































































































































































































































































































