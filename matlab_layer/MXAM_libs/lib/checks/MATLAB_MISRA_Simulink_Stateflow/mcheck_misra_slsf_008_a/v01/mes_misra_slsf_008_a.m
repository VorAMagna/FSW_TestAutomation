% MES check: misra_slsf_008_a - Avoidance of Saturation in Sumulink blocks
%
% function [result,cr_items,r_stats] = mes_misra_slsf_008_a(system, cmd_s)
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
% misra_slsf_008_a - Avoidance of Saturation in Sumulink blocks
%
% Simulink blocks that can be configured to saturate on overflow must not
% have the saturation property selected.
%
% Rationale: Hides functionality: if saturation is explicitly desired this
% is better expressed using an external saturation block.
%
% The block types which has a property SaturateOnIntegerOverflow will be
% checked.
% TargetLink blocks will not be cheked.
%
% PASS/FAIL CRITERIA:
% ================
% Every block which uses saturation in integer arithmetics via the
% 'Saturate on Integer overflow' option fails.
%
% Note: Blocks, which are component of a pre-build block(i.e. library 
% block), which uses the 'saturation' option, are not used. If the property 
% of the parent subsystem is changed, the corresponding property of the 
% considered block is changed as well. 
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:02CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_008_a(system, cmd_s) %#ok<INUSD>




















































































































































