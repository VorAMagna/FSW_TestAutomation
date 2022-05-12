%% Use of Constraint Limits
%
% [result,cr_items,r_stats] = mes_mes_cgtl_4203(system, cmd_s)
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
% TL_ADV_OPTI_CONSTRAINTS - Use of Constraint Limits
%
% It is sometimes advisable to specify TargetLink min and max values for
% block variables where those ranges are known in advance and where the
% user can guarantee that they will never be exceeded. This helps to
% increase code efficiency. Typical examples for the specification of
% TargetLink min and max values are for calibration parameters and Inports
% of a model. Please note that TargetLink takes those man/max values as
% user specified constraints but does nothing to ensure compliance with
% those values.
% 
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each TargetLink block in the model.
% 
%     Review: The block has empty min or max value fields and 'inherit properties' is either unavailable or set to 'off'.
% 
% The check result is passed if the review case does not apply.
%
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_cgtl_4203(system, cmd_s)

























































































































