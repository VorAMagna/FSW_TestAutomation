%% Similar block types on the model levels
%
% [result,cr_items,r_stats] = mes_db_0143(system, cmd_s)
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
% Guideline Rule ID: db_0143 (5.2.1.)
%
% DESCRIPTION:
% ============
% To allow partitioning of the model into discreet units, every level of a 
% model must be designed with building blocks of the same type (i.e. only 
% Subsystem or only basic blocks). The blocks listed in this rule are used 
% for signal routing. You can place them at any level of the model.
% 
% Blocks which can be placed on every model level:
% Inport
% Outport
% Enable (not on the models root-level)
% Trigger (not on the models root-level)
% Mux
% Demux
% Bus Selector
% Bus Creator
% Selector
% Ground
% Terminator
% From
% Goto
% Switch
% Multiport Switch
% Merge
% Unit Delay
% Rate Transition
% Type Conversion
% Data Store Memory
% If block
% Case block
%
% PASS/FAIL CRITERIA:
% ===================
% A pass is given to subsystems which contain only the same type of blocks
% or blocks that can be placed on every model level. Otherwise, a fail is
% given.
%
% SOLUTION:
% =========
% Only use blocks of the same type per level or extend parameter 
% MAAB.db_0143.GlobalAllowedBlockTypes with blocktypes that should be 
% allowed on every level. 
%
% FIX OPERATION:
% ==============
% No automatic fix available. 
%
% CHECK PARAMETERS:
% =================
% MAAB.db_0143.GlobalAllowedBlockTypes:
% DATATYPE: 
%       cellstring
% DEFAULT VALUE:
%       {'Inport','Outport','EnablePort','TriggerPort','Ground',...
%        'Terminator','Mux','Demux','BusCreator','BusSelector',...
%        'Selector','Merge','From','Goto','Switch', ...
%        'MultiPortSwitch','Constant','UnitDelay', ...
%        'DataTypeConversion','DataStoreMemory','If',...
%        'SwitchCase','RateTransition'}
% DESCRIPTION: 
%        Contains blocktypes of blocks, that are allowed on every level.
%        Syntax- {'blocktype1','blocktype2','blocktype3'....blocktypeN}
%        Here 'blocktype1' is the blocktype of 'block1', 'blocktype2' is the blocktype of 'block2' and so on. 
%  =================
% MAAB.db_0143.GlobalAllowedMaskTypes
% DATATYPE: 
%        cellstring
% DEFAULT VALUE:
%        {''}
% DESCRIPTION: 
%        Contains masktypes of blocks, that are allowed on every level.
%        Syntax- {'masktype1','masktype2','masktype3'....masktypeN}
%        Here 'mastype1' is the masktype of 'block1', 'masktype2' is the masktype of 'block2' and so on.
%% NOTE:
% =====
% 'Same type' differentiate between subsystems and basic blocks, considering
%  blocktypes 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:24CEST $
% Revision:     $Rev: 7122 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0143(system, cmd_s)












































