%% Usable characters for Simulink Bus names
%
% [result,cr_items,r_stats] = mes_na_0030(system, cmd_s)
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
% Guideline Rule ID: na_0030 (4.2.4.)
%
% DESCRIPTION:
% ============
% All Simulink Bus names should conform to the following constraints:
%
% Form:
% - should not start with a number
% - should not have blank spaces
% - should not include carriage return
% 
% Allowed Characters:
% a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J 
% K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9 _
%
% Underscores:
% - can use underscores to separate parts
% - cannot have more than one consecutive underscore
% - cannot start with an underscore
% - cannot end with an underscore
%
% PASS/FAIL CRITERIA:
% ===================
% A pass is given to each Simulink Bus whose name 
% - does not contain more than one consecutive underscore
% - does not end with an underscore
% - does not start with an underscore or a digit
% - contains only allowed characters
% - contains no blanks
%
% SOLUTION:
% =========
% Rename the Simulink Bus according to this guideline. 
%
% FIX OPERATION:
% ==============
% - prohibited characters are replaced by '_'
% - consecutive underscores are reduced to '_'
% - blanks are replaced by '_'
% - prohibited first/last characters are deleted
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% - It is possible that consecutive underscores appear during fixing. This 
%   is fixed as well. This fix action produces the message 'Fixed: 
%   Consecutive underscores had been reduced to '_' ' even though the 
%   original name does not contain consecutive underscores.  
% - If the fix reduces a name to an empty string, the fix is aborted and
%   the name is restored. The user is then informed of this action.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:44CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0030(system, cmd_s)



















































