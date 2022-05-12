%% Avoidance of TargetLink Specifications for Stateflow Input Variables
%
% [result,cr_items,r_stats] = mes_mes_cgtl_4301(system, cmd_s)
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
% MES CHECK: 
% ==========
% mes_cgtl_4301 - Avoidance of TargetLink Specifications for Stateflow Input Variables
% The sf.createinputvariable should be set to 'off' to avoid the
% specification and generation of a separate Stateflow input variable
% rather than reusing the variable of the predecessor block. The only
% exception is the use case where the entire chart function should be
% reused.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each input variable of each chart in the model.
% Review 1: The property sf.createinputvariable of an input variable is set to 'on'.
% The check result is passed if all review cases do not apply.
%
% TECHNICAL NOTES:
% ================
% If the property sf.createinputvariable is set to 'on' for an input
% variable, a separate Stateflow input variable is specified and generated.
% TargetLink normally uses the output variables of preceding blocks as
% input variables for Stateflow, but if separate input variables are
% generated, these are used instead. The Stateflow input variables need
% function parameter classes assigned to them only if functions with a
% well-defined interface have to be generated for the Stateflow chart. In
% this case, it may be convenient to set the property
% sf.createinputvariable to 'on'.
% 
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:33CEST $
% Revision:     $Rev: 15223 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_cgtl_4301(system, cmd_s)
























































































