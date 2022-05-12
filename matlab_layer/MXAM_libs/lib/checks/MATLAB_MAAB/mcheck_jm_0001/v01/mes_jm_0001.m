%% Prohibited Simulink standard blocks inside controllers
%
% [result,cr_items,r_stats] = mes_jm_0001(system, cmd_s)
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
% Guideline Rule ID: jm_0001 (7.3.3.)
%
% DESCRIPTION:
% ============
% - Control algorithm models must be designed from discrete blocks.
% - The MathWorks 'Simulink Block Data Type Support' table provides
%   a list of blocks that support production code generation.
% - Use blocks that are listed as 'Code Generation Support'.
% - Do not use blocks that are listed as 'Not recommended for
%   production code' – see footnote 4 in the table.
% - In addition to the blocks defined by the above rule, do not use the
%   following blocks
%   
%   Sources:
%   Sin Wave, Pulse Generator, Random Number, Uniform Random Number,
%   Band-Limited White Noise
%  
%   Additional Blocks:
%   Sider Gain, Complex to Magnitude-Angle, Magnitude-Angle to Complex,
%   Complex to Real-Imag, Real-Imag to Complex, Polynomial, Matlab Function,
%   Goto Tag Visibility, Probe. 
%
% PASS/FAIL CRITERIA:
% ===================
% Each prohibited block receives a fail.
%
% SOLUTION:
% =========
% Do not use prohibited blocks. 
%
% FIX OPERATION:
% ==============
% No automatic fix available. 
%
% CHECK PARAMETERS:
% =================
% MAAB.jm_0001.ProhibitedBlocksByMatlab:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {... 
%        %Continuous
%        'Derivative', '';...
%        'Integrator', '';...
%        'SecondOrderIntegrator'     ''  ;...
%        'SubSystem'                 'PID 1dof';...
%        'SubSystem'                 'PID 2dof';...
%        'StateSpace', '';...
%        'TransferFcn', '';...
%        'TransportDelay', '';...
%        'VariableTimeDelay', '';...
%        'VariableTransportDelay', '';...
%        'ZeroPole', '';...
%        %Discontinuous
%        'HitCross','';...
%        %Model Verification
%        'SubSystem',    'Checks_Gradient';...
%        'SubSystem',    'Checks_SGap';...
%        'SubSystem',    'Checks_SRange';...
%        'SubSystem',   'Checks_Resolution';...
%        'SubSystem',    'Checks_SMin';...
%        'SubSystem',    'Checks_SMax';...
%        %Signal Attributes
%        'InitialCondition',  '';...
%        %Signal Routing
%        'SubSystem',    'Environment Controller';...
%        'SubSystem',    'Manual Switch';...
%        %Sources
%        'SubSystem',          'chirp';...
%        'Clock',              '';...
%        'SubSystem',          'Counter Free-Running';...
%        'SubSystem',          'Counter Limited';...
%        'DigitalClock',       '';...
%        'FromFile',           '';...
%        'SubSystem',         'Ramp';...
%        'SubSystem',          'Repeating table';...
%        'SubSystem',          'Repeating Sequence Interpolated';...
%        'SubSystem',          'Repeating Sequence Stair';...
%        'SignalGenerator',    '';...
%        'SubSystem',          'Sigbuilder block';...
%        'Step',               ''}
%   DESCRIPTION:
%       Cell array consists of two columns. Each row is a prohibit block.
%       The first column represents the blocktype, second column the 
%       masktype. 
%
% MAAB.jm_0001.ProhibitedBlocksByMAAB:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {....
%        %Sources
%        'SubSystem',                 'Band-Limited White Noise.';...
%        'DiscretePulseGenerator',    '';...                         
%        'RandomNumber',              '';...                         
%        'Sin',                       '';...                         
%        'UniformRandomNumber',       '';...
%        %Additional
%        'ComplexToMagnitudeAngle',    '';...           
%        'ComplexToRealImag',          '';...           
%        'GotoTagVisibility',          '';...           
%        'MATLABFcn',                  '';...  
%        'MagnitudeAngleToComplex',    '';...           
%        'Polyval',                    '';...           
%        'Probe',                      '';...           
%        'RealImagToComplex',          '';...           
%        'SubSystem',                  'Slider Gain'}
%   DESCRIPTION:
%       Cell array consists of two columns. Each row is a prohibit block.
%       The first column represents the blocktype, second column the 
%       masktype.
%
% NOTE:
% =====
% - use 'showblockdatatypetable' in the matlab command window to open the 
%   'Simulink Block Data Type Support'
% - this check based on the 'Simulink Block Data Type Support' published in
%   Matlab R2011b. List might be different for other versions.
% - Block 'Repeating Sequence Interpolated' and 'Repeating Sequence Stair'
%   have been added to this list, because they contain prohibited blocks.
% - prohibited sinks are considered by hd_0001
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:34CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jm_0001(system, cmd_s)






















































