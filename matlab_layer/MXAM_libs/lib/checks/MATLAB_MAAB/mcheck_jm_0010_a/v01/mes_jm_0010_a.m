%% Port names and corresponding signal names: Simulink Ports
%
% [result,cr_items,r_stats] = mes_jm_0010_a(system, cmd_s)
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
% Guideline Rule ID: jm_0010 (7.1.15.)
%
% DESCRIPTION:
% ============
% All input and output port names must be named and be identical to the 
% corresponding signal or bus label connected to the port, if one exists.
%
% Exception:
%  - When creating reusable blocks, the port name must be generic 
%    and visible with no label on the signal.
%  - When any combination of an Inport block, an Outport block, and any
%    other block have the same block name, a suffix or prefix must be 
%    used on the Inport and Outport block and it must be consistently used
%    throughout the model.
%
% PASS/FAIL CRITERIA:
% ===================
% A fail is given to each signal line that is 
% - connected to an inport or an outport and this port is not named
%   identical to the signal line 
% - connected to an inport and an outport and both ports are not named
%   identical to the corresponding signal line (plus one suffix or prefix)
% - connected to a reuseable subsystem and has a non-empty label
%
% Additionally a fail is given if not all used suffixes or prefixes are
% identical. 
%
% SOLUTION:
% =========
% Adapt signal or port names.
%
% FIX OPERATION:
% ==============
% No automatic fix available. 
%
% CHECK PARAMETERS:
% =================
% MAAB.jm_0010_a.IgnoreSimulinkPorts
%   DATATYPE: 
%       boolean
%   DEFAULT VALUE:
%       false (0)
%   DESCRIPTION:
%       If true, Simulink ports will be ignored and only TargetLink will be
%       considered by this check. 
% 
% NOTE:
% =====
% - In spite of the intuitiv assumption to search all ports and compare
%   their names with the connected signal line labels, this check is
%   implemented the other way around. Therefore the statistic might be 
%   differ from your assumed result: The checked lines are counted.
% - This check is one of two checks, that all together cover guideline
%   jm_0010. Part a) checks the labels of simulink ports and part b) checks 
%   labels of stateflow chart ports. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:36CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jm_0010_a(system, cmd_s)















































