%% Power of two scaling
%
% [result,cr_items,r_stats] = mes_misra_tl_6_1(system, cmd_s)
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
% misra_tl_6_1 - Power of two scaling
%
% For fixed-point code generation power of two scaling is recommended in
% preference to arbitrary scaling for the block output. The scaling can be
% set to power of two by selecting 2^for the LSB type in the block dialog.
% Ensures the generation of efficient fixed-point code.
%
% Power of two scaling leads to efficient implementations via bitwise
% shifts, particularly if divisions and multiplications are involved. On
% most processors, bitwise shifts require less execution time than
% multiplications and divisions.
%
% PASS/FAIL CRITERIA:
% ===================
% A fail is given to TargetLink blocks/Stateflow data items whose LSB type
% is not set to 2^.
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result,cr_items,r_stats] = mes_misra_tl_6_1(system, cmd_s)































































































































































































































































































































































































































































