% MES check: ds_0040 - Use of the Data Type Conversion block
%
% function [result,cr_items,r_stats] = mes_tl_0015(system, cmd_s)
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
% ds_0040 - Use of the Data Type Conversion block
%
% The rounding functionality for the conversion of floating-point numbers to integers must not be used. 
% Moreover, the Saturate on integer overflow  option must not be used either. 
% Hence, it has to be ensured that neither saturation nor rounding operations occur.
%
% The Data Type Conversion block is completely ignored during code generation and only influences the
% model-in-the-loop simulation. The saturation functionality, and the different rounding modes, 
% which were mainly introduced with R14, are therefore ignored as well. 
% The user has to make sure that neither rounding nor saturation nor overflows occur.
%
% PASS/FAIL CRITERIA:
% ===================
% The check searches for all Data Type conversion blocks whose input signal
% is a floating point data type (single or double) and whose output 
% should be converted to a (fixed-point) integer data type.
% The user is informed, that for this case neither saturation nor rounding
% is perfmormed by TargetLink and that the user has to make sure for
% himself that appropriate saturation or rounding is guaranteed by means of
% additional modeling features.
%
% Example:
% ========
% If conversion from a floating point to an integer data type
% is required WITHIN THE TARGETLINK SUBSYSTEM, the user is adviced to:
% (a) use a TargetLink Inport block instead of a data type conversion
%     block. In this case, no additional variable is generated but          
%     appropriate saturation and rounding is ensured; or
% (b) select an integer data type with appropriate rounding and saturation
%     within the block the floating-point signal is connected to.
%
% NOTE:
% =====
% 1.) This check requires the model to be in COMPILE MODE!
% 2.) This check is only supposed to be run on TargetLink models
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:14CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0040(system, cmd_s) %#ok<INUSD>














































































































