% MES check: misra_slsf_037_b - Avoidance of duplicate stateflow data names in different scopes
%
% function [result,cr_items,r_stats] = mes_misra_slsf_037_b(system, cmd_s)
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
% misra_slsf_037_b - Non duplicated stateflow data name in different scopes
% Any local data item name must not be used in different scopes within one state machine.
%
% RATIONALE:
% ==========
% All objects should be uniquely named to avoid misinterpretation.
%
% PASS/FAIL CRITERIA:
% ================
% If more than one local data of a chart has same name, the data receives a
% fail.
%
% NOTE:
% =====
% This fail criteria is sufficient, because stateflow does not allow two
% datas(no matter which scope) with identical names at the same chart
% level.
%
% SOLUTION:
% =========
% Move local variable declarations to state chart level and resolve name
% conflicts if necessary
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:26CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_037_b(system, cmd_s) %#ok<STOUT,INUSD>














































































































