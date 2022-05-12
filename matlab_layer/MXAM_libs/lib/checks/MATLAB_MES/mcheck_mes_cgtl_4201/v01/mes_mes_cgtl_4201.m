%% Consistency of TargetLink and Simulink Data Types of TargetLink Blocks
%
% [result,cr_items,r_stats] = mes_mes_cgtl_4201(system, cmd_s)
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
%
% DESCRIPTION:
% ============
% For TargetLink blocks, the simulink datatype and the targetlink datatype
% must be the same. Otherwise there might occur compilation errors. 
%
% PASS/FAIL CRITERIA:
% =================== 
% Check verifies each TargetLink block.
% Failed: If a TargetLink block has different Simulink and TargetLink datatypes which is not an allowed combination.
% Exception: If a TargetLink block has 'default' class, its data type is set by TargetLink and the corresponding field in the blocks property editor remains empty, such blocks are not checked.
% Passed, if the above conditions does not apply.
% 
% SOLUTION:
% ========= 
% Adapt the Simulink or the TargetLink datatype of TargetLink blocks to allowed combination.
%
% FIX OPERATION:
% ==============
% No automatic fix available
%
% CHECK PARAMETERS:
% =================
% MES.mes_cgtl_4201.AllowedCombinations:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:  
%       {'',''}
%   DESCRIPTION: 
%       Cell array contains two columns. Each row describes an allowed
%       combination of SL and TL datatypes. Order is not important. 
% 
% NOTE:
% =====
% Only TL blocks, that have a SL datatype are considered. These blocks are 
% determinded by their property 'OutDataTypeStr'.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:51CEST $
% Revision:     $Rev: 6822 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_cgtl_4201(system, cmd_s)















































