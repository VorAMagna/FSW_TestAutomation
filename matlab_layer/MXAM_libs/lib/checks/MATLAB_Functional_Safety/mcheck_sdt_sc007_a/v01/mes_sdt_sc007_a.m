%% 	Definition TargetLink Function Interface - Inports
%
% [result,cr_items,r_stats] = mes_sdt_sc007_a(system, cmd_s)
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
% Corresponding Guideline: 2.1
%
% DESCRIPTION:
% ============
% A proper definition of a TargetLink Function Interface requires the following properties.
% 
% The Inports and Outports on the top level of a TargetLink Function Subsystem must be TargetLink ports.
% 
% A TargetLink port is considered to be an argument or a return value of a function if its "Class" is set to "FCN_ARG", "FCN_REF_ARG" or "FCN_RETURN".
% 
% If one of these classes is set the data type, scaling and value range of the following blocks must be consistent:
% 
%     All TargetLink Inports that provide arguments of a TargetLink function with their respective source.
%     All TargetLink Outports that define a return value of a TargetLink function with their respective destination. 
% 
% If a TargetLink function is configured as scaling invariant, only the data type of the ports need to be consistent with their respective source, but not the scaling information. 
% 
% If a TargetLink port is NOT to be considered as an argument or return value of a function, the class should still be selected explicitly, i.e., the class 'default' should not be used.
%
% PASS/FAIL CRITERIA:
% ===================
% The check inspects TargetLink inports and bus inports of each TargetLink function whose class is set to "FCN_ARG", "FCN_REF_ARG" or "FCN_RETURN". The data type, scaling (LSB and Offset) and value range of each TargetLink inport is compared with its source block.
% 
% Here, type inheritance is considered as well, while determining the data type of the source block.
% 
% In order to achieve this, the following criteria are sequentially checked for each TargetLink inport. If any one criterion does not hold, that inport and its source block are declared as failed or a warning is issued. After an erroneous criterion is detected, the remaining criteria are not further analyzed on that port and its source block.
% 
%     Failed 1: The Inport is not connected to a source block.
%     Failed 2: Matching Output port of Stateflow chart (source block) not found.
%     Failed 3: TargetLink data type is not set for the Inport or its source.
%     Failed 4: The base type of the TargetLink data type of the Inport or its source is not defined.
%     Failed 5: The base type of the Inport and its source are different.
%     Failed 6: The LSB value of the Inport and its source are different.
%     Failed 7: The offsets (biases) of the Inport and its source differ.
%     Failed 8: The LSB types (power of two vs. arbitrary) of the Inport and its source are different.
%     Failed 9: The user-defined value range constraints ("minimum" and/or "maximum") of the Inport and its source are different. Set the check parameter SDT.sc007_a.IgnoreUndefinedRanges to "true" to ignore this criterion.
%     Failed 10: The TargetLink function is configured as scaling invariant but the scaling propagation function is not defined in the scaling propagation edit field.
%     Warning: The source block does not support TargetLink data types. Use the check parameter SDT.sc007_a.IgnoreNonTLSources to deactivate this finding.
% 
% Note: TargetLink functions are subsystems which contain a TargetLink Function block. 
% %
% SOLUTION:
% =========
% Adjust the diverging signal properties accordingly. Please note that adjusting the data type of a source block may require further, secondary adjustments involving other blocks. In this case, re-run the check.
% 
%     Solution 1: Connect the Inport to a suitable source block. 
%     Solution 2: Adjust the properties of the Stateflow chart.
%     Solution 3: Specify a suitable TargetLink data type for the Inport or its source.
%     Solution 4: Specify a suitable base type for the Inport or its source.
%     Solution 5: Match the base types of the Inport and its source.
%     Solution 6: Match the LSB values of the Inport and its source.
%     Solution 7: Match the offsets of the Inport and its source.
%     Solution 8: Match the LSB types of the Inport and its source.
%     Solution 9: Match the range constraints of the Inport and its source.
%     Solution 10: Review the implementational specifications of the source block.
% 
% Add known range limits to the "min" and "max" values of the TargetLink and Stateflow output variables, whenever possible. Do not use the inheritance mechanism for the size and type of Stateflow data if you are working with TargetLink versions < 2.2. 
% 
% FIX OPERATION:
% ==============
% No automatically fix available.
%
% CHECK PARAMETERS:
% =================
% SDT.sc007_a.IgnoreNonTLSources:
%   DATATYPE:
%        boolean
%   DEFAULT VALUE:
%        false
%   DESCRIPTION:
%       If set to true, Simulink source blocks that are allowed to be used with TargetLink are not listed in the report. 
%       If set to false, the use of these Simulink source blocks raises a note (see point no. 10 in the check description).
%
% SDT.sc007_a.ValidBaseTypeCombinations:
%   DATATYPE:
%       cellstring
%   DEFAULT VALUE:
%       {'UInt8','Int16'; ...
%        'UInt16','Int32'}
%   DESCRIPTION:
%       Use the following format to specify each allowed pair of base types.
%       {<source base type 1>, <inport base type 1>;<source base type 2>, <inport base type 2>; ... }
%       The specification of  {'Int16','UInt8'}  states that if the data type of an Inport is defined with base type UInt8,
%       the data type of its source block should be defined with base type Int16 or UInt8.
%
% SDT.sc007_a.IgnoreTLDefaultDataTypes:
%   DATATYPE:
%       boolean
%   DEFAULT VALUE:
%       false
%   DESCRIPTION:
%       This parameter determines whether a TargetLink source block with a default class and/or unspecified data type/base type is ignored (parameter is set to true) or not ignored (parameter is set to false).
%       This applies to TargetLink Constants and Merge blocks whose output class is set to "default". Here, the datatype is specified by TargetLink at run-time/build-time. 
%       In MIL mode, the output data type of these blocks is set to int16. In SIL mode, the data type is adjusted to match the succeeding block.
% 
% SDT.sc007_a.IgnoreUndefinedRanges:
%   DATATYPE:
%       boolean
%   DEFAULT VALUE:
%       false (0)
%   DESCRIPTION:
%       If set to true, only those ranges are checked for consistency that are defined. 
%       If set to false, the check considers a pair of ranges to be inconsistent, if at least one range is not defined.
% 
% NOTE:
% =====
% - User-defined ranges of boolean and constant sources are not checked.
% - Consistency between TL-outports and their destination blocks is not
%   checked, because the destination block might need to change the data
%   type.
% - This check requires a full featured TL Version.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:12CEST $
% Revision:     $Rev: 7355 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_sdt_sc007_a(system,cmd_s)











































