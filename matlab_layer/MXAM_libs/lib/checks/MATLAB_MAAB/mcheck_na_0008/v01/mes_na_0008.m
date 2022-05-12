%% Display of labels on signals
%
% [result,cr_items,r_stats] = mes_na_0008(system, cmd_s)
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
% MES CHECK:
% ==========
% na_0008 - Display of Labels on Signals
%
% A label must be displayed on any signal originating from the following blocks
% - Inport block
% - From block (block icon exception applies � see Note below).
% - Data Store Read block (block icon exception applies)
% - Subsystem block or Stateflow chart block (block icon exception applies).
% - Constant block (block icon exception applies).
% - Bus Selector block (the tool forces this to happen, so can be removed from here).
% - Demux block
% - Selector block
%
% A label must be displayed on any signal connected to the following destination blocks
% (directly or via a basic block that performs a non-transformative operation, such blocks:
% TL inport outport businport busoutport Saturation,SL convert Saturation)
%
% - Outport block
% - Goto block
% - Data Store Write block
% - Bus Creator block
% - Mux block
% - Subsystem block (Chart block)
%
% exceptions: Block icon exception (applicable only where called out above):
% If the signal label is visible in the originating block's icon display field,
% the connected signal need not also have the label displayed unless the
% signal label is needed elsewhere due to a destination-based rule.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each signal according to the guideline.
%     - Failed 1: The output signal has no label.
%     - Failed 2: The input signal has no label.
% The check result is passed if all failed cases do not apply.
% 
% Constant block: If the constant block has a valid expression in the
% constant value field, i.e. the name consists only of characters
% [A-Z,a-z,0-9,_], then this block receives a pass.
%
% TECHNICAL NOTE: 
% =============== 
% If the signal to a block has no name but violates the
% guideline, the source block will be reported, instead of the destination
% block. 
% In case of the exception: If the block has the proper setting it
% receives a pass, no matter whether the connected signal has a name or not.
%
% SOLUTION:
% =========
%     - Solution 1: Label the output signal.
%     - Solution 2: Label the input signal.
%
% FIX ACTION:
% ===========
%     - From: Change the IconDisplay to 'Tag and signal name'.
%     - Subsystem: Change the Showportlabels to 'SignalName' (matlab2007).
%     - Inport:
%         * If it has propagated signal, then change showpropatagesignalto 'on'.
%         * If it has no propagated signal, try to change the signal name to the name of the inport.
%     - Outport:
%         * If it has propagated signal, then change showpropatagesignal to 'on'.
%         * If it has no propagated signal, try to change the signal name to the name of the outport.
%     - Demux, Goto, Data Store Write,Bus Creator, Mux, Selector: 
%       If it has propagated signal, then change showpropatagesignal to 'on'.
%     - Constant, Data Store Read: Do nothing.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0008(system, cmd_s)






























































































































































































































































































































































































































































































































