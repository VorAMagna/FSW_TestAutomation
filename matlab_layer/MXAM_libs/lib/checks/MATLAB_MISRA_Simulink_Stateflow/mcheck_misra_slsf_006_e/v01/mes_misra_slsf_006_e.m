% MES check: misra_slsf_006_a -  Block parameters
% 
% function [result,cr_items,r_stats] = mes_misra_slsf_006_e(system, cmd_s)
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
% Scope of implementation:
%   part E
%
%
% MES CHECK: 
% ==========
% Masked sub-systems must not be used to pass parameters to the underlying 
% Simulink model. exceptions:
% - Basic Simulink blocks
% - Third party subsystems where the underlying Simulink model is not available 
%   to the user
%
% Each project must define a restricted list of basic blocks for which it is 
% allowed to enter tunable parameters.
%
% PASS CRITERIA:
% ==================
% Masked sub-systems are not used to pass parameters to the underlying 
% Simulink model with the exception of third party products or simple Simulink 
% Basic Blocks.
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
% PARAMETER
% =========
% MISRA_SL_SF.misra_slsf_006_e.LibrariesToIgnore:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'simulink', 'sflib', 'tllib'}
%   DESCRIPTION:
%       Subsystems in these libraries are treated as basic blocks. 
%
% NOTE: 
% =====
% - It is not possible to mark one block as a basic block. It is only
%   possible to add the corresponding library to the parameter
% - A subsystem within the considered model is treated as a basic block if 
%   its masktype and its maskvariables are equal to the corresponding fields
%   of one masked subsystem in the specified libraries.
% - Subsystems with empty 'masktype' are checked in any case. 
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:01CEST $
% Revision:     $Rev: 6836 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_006_e(system,cmd_s) 











































































































































































































