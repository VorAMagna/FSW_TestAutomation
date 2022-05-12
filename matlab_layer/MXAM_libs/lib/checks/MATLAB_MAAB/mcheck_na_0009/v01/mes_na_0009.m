%% Entry versus propagation of signal labels
%
% [result,cr_items,r_stats] = mes_na_0009(system, cmd_s)
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
% Guideline Rule ID: na_0009 (7.2.2.)
%
% DESCRIPTION:
% ============
% If a label is present on a signal, the following rules define whether that
% label shall be created there (entered directly on the signal) or
% propagated from its true source (inherited from elsewhere in the model by
% using the "<" character).
% 1. Any displayed signal label must be entered for signals that:
%   a. Originate from an Inport at the Root (top) Level of a model
%   b. Originate from a basic block that performs a transformative
%      operation (For the purpose of interpreting this rule only, the Bus
%      Creator block, Mux block, and Selector block shall be considered to
%      be included among the blocks that perform transformative operations.)
% 2. Any displayed signal label must be propagated for signals that:
%   a. Originate from an Inport block in a nested subsystem Exception: If
%      the nested subsystem is a library subsystem, a label may be entered
%      on the signal coming from the Inport to accommodate reuse of the
%      library block.
%   b. Originate from a basic block that performs a non-transformative
%      operation
%   c. Originate from a Subsystem or Stateflow chart block Exception: If
%      the connection originates from the output of a library subsystem block
%      instance, a new label may be entered on the signal to accommodate reuse
%      of the library block.
%
% PASS/FAIL CRITERIA:
% ===================
% For the following cases, a signal will get a pass, otherwise, a fail will
% be given:
% 1. a signal that has no label,
% 2. a signal has label and the label is not propagated from its true
%    source if it is originates from an inport at the root level of a model
%    or from a inport of a library subsystem or from a library subsystem or
%    from a basic blocks that performs a transformative operation,
% 3. a signal has label and the label is propagated from its sources if it
%    is originates from an inport block of a nested non-library subsystem,
%    or from a basic block that performs a non-transformative operation or
%    from non-library subsystem or from non-library chart block.
%
% SOLUTION:
% =========
% If a signal should have a label, give a label to signals that originate
% from inport block of top level or lib susystems and transformative
% blocks, for othercases, the label should propages its source signal
% label.
%
% FIX OPERATION:
% ==============
% No automatic fix available
%
% CHECK PARAMETERS:
% =================
% MAAB.na_0009.nonTransformativeBlocks:
%   DATATYPE:
%       cellstring
%   DEFAULT VALUE:
%       {...
%        'blocktype','Input';...
%        'blocktype','Output';...
%        'blocktype','Demux';...
%        'blocktype','UnitDelay';...
%        'blocktype','Memory';...
%        'blocktype','From';...
%        'blocktype','Concatenate';...
%        'blocktype','Switch';...
%        'blocktype','MultiPortSwitch';...
%        'blocktype','Merge';...
%        'masktype','Manual Switch';...
%        'masktype','TL_Inport';...
%        'masktype','TL_Outport';...
%        'masktype','TL_BusInport';...
%        'masktype','TL_BusOutport';...
%        'masktype','TL_UnitDelay';...
%        'masktype','TL_UnitDelayRE';...
%        'masktype','TL_Switch';...
%        'masktype','TL_MultiPortSwitch';...
%        'masktype','TL_Merge'}
%   DESCRIPTION:
%       Cell array consists of two columns. Each row defines a
%       non-transformative block. First column represents a key to define
%       the block (i.e. blocktype), second column its value.
%
% NOTE:
% =====
% Basic blocks (see 2b) are the non-transformative blocks listet in
% parameter MAAB.na_0009.nonTransformativeBlocks
% Signal lines, which origin at a Bus Selector Block, propagate
% automatically the name from the ingoing singal lines. They do not need to
% checked.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:40CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0009(system, cmd_s)





















































































































































































