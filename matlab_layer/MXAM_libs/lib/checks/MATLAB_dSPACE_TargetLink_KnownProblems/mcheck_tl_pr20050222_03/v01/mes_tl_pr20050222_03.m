%% Variable Merge for Block Variables of Struct Types
%
% [result,cr_items,r_stats] = mes_tl_pr20050222_03(system, cmd_s)
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
% tl_pr20050222_03 - Variable Merge for Block Variables of Struct Types
% If mergeable variable classes and fixed names are specified for block 
% variables with struct types, then the TargetLink code generator merges 
% the struct variables in any case even if they have different initial values.
%
% TargetLink implements block variables of struct types for the following 
% blocks:
%   - Look-Up Table blocks (1-D and 2-D): TargetLink implements the map struct 
%       as a struct variable (for newer TL versions only with "Generate map struct" 
%       option being enabled) with the name specified by the map.name block property.
%   - Discrete State Space: TargetLink implements the state space matrices 
%       as a struct variable if "Keep matrix structure" is disabled. 
%       The struct variable's name is derived from the name specifications 
%       of all matrices A, B, C, and D. For example, specifying the same 
%       fixed name for A, B, C, and D results in a struct variable of the same name.
%   - Discrete Filter: TargetLink implements the coefficients 
%       as a struct variable if "Keep vector structure" is disabled. 
%       The name of the struct variable is derived from the name specifications 
%       of Numerator and Denominator. For example, specifying the same fixed 
%       name for Numerator and Denominator results in a struct variable of the same name.
%   - Discrete Transfer Function: TargetLink implements the coefficients 
%       as a struct variable if "Keep vector structure" is disabled. 
%       The name of the struct variable is derived from the name specifications 
%       of Numerator and Denominator. For example, specifying the same fixed 
%       name for Numerator and Denominator results in a struct variable of the same name. 
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each Look-Up Table, Discrete State-Space,
% Discrete Filter and Discrete Transfer Function block in the model.
%     Passed1: None of the mentioned blocks are in the model.
%     Passed2: For Look-Up Table blocks (1-D and 2-D) the option 'Generate map struct' is disabled.
%     Passed3: For Discrete State-Space blocks the option 'Keep matrix structure' is enabled.
%     Passed4: For Discrete Filter blocks the option 'Keep vector structure' is enabled.
%     Passed5: For Discrete Transfer Function blocks the option 'Keep vector structure' is enabled.
%     Passed6: The referenced variable class is not mergeable.
%     Passed7: The name of the variable in the generated production code is not used multiple times.
% The check result is Review if all passed cases do not apply.
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:36CEST $
% Revision:     $Rev: 15223 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_tl_pr20050222_03(system, cmd_s)














































































































































































































































