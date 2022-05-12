%% [s_enumDT,s_error] = mes_getTLEnumDataType(s_dataType)
%
% DESCRIPTION:
% ============
% This function returns the TargetLink data type used for the implementation of
% enumeration. 
% Only helpful when basetype = 'enum'.
% Note: The default data type for Enum implementation in TL is Int32 (For TL 4.2
% and higher, typedef = IMPLICIT_ENUM, and EnumImplementation = Macro).
% Unfortunately, the user can change this behavior with a libmap M-file.
%
% INPUT PARAMETERS:
% =================
% - s_dataType:	String, base data type of the output variable of the retrieved
% block.
%
% RETURN VALUES:
% ==============
% - s_enumDT:	String, base data type of the implementation of
% enumeration. The return string 'Enum' should be understood as the C enum.
% - s_error:    String, TargetLink error message.
%
% EXAMPLES:
% =========
%   [s_enumDT,s_error] = mes_getTLEnumDataType(r_dInfo.datatype)
%
% PUBLISHING INFORMATION
% ****************************************************************
% Copyright:  Model Engineering Solutions
% ****************************************************************

function [s_enumDT,s_error] = mes_getTLEnumDataType(s_dataType)































































