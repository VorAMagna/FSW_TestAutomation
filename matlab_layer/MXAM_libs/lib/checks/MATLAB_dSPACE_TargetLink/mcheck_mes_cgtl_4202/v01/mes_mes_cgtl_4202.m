%% 64-Bit Operations
%
% [result,cr_items,r_stats] = mes_mes_cgtl_4202(system, cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistics on the check result
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>,
%
% MES CHECK:
% ==========
% mes_cgtl_4202 - TL_RULE_OPTI_64_BIT
%
% Generation of intermediate 64-bit operations should be avoided whenever possible in order to improve code efficiency as well as MISRA C 
% compliance. The use of smaller data types than 32 Bit as well as the specification of constraint limits for 32 Bit operands help to accomplish this. 
%
% PASS/FAIL CRITERIA:
% ===================
% The Check analyzes the output variable of each TargetLink block in the model that has a 32-bit integer input.
% 
%     Review 1 (only for product and gain blocks): The output variable has an LSB scaling different from 1.
%     Review 2: The output variable has an arbitrary LSB scaling enabled.
%     Review 3: The output variable has the "saturate" option enabled.
% 
% Stateflow Objects are not analyzed. 
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_cgtl_4202(system, cmd_s)


































































































































































































































































































































