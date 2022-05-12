%% Simulink Blocks: Block names matching Parameter names
%
% [result,cr_items,r_stats] = misra_slsf_026_b(system, cmd_s)
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
% MISRA AC SLSF - Modeling design and style guidelines for the application
% of Simulink and Stateflow
% Version 1.0
% The Motor Industry Software Reliability Association
% Guideline Rule ID: MISRA AC SLSF 026 (3.4.8)
%
% DESCRIPTION:
% ============
% Simulink blocks containing named constants should have a block name
% matching the parameter name in the block.
%
% Exception: Where there is duplication in the same subsystem.
%
% PASS/FAIL CRITERIA:
% ===================
% If a simulink blocks contains named constants and this named constant is
% equally named to the blocks name, this block receives a pass.
%
% SOLUTION:
% =========
% Adapt the blocks name.
%
% FIX OPERATION:
% ==============
% No automatically fix available.
%
% CHECK PARAMETERS:
% =================
% MISRA_SL_SF.misra_slsf_026_b.BlocksWithoutCalibrationData:
%   DATATYPE:
%       cellstring
%   DEFAULT VALUE:
%       {...
%        'Sum','Product', 'MinMax', 'Merge', 'From', 'Goto' ,...
%        'RelationalOperator', 'BusCreator', 'BusSelector', ...
%        'Mux', 'Demux','Selector', 'Terminator', 'Ground'};
%   DESCRIPTION:
%       Each entry represents a blocktype of a block, that contains no
%       calibration data. These blocks are ignored by the check.
%
% NOTE:
% =====
% Named constants are variables saved as tuneable parameters, as variables
% in base workspace or as variables in data dictionary
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:17CEST $
% Revision:     $Rev: 7107 $
% *************************************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_026_b(system,cmd_s) %#ok<INUSD>


















































































































































































































































































