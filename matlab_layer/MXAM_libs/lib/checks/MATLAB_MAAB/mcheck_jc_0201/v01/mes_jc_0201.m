%% Usable Characters for Subsystem Names
%
% [result,cr_items,r_stats] = mes_jc_0201(system, cmd_s)
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
% Guideline Rule ID: jc_0201 (4.2.1)
%
% DESCRIPTION:
% ============
% The names of all Subsystem blocks should conform to the following constraints:
% 
% FORM name:
% 
%     should not start with a number
%     should not have blank spaces
%     should not have carriage returns
% 
% ALLOWED CHARACTERS name:
% 
%     a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9 _ 
% 
% UNDERSCORES name:
% 
%     underscores can be used to separate parts
%     cannot have more than one consecutive underscore
%     cannot start with an underscore
%     cannot end with an underscore
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each Subsystem block of the model.
% 
%     Failed 1: The name contains consecutive underscores.
%     Failed 2: The name contains blanks or carriage returns.
%     Failed 3: The name contains other non-allowed characters.
%     Failed 4: The name starts with an underscore or a digit.
%     Failed 5: The name ends with an underscore.
% 
% The check result is passed if all failed cases do not apply.
%
% SOLUTION:
% =========
% Consider renaming the Subsystem blocks according to the guideline.
% 
%     Solution 1: Replace unnecessary consecutive underscores.
%     Solution 2: Remove blanks and/or carriage returns.
%     Solution 3: Replace or remove non-allowed characters.
%     Solution 4: Start the name with an allowed character.
%     Solution 5: End the name with an allowed character.
%
% FIX OPERATION:
% ==============
%     Repair Action 1: Consecutive underscores are reduced to a single underscore.
%     Repair Action 2: A blank or carriage return is replaced by an underscore.
%     Repair Action 3: A prohibited character is replaced by an underscore.
%     Repair Action 4: Nonconforming first characters are deleted.
%     Repair Action 5: Nonconforming last characters are deleted.
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% It is possible that consecutive underscores are produced during fixing 
% even though the original name does not contain consecutive underscores. 
% This is fixed as well and, in this case, the fix action produces the message:
% 'Fixed: Consecutive underscores have been reduced to '_' .'
% Furthermore, if the repair action reduces a name to an empty string, 
% the fix is aborted and the name is restored. The user is then informed of this action.
% 
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:29CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jc_0201(system, cmd_s)















































