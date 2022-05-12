%% Usable characters for block names
%
% [result,cr_items,r_stats] = mes_jc_0231(system, cmd_s)
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
% Guideline Rule ID: jc_0231 (4.2.5.)
%
% DESCRIPTION:
% ============
% All named blocks should conform to the following constraints:
% 
%     FORM name:
%         should not start with a number
%         should not start with a blank space
%         may not use double byte characters
%         carriage returns are allowed
% 
%     ALLOWED CHARACTERS name:
%         a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9 _
% 
% Note: this guideline does not apply to Subsystem blocks (cf. jc_0201). 
% 
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each block of the model that is not a Subsystem block.
% 
%     Failed 1: The name contains non-allowed characters.
%     Failed 2: The name starts with a digit or a blank.
%
% The check result is passed if all failed cases do not apply.
%
% SOLUTION:
% =========
% 	Consider renaming the blocks according to the guideline.
% 
%     Solution 1: Replace or remove non-allowed characters.
%     Solution 2: Start the name with an allowed character.
%
% FIX OPERATION:
% ==============
%     Repair Action 1: A prohibited character is replaced by an underscore.
%     Repair Action 2: Nonconforming first characters are deleted.
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% The check does not apply to Subsystems. Use jc_0201 to check Subsystem names.
% If a repair action reduces a name to an empty string, the fix is aborted and
% the name is restored. The user is then informed of this action.
% 
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:30CEST $
% Revision:     $Rev: 6160 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jc_0231(system, cmd_s)
















































