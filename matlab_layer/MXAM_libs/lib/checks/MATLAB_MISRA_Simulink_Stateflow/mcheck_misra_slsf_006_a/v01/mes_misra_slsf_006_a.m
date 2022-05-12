% MES check: misra_slsf_006_a -  Block parameters
%
% function [result,cr_items,r_stats] = mes_misra_slsf_006_a(system, cmd_s)
%
% INPUT PARAMETERS:
% =================
%   system:  model/subsystem to be checked
%   cmd_s:   check options, syntax /<key>:<val>, for details See also
%   mes_jc_0061
%
% GUIDELINE:
% ==========
% Reference:
%   MISRA AC SLSF Modelling design and style guidelines for the
%   application of simulink and stateflow, MIRA limited, May 2009,
%   Ver 1.0, www.misra.org.uk
%
% Guideline Rule ID:
%   MISRA AC SLSF 006
%
% MES CHECK:
% ==========
% Block parameters evaluated at runtime as a numeric value must not contain:
% - Expressions
% - Data type conversions
% - Selection of rows or columns
% exceptions: number type conversions of a numerical constant like hex2dec('ff')
% may be used to underline the origin of a numerical parameter value.
%
% PASS/FAIL CRITERIA:
% ==================
% Block parameters do not contain expression, data type conversion and
% selection of rows or columns except for the cases given above .
%
% SOLUTION:
% =========
% Numeric manipulation (as intended with expressions), data type conversion
% or element selection (as intended with Selection of rows or columns) should
% explicitly be done outside the Parameter block within Simulink. Configurable
% parameters should be entered as named constants. In general parameters should
% not be passed to subsystems via mask parameters but using a Const block as
% external input to the subsystem.
%
% FIX OPERATION:
% ==============
% No automatic fix available. 
% 
% CHECK PARAMETERS:
% =================
% MISRA_SL_SF.AllowedConversionFcn:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'hex2dec','bin2dec'}
%   DESCRIPTION:
%       Each entry is an allowed number type conversion.
%
% NOTE:
% =====
% This check will call function 'mxam_misra_slsf_006_checkedParameters.m'.
% If this file does not exist or is not in Matlab path, an error will be
% returned. 
% This file returns a list of blocks and parameters that should be considered by 
% this check. Only parameters specified by mxam_misra_slsf_006_checkedParameters
% will be checked. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:00CEST $
% Revision:     $Rev: 15201 $
% *************************************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_006_a(system,cmd_s) 






















































































































































































































































































































































































































