%% Display of block names
%
% [result,cr_items,r_stats] = mes_jc_0061(system, cmd_s)
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
% Guideline Rule ID: jc_0061 (7.1.8.)
%
% DESCRIPTION:
% ============
% Display a block name when it provides descriptive information.
% The block name should not be displayed if the block function is known and
% understood from the block appearance.
%
% Blocks of the second category are:
% Logical Operator, Product, Relational Operator, Saturation, Switch
% Unit Delay, MinMax, Terminator, Model, From, Goto, Merge, Multiport
% Switch, SQRT, Ground
%
% PASS/FAIL CRITERIA:
% ===================
% A fail is given to each block of MAAB.jc_0061.Blocks2Check with property
% ShowName set to 'on'. 
%
% SOLUTION:
% =========
% Switch the name of each identified block off. You can use the Simulink
% Paramer 'ShowName'.
%
% FIX OPERATION:
% ==============
% Parameter 'ShowName' will be set to 'off' for each block that has a
% blocktype which coincide with one entry of parameter
% MAAB.jc_0061.Blocks2Check.
%
% CHECK PARAMETERS:
% =================
% MAAB.jc_0061.Blocks2Check:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'BlockType' 'From';
%        'BlockType' 'Goto';
%        'BlockType' 'Ground';
%        'BlockType' 'Logic';
%        'BlockType' 'Merge';
%        'BlockType' 'MinMax';
%        'BlockType' 'MultiPortSwitch';
%        'BlockType' 'Product';
%        'BlockType' 'RelationalOperator';
%        'BlockType' 'Saturate';
%        'BlockType' 'Switch';
%        'BlockType' 'Terminator';                
%        'BlockType' 'ModelReference';
%        'BlockType' 'Sqrt';
%        'BlockType' 'UnitDelay'}
%   DESCRIPTION:
%       Each row of Blocks2Check represents a block defined by key-value 
%       pairs of block properties. Number of key-value pairs is not 
%       limited. key-value pairs must be valid. 
%       Example: 
%       cs_Blocks2Check = {'BlockType' 'Merge' 'MaskType' '';
%                          'BlockType' 'Merge' 'MaskType' 'TL_Merge'};
%
% NOTE:
% =====
% To switch ShowName to 'off', it is possible to use the GUI or the
% Simulink API. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:26CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jc_0061(system, cmd_s)



















































