%% Reuse of Atomic Subsystem for Code Generation
%
% [result,cr_items,r_stats] = mes_mes_cgec_2002(system, cmd_s)
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
% mes_cgec_2002 - Reuse of Atomic Subsystem for Code Generation
% The atomic subsystem's code generation function packaging option
% (Real-time Workshop system code in Matlab R2009b) should be set to auto
% to avoid inefficient generated code.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each atomic in the model.
%
% Failed 1: The code generation 'Function packaging' ('Real-time Workshop
% system code' in Matlab R2009b) option is set to Nonreusable.
% Failed 2: The code generation 'Function packaging' ('Real-time Workshop system code' 
% in Matlab R2009b) option is set to Reusable but it is not reused (if the model is compilable).
% Review (if the model is not compilable): The code generation 'Function packaging' 
% ('Real-time Workshop system code' in Matlab R2009b) option is set to Reusable. Please check the model. 
%
% The check result is passed if all failed cases do not apply.
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:50CEST $
% Revision:     $Rev: 15223 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_cgec_2002(system, cmd_s)














































































































































