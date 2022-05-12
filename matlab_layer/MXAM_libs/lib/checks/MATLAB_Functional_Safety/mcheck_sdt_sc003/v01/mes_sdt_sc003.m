%% Merge Blocks: Strong Data Typing of Inputs
%
% [result,cr_items,r_stats]=mes_sdt_sc003(system,cmd_s)
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
% For Simulink and TargetLink merge blocks, 
%  a) the 'Allow unequal port widths' property must not be checked.
%  b) Data types, scalings and ranges must be identical for all inports or
%     elements of inports.
%
% For Targetlink merge blocks
% c1) in a Targetlink model of versions prior to 2.2.1, bus inputs are
%     not allowed.
% c2) in a Targetlink model or versions 2.2.1 or newer, bus inputs are 
%     only allowed, if the block property 'inherit properties' is selected.
% 
% Inconsistent data types may lead to inefficient code, reduced accuracy or
% range violations. 
% ad a): TargetLink does not support this option for reasons of code 
%        efficiency.
% ad b) and d): If datatypes and scalings differ between the inports of the 
%        TL merge blocks, this error can not be detected by compiling/
%        updating the model.
%        If the 'inherit properties' option of a merge block is set, TL 
%        requires that all inputs have the same data type and scaling. This 
%        can only be tested in code generation. If this property is off, 
%        and data type of all inputs are not same, the inputs then are 
%        casted to the data type of the merge block, which can lead to 
%        overflow or underflow.
% ad c): bus-capable merge blocks were introduced with TL 2.21
%
% PASS/FAIL CRITERIA:
% ===================
% Any merge block will get a fail, if the 'Allow unequal port widths' 
% option is checked.
%
% Any Targelink merge block will get a fail, if
% - data types, scalings and ranges are not identical for all inports or 
%   elements of inports, OR
% - a bus signal is fed into the merge block, AND
%   - the TargetLink version is below 2.2.1, OR
%   - the merge blocks property 'inherit properties' is not set.
%
% SOLUTION:
% =========
% Adjust the diverging signal properties accordingly. Note, that adjusting 
% the data type of source blocks may require further, secondary adjustments
% involving other blocks. In contrast to TargetLink, the check shows 
% detailed information about inconsistencies, e.g., the sources with 
% deviating data types or scalings.
%
% FIX OPERATION:
% ==============
% The check may automatically disable the 'Allow unequal port widths' 
% option of all or interactively selected merge blocks. Moreover, the check 
% may assist the user to adjust the signal properties.
% 
% CHECK PARAMETERS:
% =================
% SDT.sc003.IgnoreTLDefaultDataTypes:
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
% NOTE:
% =====
% - In Simulink, the mismatch of data type of the input signals of merge 
%   blocks is reported, if the model is run or set into compile mode. 
%   Therefore, data type consistency of simulink merge blocks is not 
%   checked.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:09CEST $
% Revision:     $Rev: 6834 $
% *************************************************************************

function [result,cr_items,r_stats]=mes_sdt_sc003(system, cmd_s)






















































































































































































































































































































































































































































































































































































































































































































































































