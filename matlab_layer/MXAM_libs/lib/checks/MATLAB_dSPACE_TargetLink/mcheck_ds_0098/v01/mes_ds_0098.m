% MES check: ds_0098 - Avoidance of Overflows
%
% function [result,cr_items,r_stats] = mes_ds_0098(system, cmd_s)
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
% ds_0098 - Avoidance of Overflows
%
%  For all integer operations, the specified value ranges for the output
%  data type and for intermediate variables have to be sufficient to avoid
%  overflows. In particular, overflows must not be used deliberately.
%
%  Remark:
%
%  Basically, overflows must not be used as a stylistic element because they
%  are highly implementation-specific and constitute a highly nontransparent
%  modeling style. Overflows (and underflows) are dependent on the size and
%  kind of the data types used, whose use is nontransparent and block-dependent
%  in Simulink, particularly for intermediate results.
%  Moreover, TargetLink does not emulate the over/underflow behavior in Simulink.
%  In the TargetLink blockset stand-alone, over- and underflows are avoided in
%  principle by saturation.
%
% PASS/Fail CRITERIA:
% ================
% A pass is given for all Sum and Product blocks if output data type have
% sufficient range, otherwise, a fail will be give.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:26CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0098(system, cmd_s) %#ok<INUSD>



















































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































