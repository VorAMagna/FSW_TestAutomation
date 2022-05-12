%% Use of only standard library blocks
%
% [result,cr_items,r_stats] = mes_na_0027(system, cmd_s)
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
% Guideline Rule ID: na_0027 (3.1.2.)
%
% DESCRIPTION:
% ============
% Companies should specify a subset of Simulink blocks for use when 
% developing models. The block list can include custom block libraries 
% developed by the company or third parties. Models should be built only 
% from these blocks.
%
% PASS/FAIL CRITERIA:
% ===================
% A pass is given for each used Simulink block, if it is part of the list 
% given by parameter MAAB.na_0027.StandardLibraryBlocks. 
%
% SOLUTION:
% =========
% Use only allowed standard library blocks.
%
% FIX OPERATION:
% ==============
% No automatic fix available.
%
% CHECK PARAMETERS:
% =================
% MAAB.na_0027.StandardLibraryBlocks:
% DATATYPE: 
% cellstring
% DEFAULT VALUE:
% {'',''}
% DESCRIPTION:
% List of libraries, whose blocks are allowed to be used in the model.
% syntax - {'<library_name1>','<library_name2>',......,'library_nameN'}
% 
% Note: WIth Simulink library added to the list, Stateflow and Simulink_extras are considered by default.
%
% NOTE:
% =====
% Referenced MAAB Guideline also states- 'Non-compliant blocks can be used during development. If non-compliant blocks are used, they should be marked either with a color, an icon and/or an annotation. These blocks must be removed prior to use in production code generation'.
% It is not possible to check if an annotation or a icon correspond to 'non-compliant block' and also if different colors are used, this might collide with guidelines concerning the appearance of Simulink blocks. Therefore this part of the guideline is ignored.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:43CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0027(system, cmd_s)













































