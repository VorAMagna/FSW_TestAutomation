%% Multiport Switch Blocks: Data Type of Control Input
%
% [result,cr_items,r_stats]=mes_sdt_sa004_a(system,cmd_s)
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
% cmd_s     - check options, syntax /<key>:<val>
%
% REFERENCED GUIDELINE:
% =====================
% MES Functional Safety Guidelines
% Release 1.7 (21 June 2013)
% Corresponding Guideline: 2.2 
%
% DESCRIPTION:
% ============
% The control signal of a Multiport Switch block must be of an unsigned
% integer type 
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each Simulink and TargetLink Multiport Switch block of the model.
% 
%     Failed 1: The TargetLink version of the model is less than 2.1 and the option "Use zero-based indexing" of the Multiport Switch block is activated.
%     Failed 2: The data type of the control input is not of an unsigned integer type.
%     Review 3: The data type of the control input is an enumeration type.
%     Warning 4: A Simulink Multiport Switch block is found in a TargetLink model.
% 
% The check result is passed if all failed, review, and warning cases do not apply.
% 
% SOLUTION:
% =========
%     Solution 1: Disable the option "Use zero-based indexing" for each Multiport Switch block if the TargetLink version of the model is less than 2.1. 
%     Solution 2: Change the data type of the input signal of the control input of the Multiport Switch block to an unsigned integer data type.
%     Solution 3: Review the enumeration data type implementation, if it has an unsigned integer base type.
%     Solution 4: Use only TargetLink Multiport Switch blocks in TargetLink
%     Subsystems.
%
% FIX OPERATION:
% ==============
% No automatically fix available. 
% 
% CHECK PARAMETERS:
% =================
% No parameters are used.
% 
% NOTE:
% =====
% Restricting the datatype to integer data avoids rounding and
% resolution effects on the switch behavior. Restricting the range of the
% Switch control input avoids undefined output conditions.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:05CEST $
% Revision:     $Rev: 6930 $
% *************************************************************************

function [result,cr_items,r_stats]=mes_sdt_sa004_a(system, cmd_s) 






























































































































































































































































































































































































































