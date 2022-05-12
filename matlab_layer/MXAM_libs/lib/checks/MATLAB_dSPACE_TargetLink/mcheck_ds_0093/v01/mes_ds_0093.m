% MES check: ds_0093 - Diagnostics Settings
%
% function [result,cr_items,r_stats] = mes_ds_0093(system,cmd_s)
%
% RETURN PARAMETERS:
% ==================
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
%
% INPUT PARAMETERS:
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>, for details See also mes_jc_0061
%
% MES CHECK:
% ==========
% ds_0093 - Diagnostics Settings
%
% This test checks the following parameters in the Simulink Diagnostics
% Settings menu for code generation with TargetLink:
% Parameter                     required setting (default)
% --------------------------------------------------------
% Algebraic loop                Error
% Block Priority Violation      Error
% Bounds checking               none
% SingleTask rate transition    Warning
% Check for singular matrix     Warning
% Consistency checking          none
% Underspecified data types     Warning (checked for R14 only)
% Unneeded type conversion      Warning
% Signal label mismatch         Warning
% Unconnected block input       Error
% Unconnected block output      Error
% Unconnected line              Error
% Vector/Matrix conversions     Warning
%
% PASS/FAIL CRITERIA:
% ===================
% A pass is issued if the diagnostics settings are set according to the
% guideline. For each deviation, a fail is issued against the top subsystem
%
% INFO:
% =====
% Settings can be set from the Simulation Parameters Dialog Box
%
% This test is for a model - Subsystem filters and overrides have no
% effect.
%
% The names of the simulink diagnostic settings corresponds to the ones in
% Matlab R2009b. They might differ in higer versions.
%
% CHECK PARAMETERS:
% =================
% dSPACE.TargetLink.DiagnosticSettings:
%   DATATYPE:
%       cellstring
%   DEFAULT VALUE:
%       {'AlgebraicLoopMsg','error','Algebraic Loop';...
%        'ArrayBoundsChecking','none','Bounds checking';...
%        'BlockPriorityViolationMsg', 'error','Block priority violation';...
%        'ConsistencyChecking','none','Consistency checking';...
%        'SingleTaskRateTransMsg','warning','SingleTask rate transition';...
%        'CheckForMatrixSingularity','warning','Division by singular matrix';...
%        'UnderSpecifiedDataTypeMsg','warning','Underspecified data types';...
%        'UnnecessaryDatatypeConvMsg','warning','Unneeded type conversion';...
%        'VectorMatrixConversionMsg', 'warning','Vector/Matrix conversions';...
%        'SignalLabelMismatchMsg','warning','Signal label mismatch';...
%        'UnconnectedInputMsg','error','Unconnected block input';...
%        'UnconnectedOutputMsg','error','Unconnected block output';...
%        'UnconnectedLineMsg','error','Unconnected line'}
%   DESCRIPTION:
%       Each row represents a diagnostic setting to be checked.
%       First column:   setting parameter name
%       Second column:  default setting
%       Third column:   description for report message
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:25CEST $
% Revision:     $Rev: 6835 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0093(varargin)






























































