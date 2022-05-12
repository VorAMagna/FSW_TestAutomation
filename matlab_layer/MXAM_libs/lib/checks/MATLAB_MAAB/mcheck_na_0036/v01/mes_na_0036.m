%% Default variant
%
% [result,cr_items,r_stats] = mes_na_0036(system, cmd_s)
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
% Guideline Rule ID: na_0036 (5.2.6.)
%
% DESCRIPTION:
% ============
% All Variant subsystems and models should be configured so that one
% subsystem is always selected. This can be achieved by doing one of the
% following: 
%  -- Using a default variant.
%  -- Defining conditions that exhaustively cover all possible values of
%     the conditional variables. For example, defining conditions for true
%     and false values of a Boolean.
%
% PASS/FAIL CRITERIA:
% ===================
% A variant subsystem or model will receive a pass if a variant is selected
% by block setting or at any cases always one variantobject's condition is true.
%
% SOLUTION:
% =========
% Use default variant or make the condition so that all cases of the
% variant control variable will be covered.
%
% How to set the model so that this check gets a pass?
% 1. arrange the condition of control variant so that all possible values
%    of the logical expression have been covered
% 2. use enumerated variale in the expression and cover all enumerated
%    values
% 3. use simulink.parameter variable as control varialbe, set its data type
%    and min max value,  e.g datatype='uint8', min=1 and max=2, so that the
%    condition x==1  and x==2 will cover all cases
%
% FIX OPERATION:
% ==============
% No automatic fix available.
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% - The variant control variale must be at the right side of a logical
%   expression, for example, var_control is the variant control variale, so
%   that the condition should be var_control>3 or var_control<d_constand, but
%   should not be 3<var_control or d_constand>var_control
% - The the right handle side of a logical expression should be a constant
%   or an expression that can be evulated as a constant
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:45CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0036(system, cmd_s)


































































































































































































































































































































































































































































































