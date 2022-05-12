%% Appropriate implementation of fundamental logical and numerical operations
%
% [result,cr_items,r_stats] = mes_na_0002(system, cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistic s on the check result
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>,
%
% REFERENCED GUIDELINE:
% =====================
% Control Algorithm Modeling Using Matlab,Simulink, and Stateflow
% Version 3.0
% MathWorks Automotive Advisory Board (MAAB)
% Guideline Rule ID: na_0002 (7.3.2.)
%
% DESCRIPTION:
% ============
% - Blocks that are intended to perform numerical operations must not be used
% to perform logical operations.
% - Blocks that are intended to perform logical operations must not be used
% to perform numerical operations.
% - A logical output should never be directly connected to the input of
% blocks that operate on numerical inputs.
% - A numerical output should never be connected to the input of blocks that
% operate on logical inputs.
% - The result of a logical expression fragment should never be operated on
% by a numerical operator.
% - This guideline for logical operations also applies to enumerated data
% types.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes the input data type of selected blocks in the model.
%   - Failed 1: The block requires a boolean signal as input, but its
%     source block outputs a numerical signal.
%   - Failed 2: The block requires a numerical signal as input, but its
%     source block outputs a boolean signal.
%   - Review 1: The block requires a boolean or numerical signal as input,
%     but its source block outputs an enumerated signal.
%   - Review 2: The block could not be checked because the output data type
%     of its source could not be evaluated. See Technical Notes for more
%     information.
%
% FIX OPERATION:
% ==============
% No automatic fix available
%
% CHECK PARAMETERS:
% =================
% MAAB.na_0002.BlocksRequiringBooleanInput:
%   DATATYPE:
%       cellstring
%   DEFAULT VALUE:
%         {'blocktype','Logic','all';...
%         'blocktype','Switch','2';...
%         'blocktype','CombinatorialLogic','1';...
%         'masktype','DFlipFlop','1';...
%         'masktype','TL_DFlipFlop','1';...
%         'masktype','DLatch','1';...
%         'masktype','TL_DLatch','1';...
%         'masktype','JKFlipFlop','1 3';...
%         'masktype','TL_JKFlipFlop','1 3';...
%         'masktype','SRFlipFlop','1 2';...
%         'masktype','TL_SRFlipFlop','1 2'}
%
%   DESCRIPTION:
%         The cell array consists of three colums. Each row defines the
%         property of a block (and the corresponding portnumber) that
%         require a  boolean input.
%         First column: Block property name. Allowed values: 'blocktype',
%         'masktype' or 'maskdescription'.
%         Second column: Block property value (e.g. 'Switch').
%         Third column: Port identification. Allowed values: port numbers
%         (e.g. '1 3'), 'all' (considers all inports), 'enable', 'trigger'
%         and 'ifaction'.
%
%         Example :
%         This entry defines that inport 2 of Switch blocks requires
%         a boolean input.
%         {'blocktype','Switch','2'}
%
% MAAB.na_0002.BlocksRequiringNumericalInput:
%   DATATYPE:
%       cellstring
%   DEFAULT VALUE:
%         {'blocktype','Derivative','1';...
%         'blocktype','Integrator','1';...
%         'blocktype','SecondOrderIntegrator','1';...
%         'blocktype','StateSpace','1';...
%         'blocktype','TransferFcn','1';...
%         'blocktype','ZeroPole','1';...
%         'blocktype','Backlash','1';...
%         'masktype','Coulombic and Viscous Friction','1';...
%         'masktype','Dead Zone Dynamic','1 2 3';...
%         'blocktype','DeadZone','1';...
%         'blocktype','HitCross','1';...
%         'blocktype','Quantizer','1';...
%         'masktype','Rate Limiter Dynamic','1 2 3';...
%         'blocktype','RateLimiter','1';...
%         'blocktype','Relay','1';...
%         'blocktype','Saturate','1';...
%         'masktype','Saturation Dynamic','1 2 3';...
%         'masktype','Wrap To Zero','1';...
%         'masktype','Difference','1';...
%         'masktype','Discrete Derivative','1';...
%         'blocktype','DiscreteFilter','1';...
%         'blocktype','DiscreteFir','all';...
%         'blocktype','DiscreteIntegrator','all';...
%         'blocktype','DiscreteStateSpace','1';...
%         'blocktype','DiscreteTransferFcn','1';...
%         'blocktype','DiscreteZeroPole','1';...
%         'masktype','First Order Transfer Fcn','1';...
%         'masktype','First-Order Hold','1';...
%         'masktype','Lead or Lag Compensator','1';...
%         'masktype','PID 1dof','all';...
%         'masktype','PID 2dof','all';...
%         'masktype','Transfer Fcn Real Zero','1';...
%         'masktype','Compare To Constant','1';...
%         'masktype','Compare To Zero','1';...
%         'masktype','Detect Change','1';...
%         'masktype','Detect Decrease','1';...
%         'masktype','Detect Fall Negative','1';...
%         'masktype','Detect Fall Nonpositive','1';...
%         'masktype','Detect Increase','1';...
%         'masktype','Detect Rise Nonnegative','1';...
%         'masktype','Detect Rise Positive','1';...
%         'masktype','Extract Bits','1';...
%         'masktype','TL_ExtractBits','1';...
%         'masktype','Interval Test','1';...
%         'masktype','Interval Test Dynamic','1 2 3';...
%         'blocktype','Interpolation_n-D','all';...
%         'blocktype','LookupNDDirect','all';...
%         'blocktype','Lookup_n-D','all';...
%         'blocktype','PreLookup','all';...
%         'masktype','Sine and Cosine','1';...
%         'blocktype','Abs','1';...
%         'masktype','Algebraic Constraint','1';...
%         'blocktype','Bias','1';...
%         'blocktype','ComplexToMagnitudeAngle','1';...
%         'blocktype','ComplexToRealImag','1';...
%         'blocktype','DotProduct','1';...
%         'blocktype','Gain','1';...
%         'blocktype','MagnitudeAngleToComplex','all';...
%         'blocktype','Math','all';...
%         'blocktype','MinMax','all';...
%         'masktype','MinMax Running Resettable','1 2';...
%         'blocktype','Polyval','1';...
%         'blocktype','Product','all';...
%         'blocktype','RealImagToComplex','all';...
%         'blocktype','Rounding','all';...
%         'blocktype','SampleTimeMath','1';...
%         'blocktype','Signum','1';...
%         'blocktype','Sin','all';...
%         'masktype','Slider Gain','all';...
%         'blocktype','Sqrt','1';...
%         'blocktype','Sum','all';...
%         'blocktype','Trigonometry','1';...
%         'blocktype','UnaryMinus','1';...
%         'masktype','Decrement Time To Zero','1';...
%         'masktype','Decrement To Zero','1';...
%         'masktype','Fixed-Point State-Space','1';...
%         'masktype','Real World Value Decrement','1';...
%         'masktype','Real World Value Increment','1';...
%         'masktype','Stored Integer Value Decrement','1';...
%         'masktype','Stored Integer Value Increment','1';...
%         'masktype','Transfer Fcn Direct Form II','1';...
%         'masktype','Transfer Fcn Direct Form II Time Varying','1 2 3';...
%         'masktype','Discrete Transfer Function with Initial Outputs','1';...
%         'masktype','Discrete Transfer Function with Initial States','1';...
%         'masktype','Discrete Zero-Pole with Initial Outputs','1';...
%         'masktype','Discrete Zero-Pole with Initial States','1';...
%         'masktype','IdealADC','1';...
%         'masktype','State-Space with Initial Outputs','1';...
%         'masktype','Transfer Function with Initial Outputs','1';...
%         'masktype','Transfer Function with Initial States','1';...
%         'masktype','Zero-Pole with Initial Outputs','1';...
%         'masktype','Zero-Pole with Initial States','1';...
%         'masktype', 'Derivative for linearization', '1';...
%         'masktype','Cart2Polar','1 2';...
%         'masktype','Cart2Sph','1 2 3';...
%         'masktype','CelsiusToFahrenheit','1';...
%         'masktype','DegreesToRadians','1';...
%         'masktype','FahrenheitToCelsius','1';...
%         'masktype','Polar2Cart','1 2';...
%         'masktype','RadiansToDegrees','1';...
%         'masktype','Sph2Cart','1 2 3'}
%
%   DESCRIPTION:
%         The cell array consists of three colums. Each row defines the
%         property of a block (and the corresponding portnumber) that
%         requires a numerical input.
%         First column:   Block property name. Allowed values: 'blocktype',
%         'masktype' or 'maskdescription'.
%         Second column:  Block property value (e.g. 'Switch').
%         Third column:  Port identification. Allowed values: port numbers
%         (e.g. '1 3'), 'all' (considers all inports), 'enable', 'trigger'
%         and 'ifaction'.
%
%         Example :
%         This entry defines that all inports of Sum blocks require
%         a numerical input.
%         {'blocktype' 'Sum' 'all'}
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0002(system, cmd_s)







































