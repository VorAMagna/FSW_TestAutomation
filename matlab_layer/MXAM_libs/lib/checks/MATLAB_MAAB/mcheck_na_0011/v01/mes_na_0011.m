%% Scope of Goto and From blocks
%
% [result,cr_items,r_stats] = mes_na_0011(system, cmd_s)
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
% Guideline Rule ID: na_0011 (7.3.5.)
%
% DESCRIPTION:
% ============
% For signal flows, the following rules apply:
% From and Goto blocks must use local scope.
%
% PASS/FAIL CRITERIA:
% ===================
% The check tests all the Goto blocks if they all use local scope, and all
% the From blocks if a Goto block with the same tag exists in the same
% subsystem. If one of the Goto block does not use local scope or a Goto
% block with the same tag as a From block can not be found in the same
% subsystem,the mode gets a Fail. Otherweise, the model receives a Pass
%
% SOLUTION:
% =========
% Only use Goto and From with local scope to keep the model readable. 
%
% FIX OPERATION:
% ==============
% Fix set the tagvisibility setting of Goto block to 'local'. From blocks
% have to be fixed manually. 
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% Corresponding guideline allows the use of scope 'global' under special
% circumstances. This check does not support this exception. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:40CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0011(system, cmd_s)




























































































































