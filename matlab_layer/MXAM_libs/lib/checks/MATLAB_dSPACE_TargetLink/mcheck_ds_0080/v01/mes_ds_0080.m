% MES check: ds_0080 - Reserved System Headerfile Names
%
% function [result,cr_items,r_stats] = mes_ds_0080(system, cmd_s)
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
% ds_0080 - Reserved System Headerfile Names
%
% Subsystems names should be different from TargetLink system header files 
% such as tl_types, tl_target_types, tllimits, dsfxp_a, dsfxp_c or 
% any other compiler or standard library such as:
% stdio, ctype, string, math, stdlib, assert, stdarg, setjmp, signal, time,
% limits, float
%
% Forbidden subsystem names for use with EMBEDDED CODER are:
% dt_info, ext_work, fixedpoint, rt_logging, rt_nonfinite, rt_nonfinite,
% rtlibsrc, rtlibsrc, rtw_continuous, rtw_extmode, rtw_matlogging,
% rtw_solver, rtwtypes, simstruc, simstruc_types, sysran_types
%
%
% PASS CRITERIA:
% ================
% A pass is given if no reserved system headerfile name is used.
%
% FAIL CRITERIA:
% ================
% A fail is given to every reserved system headerfile name which is used.
% 
% CHECK PARAMETERS:
% =================
% dSPACE.ForbiddenSubsystemnames:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'tl_types','tl_target_types','tllimits', 'dsfxp_a', 'dsfxp_c', ...
%        'stdio', 'ctype', 'string', 'math', 'stdlib', 'assert', 'stdarg',...
%        'setjmp', 'signal', 'time', 'limits', 'float',...
%        'dt_info', 'ext_work', 'fixedpoint', 'rt_logging', 'rt_nonfinite', 'rt_nonfinite',...
%        'rtlibsrc', 'rtlibsrc', 'rtw_continuous', 'rtw_extmode', 'rtw_matlogging',...
%        'rtw_solver', 'rtwtypes', 'simstruc', 'simstruc_types', 'sysran_types'}
%   DESCRIPTION:
%       Each member of dSPACE.ForbiddenSubsystemnames is a prohibited
%       subsystem name
% 
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:23CEST $
% Revision:     $Rev: 6835 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0080(system, cmd_s) %#ok<INUSD>
























































































