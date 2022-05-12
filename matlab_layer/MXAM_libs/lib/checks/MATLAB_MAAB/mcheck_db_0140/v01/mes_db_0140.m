%% Display of basic block parameters string
%
% [result,cr_items,r_stats] = mes_db_0140(system, cmd_s)
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
% Control Algorithm Modeling Using Matlab,Simulink, and Stateflow
% Version 3.0
% MathWorks Automotive Advisory Board (MAAB)
% Guideline Rule ID: db_0140 (7.1.10.)
%
% DESCRIPTION:
% ============
% Important block parameters modified from the default values should be displayed.
% Note: The attribute string is one method to support the display of block
% parameters. The block annotation tab allows you to add the desired
% attribute information. As of R2011b, masking basic blocks is a supported
% method for displaying the information. This method is allowed if the base
% icon is distinguishable.
%
% PASS/FAIL CRITERIA:
% ===================
% Blocks that are defined in MAAB.db_0140.AttributeFormatString.BlockType
% and MAAB.db_0140.AttributeFormatString.TLBlockType that do not display
% each parameter of MAAB.db_0140.AttributeFormatString.Attribute and
% MAAB.db_0140.AttributeFormatString.TLAttribute respectively receives a
% fail. 
%
% SOLUTION:
% =========
% Show all the defined parameters in the attribute format string/mask of
% the block.
%
% FIX OPERATION:
% ==============
% For all blocks in MAAB.db_0140.AttributeFormatString.BlockType and
% MAAB.db_0140.AttributeFormatString.TLBlockType fix option will set the
% defined parameters in the attribute format string.
% For display option 'mask of block' no fix is available.
%
% CHECK PARAMETERS:
% =================
% MAAB.db_0140.AttributeFormatString.SLBlockType_Attribute:
%   DATATYPE:
%       cellstring
%   DEFAULT VALUE:
%       {'UnitDelay','<Initial=%<X0>>\n<Tsample=%<SampleTime>>';
%         'DiscreteIntegrator','<Initial=%<InitialCondition>>\n<Tsample=%<SampleTime>>\n<Limits=%<LowerSaturationLimit>/%<UpperSaturationLimit>(%<LimitOutput>)>';
%         'DiscreteZeroPole','<Tsample=%<SampleTime>>\n<Gain=%<Gain>>';
%         'DiscreteTransferFcn','<Tsample=%<SampleTime>>';
%         'DiscreteStateSpace','<Initial=%<X0>>\n<Tsample=%<SampleTime>>';
%         'Lookup','<Input=%<InputValues>>\n<Output=%<OutputValues>>';
%         'Lookup2D','<Row=%<RowIndex>>\n<Column=%<ColumnIndex>>\n<Table=%<OutputValues>>';
%         'Saturate','<Limits=%<LowerLimit>/%<UpperLimit>>';
%         'Quantizer','<Interval=%<QuantizationInterval>>';
%         'Backlash','<Initial=%<InitialOutput>,width=%<BacklashWidth>>';
%         'DeadZone','<Zone=%<LowerValue>/%<UpperValue>>';
%         'Relay','<Low=(%<OnSwitchValue>,%<OnOutputValue>)>\n<High=(%<OffSwitchValue>,%<OffOutputValue>)>';
%         'Switch','<Threshold=%<Threshold>>';
%         'Merge','<Initial=%<InitialOutput>>';
%         'EnablePort','<States=%<StatesWhenEnabling>>'}
%   DESCRIPTION:
%       Listet SL blocktypes and parameters that are considered by this check.
%
% MAAB.db_0140.AttributeFormatString.TLBlockType_Attribute_2:
%   DATATYPE:
%       cellstring
%   DEFAULT VALUE:
%       {'TL_UnitDelay','<Initial=%<X0>>\n<Tsample=%<dt>>';
%       'TL_DiscreteIntegrator','<Tsample=%<dt>>\n<Limits=%<Lower_limit>/%<upper_limit>>';
%       'TL_DiscreteTransferFcn','<Tsample=%<dt>>';
%       'TL_DiscreteStateSpace','<Initial=%<X0>>\n<Tsample=%<dt>>';
%       'TL_Lookup1D','<Input=%<u>>\n<Output=%<y>>';
%       'TL_Lookup2D','<Row=%<row>>\n<Column=%<col>>\n<Table=%<table>>';
%       'TL_Saturate','<Limits=%<lower_limit>/%<upper_limit>>';
%       'TL_Relay','<Low=(%<OnSwitchValue>,%<OnOutputValue>)>\n<High=(%<OffSwitchValue>,%<OffOutputValue>)>';
%       'TL_Switch','<Threshold=%<threshold>>';
%       'TL_Merge','<Initial=%<x0>>'}
%   DESCRIPTION:
%       Listet TL blocktypes and parameters that are considered by this check.
%
% % MAAB.db_0140.AttributeFormatString.TLBlockType_Attribute_3:
%   DATATYPE:
%       cellstring
%   DEFAULT VALUE:
%       {'TL_UnitDelay','<Initial=%<X0>>\n<Tsample=%<SampleTime>>';
%       'TL_DiscreteIntegrator','<Tsample=%<SampleTime>>\n<Limits=%<LowerSaturationLimit>/%<UpperSaturationLimit>>';
%       'TL_DiscreteTransferFcn','<Tsample=%<SampleTime>>';
%       'TL_DiscreteStateSpace','<Initial=%<X0>>\n<Tsample=%<SampleTime>>';
%       'TL_Lookup1D','<Input=%<BreakpointsForDimension1>>\n<Output=%<Table>>';
%       'TL_Lookup2D','<Row=%<BreakpointsForDimension1>>\n<Column=%<BreakpointsForDimension2>>\n<Table=%<table>>';
%       'TL_Saturate','<Limits=%<LowerLimit>/%<UpperLimit>>';
%       'TL_Relay','<Low=(%<OnSwitchValue>,%<OnOutputValue>)>\n<High=(%<OffSwitchValue>,%<OffOutputValue>)>';
%       'TL_Switch','<Threshold=%<Threshold>>';
%       'TL_Merge','<Initial=%<InitialOutput>>'}
%   DESCRIPTION:
%       Listet TL blocktypes and parameters that are considered by this check (TL version >=3).
%
% NOTE:
% =====
% Automatic fix is only valid for display option 'AFS' (attribute format
% string).
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:22CEST $
% Revision:     $Rev: 15302 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0140(system, cmd_s)
































































































































































































































































