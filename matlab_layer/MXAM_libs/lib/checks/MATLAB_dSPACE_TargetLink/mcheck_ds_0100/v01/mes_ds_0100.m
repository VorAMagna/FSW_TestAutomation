% MES check: ds_0100 - Avoidance of Rounding Operations
%
% function [result,cr_items,r_stats] = mes_ds_0100(system, cmd_s)
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
% DESCRIPTION: 
% ============
% ds_0100 - Avoidance of Rounding Operations
%
% Rounding operations within integer calculations via the "Round Integer
% Calculation towards" option should be avoided. If a rounding function is
% required, the "Rounding Function" has to be used. 
% Note: 
% A rounding operation appears if integer data types are specified for
% a block in which floating-point values are used also, or if the results
% of integer operations are not displayable as integer variables (for
% instance divisions).
%
% Example:
% --------
% A rounding operation is performed when the inports of e.g. a Sum-Block are
% non-whole-number floating-point data types (double or single, e.g. "0.3")
% and the outport of the Sum-Block is an integer data type (e.g. int16). In
% this case, the rounding function should be used instead. More precisely,
% the floating-point arithmetic should be performed first. The result of
% this operation should then be rounded to integer with the Rounding
% function.
% (A) Example of appropriate use of rounding functionality:
%
% Signal_1(double)---|
%                    +---> result(double)-->|floor|-->result_rnd(int)
% Signal_2(double)---|
%
% Counter Example:
% ----------------
% (B) Example of improper use of rounding functionality:
%
% Signal_1(double)---|
%                    +---> result(int)
% Signal_2(double)---|
%
% Remark:
% -------
% The semantics on how the rounding operation is performed is partially 
% intransparent and block-specific in Simulink. 
% TargetLink does not emulate the different rounding methods in integer caluculations.
%
% GUIDELINE:
% ==========
% MATLAB/Simulink/Stateflow and TargetLink modelling guidelines version 3
% dSPACE GmbH, 2010, chapter 8.6
%
% CHECKED ITEMS:
% ==============
% All simulink blocks for which the rounding method
% "Round Integer Calculation towards ... " is specified will be checked.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each block which supports rounding operations.
%     - Failed: If the inports of the block are floating point data types
%               while the outport is an integer data type.
% The check result is passed if all failed cases do not apply.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:27CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0100(system, cmd_s) %#ok<INUSD>





















































































































































































































































































