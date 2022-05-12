% MES check: misra_slsf_008_b - Rounding Operation in Sumulink blocks
%
% function [result,cr_items,r_stats] = mes_misra_slsf_008_b(system, cmd_s)
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
% misra_slsf_008_b - Rounding Operation in Sumulink blocks
%
% Simulink blocks (other than the Rounding function block) that allow the
% rounding behaviour to be configured must be set to 'round towards zero'.
%
% Rationale: Hides functionality: if non-standard rounding is required this
% is better exprsssed using an external rounding block. 
% Provide consistent and accurate model behaviour similar to a normal
% typecast in C
%
% The block types which has a property with type enum and 'zero' 'floor'
% in the list of enum will be checked.
%
% PASS/FAIL CRITERIA:
% ================
% A block with rounding setting 'round towards zero' will get a pass,
% otherwise, it gets a fail.
%
% Note 1: TargetLink blocks will not be checked.
% Note 2: Rounding function blocks are not checked
% Note 3: If there are only non-integer input data types, the corresponding
%         block is ignored
% Note 4: Blocks, which are component of a subsystem, which uses the
% "integer rounding" option, are not used. If the property of the parent
% subsystem is changed, the corresponding property of the considered block
% is changed as well. 
% Example: Difference block of Simulink, if change the
% setting of the difference block, the setting of the sum block
% inside it will be changed.
%
% Note: see also ds_0100, here, the data type of the
% input and output are checked)
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:02CEST $
% Revision:     $Rev: 7172 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_008_b(system, cmd_s) %#ok<INUSD>
























































































































































































































