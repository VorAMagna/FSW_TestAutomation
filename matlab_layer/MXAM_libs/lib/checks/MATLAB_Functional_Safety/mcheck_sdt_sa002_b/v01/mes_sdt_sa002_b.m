%% Output Type of Logical and Relational Operator Blocks - Relational Operator Blocks
%
% [result,cr_items,r_stats] = mes_sdt_sa002_b(system, cmd_s)
%
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
% sdt_sa002_b - Output Type of Logical and Relational Operator Blocks -
% Relational Operator Blocks
%
% The "Output data type" property of each Relational Operator block must be
% either set to "Boolean" or "Logical". If "Logical" is selected, the
% configuration parameter "Implement logic signals as Boolean data (vs.
% double)" of the model must also be checked (see the "Optimization"
% section).
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes the output data type of each Simulink Relational Operator
% block in the model.
%     Failed1: the data type is neither set to Boolean nor to Logical.
%     Failed2: the data type is set to "Logical" and the model
%     configuration parameter "Implement logic signals as Boolean data (vs.
%     double)" is not selected.
% The check result is passed if all failed cases do not apply.
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
%
% NOTE:
% =====
% - The check analyzes only Simulink Relational Operator blocks because
% TargetLink only supports Boolean data types for the output signal of
% TargetLink Logical Operator blocks.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:04CEST $
% Revision:     $Rev: 6967 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_sdt_sa002_b(system, cmd_s)





















































































































































