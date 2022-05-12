% MES check: ds_0094 - Advanced Settings
%
% function [result,cr_items,r_stats] = mes_ds_0094(system,cmd_s)
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
% ds_0094 - Check configuration parameters (advanced settings / optimizations) for code generation with TargetLink
%
% This test checks the following parameters in the Simulink Configuration Parameter menu for code generation with TargetLink:
%
% Inline parameters             : off (deactivated)
% Block reduction               : off (only to MATLAB Release 6.1)
% Boolean logic signals         : on
% Conditional input branch      : on
% Parameter pooling             : on
% Signal storage reuse          : off

function [result,cr_items,r_stats] = mes_ds_0094(varargin) %#ok<INUSD>





























































































