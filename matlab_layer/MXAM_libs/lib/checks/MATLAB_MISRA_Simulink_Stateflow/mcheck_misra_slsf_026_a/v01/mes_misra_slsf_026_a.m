%% Simulink Blocks: Appearance
%
% [result,cr_items,r_stats] = misra_slsf_026_a(system, cmd_s)
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
% Names must be visible and placed below the Simulink block, subsystem or
% library block.
% Exception 1: Simulink blocks that do not contain calibration data
%              (e.g. sum, product, min/max, merge, from, goto, relational
%               operator), can be named by Simulink but the name must be
%               hidden.
% Exception 2: Specific blocks may be exempt from this rule after agreement
%              within company or project.
%
% PASS/FAIL CRITERIA:
% ===================
% A pass if given for:
% - all Simulink blocks have the parameter 'Orientation' set to 'left' or
%   'right' and the parameter 'NamePlacement' set to 'normal'
% - all Simulink block that do contain calibration data (all except blocks
%   in parameter MISRA_SL_SF.misra_slsf_026_a.BlocksWithoutCalibrationData)
%   have the parameter ShowName set to 'on'
% - Simulink blocks that do not contain calibration data and are named by
%   Simulink (name in library plus optional number) must have the parameter
%   'ShowName' set to 'off',
% - Simulink blocks containing named constants have the parameter 'ShowName'
%   set to 'on' and the block name is equal to the named constant
%
% SOLUTION:
% =========
% Use the hide name, flip name and the rotate block option for each block
% violating this rule until the block name is either hidden or placed below
% the respective block.
%
% FIX OPERATION:
% ==============
% Fix operation will set 'Orientation' to 'right', 'NamePlacemebt' to
% 'normal' and 'ShowName' to 'on' (if this block is considered and not
% excluded by an exception)
%
% CHECK PARAMETERS:
% =================
% MISRA_SL_SF.misra_slsf_026_a.LibrariesToCheck:
%   DATATYPE:
%       cellstring
%   DEFAULT VALUE:
%       {'simulink'}
%   DESCRIPTION:
%       Each entry of LibrariesToCheck is a library. Each block(name) of
%       these libraries is collected and treated as standard. Blocks(names)
%       of the analysed model are compared with this collection.
%
% MISRA_SL_SF.misra_slsf_026_a.BlocksWithoutCalibrationData:
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
% - Named constants are variables saved as tuneable parameters, as variables
%   in base workspace or as variables in data dictionary
% - names of all blocks that are allowed to be hidden and are hidden (ShowName
%   is 'off') will not be checked
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:16CEST $
% Revision:     $Rev: 6836 $
% *************************************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_026_a(system,cmd_s) %#ok<INUSD>
















































































































































































































































































































































































