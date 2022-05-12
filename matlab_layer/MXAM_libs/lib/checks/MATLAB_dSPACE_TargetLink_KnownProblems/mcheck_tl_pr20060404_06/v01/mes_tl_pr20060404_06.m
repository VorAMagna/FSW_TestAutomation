% MES check: tl_hc_20060404_06 - Unintentional optimization of relational operation
%
% function [result,cr_items,r_stats] = mes_tl_hc_20060404_06(system, cmd_s)
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
% mes_tl_hc_20060404_06 - Unintentional optimization of relational operation
% For the generated code the TargetLink code generator simplifies a
% relational or logical operation between a generated C code variable and a
% constant value (which maybe a TargetLink so-called default constant or a
% pure Simulink/Stateflow block parameter value), if  
% - the variable and constant value are combined for a Relation, Logic,
% Switch or If block code pattern or a Stateflow expression AND - the
% variable's variable class does not specify a macro (i.e. "Macro" property
% is set to "off") AND only for relations: - the variable's user-specified
% Min/Max constraint limits do not contain the constant value OR - the
% variable class specifies the variable to be const via the "Const"
% property set to "on" AND - the "Info" property of this variable class is
% not set to "adjustable", "readwrite" or "offline_readwrite". 
% only for logic: - the constant value at the second input port already
% defines the result, i.e. the variable's value does not influence the
% result.
% 
% In this case the relational or logical operation is simplified and
% possibly further depending code is erased from the production code
% (according to the operation and the values involved) even if the variable
% class has the "Optimization" property not set to "ERASABLE" or specifies
% the variable to be volatile by the "Volatile" property set to "on" (note
% that for TargetLink the C qualifier "volatile" does not influence
% optimization of code generation directly; to specify that the value of a
% variable is changeable and this needs to be considered for optimizing the
% production code during code generation, TargetLink provides the "Info"
% and "Optimization" properties at VariableClass objects).
% 
% Usually this optimization is wished. But in rare cases (if reading the
% variable leads to a desired side-effect), this may not be what the user
% intended. Then the model/settings can be changed as stated in the
% workaround to obtain the generated code including the operation and its
% depended code.
% 
% For example the simplification appears in a model situation where a
% Constant block drives the input of an If block and the variable class is
% set to "CONST" from the pre-defined DD file templates. In this case one
% or more of the If-Action subsystems are erased from the generated code,
% depending on the condition. Another modeling case is if one input of the
% Logical Operator block is a default constant 0 or 1 and thus the result
% is always true or false.
% 
% Workaround: 1) Do not specify or correct the Min/Max constraint limits
% for the variable. Or 2) Set the "Info" property of the associated
% variable class to "adjustable" (does not appear in the generated A2L
% file) or "readwrite" (appears in the generated A2L file for calibration).
% Or 3) unset the "Const" property in the associated variable class. Or 4)
% specify a variable instead of a constant value (e.g. change the variable
% class of the Switch block Threshold, or for the If block add another
% input).
% 
% Note that for logical operations only workaround 4 is possible.
%
% SOLUTION:
% =========
% 1) Do not specify or correct the Min/Max constraint limits for the
% variable. Or 2) Set the "Info" property of the associated variable class
% to "adjustable" (does not appear in the generated A2L file) or
% "readwrite" (appears in the generated A2L file for calibration). Or 3)
% unset the "Const" property in the associated variable class. Or 4)
% specify a variable instead of a constant value (e.g. change the variable
% class of the Switch block Threshold, or for the If block add another
% input).
%  
% Note that for logical operations only workaround 4 is possible.

function [result,cr_items,r_stats] =mes_tl_pr20060404_06(system, cmd_s)



















































































































































































































































































































































































































































































