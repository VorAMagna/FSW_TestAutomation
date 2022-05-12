%% Logical Operator Blocks: Strong Data Typing of Inputs
%
% [result,cr_items,r_stats] =  mes_sdt_sa001(system,cmd_s)
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
% REFERENCED GUIDELINE:
% =====================
% MES Functional Safety Guidelines
% Release 1.7 (21 June 2013)
% Corresponding Guideline: 2.2
%
% DESCRIPTION:
% ============
% All inputs of Simulink and TargetLink logical operator blocks
% (combinatorial logic, Logical Operator) must have a boolean data type.
% Therefore,
% a) for Simulink blocks, the block option 'require all inports to have the
%    same data type' must be set.
% b) for Targetlink blocks, all inputs must have a boolean base data type.
%
% PASS/FAIL CRITERIA:
% ===================
% All Simulink Logic blocks receive a pass, if the block option 'Require
% all inputs and output to have the same data type' is set.
% All Targetlink Logical Operator block receive a pass, if the base data
% type of all inputs is Boolean.
%
% SOLUTION:
% =========
% Activate the block option 'Require all inputs to have the same data type'
% Adjust the data types of all inputs to a boolean type.
%
% FIX OPERATION:
% ==============
% Option 'Require all inputs to have the same data type' will be enabled.
%
% CHECK PARAMETERS:
% =================
% SDT.sa001.IgnoreTLDefaultDataTypes:
%   DATATYPE:
%       boolean
%   DEFAULT VALUE:
%       true (1)
%   DESCRIPTION:
%       Determines if TargetLink sources with a default class and/or
%       unspecified data type/base type are ignored.
%       This applies to TargetLink Constants and Merge blocks with class =
%       'default', for which the datatype is specified by TargetLink at
%       run-time/build-time. In MIL mode, these blocks will have output
%       int16, in SIL mode, the type is adjusted to match the following
%       block.
%
% SDT.sa001.AllowedInputBaseTypes:
%   DATATYPE:
%       cellstring
%   DEFAULT VALUE:
%       {''}
%   DESCRIPTION:
%       Each entry specifies an allowed data base type as input signal for
%       logical operators.
%
% NOTE:
% =====
% - Warnings are raised for unconnected inputs
% - The check does not test the input data types of Simulink logical blocks,
%   because with the option 'require all inports to have same data type'
%   set, this requirement is accomplished by the check sdt_sa002, which
%   will detect all blocks with non-boolean inputs.
% - For TL logical operator blocks of version 3.0 or higher, the property
%   'require all inports to have the same data type' exists, but it is not
%   sufficient to detect different TL data types.
% - In order to access Simulink data types, the model must compilable.
%   However, for TargetLink models, the data types can be determined
%   without compiling the model. Therefore, the check only compiles the
%   model on demand (and the check property require_compiled_model is not
%   set).
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:03CEST $
% Revision:     $Rev: 6834 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_sdt_sa001(system, cmd_s)





































































































































































































































































































































































































































































