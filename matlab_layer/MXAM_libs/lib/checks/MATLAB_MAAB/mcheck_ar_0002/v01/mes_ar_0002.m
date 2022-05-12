%% Directory names
%
% [result,cr_items,r_stats] = mes_ar_0002(system, cmd_s)
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
% Guideline Rule ID: ar_0002 (4.1.2.)
%
% DESCRIPTION:
% ============
% A directory name conforms to the following constraints:
%
% Form:
% directory name = name
% name: no leading digits, no blanks
%
% Uniqueness:
% - all directory names within the parent project directory
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
% The check analyzes the name of each directory found within the given root directory and its sub directories. The root directory is defined by the check parameter MAAB.ar_0002.ParentDirectory. The directory names specified in the check parameter MAAB.ar_0002.IgnoredDirectoryName are not analyzed.
% 
% Failed1: At least one of the following cases hold for a directory name:
% 
%     starts with a digit or an underscore
%     has more than one consecutive underscore
%     ends with an underscore
% 
% Failed2: The directory name consists of at least one character that is not allowed or it contains at least one blank.
% 
% Failed3: The same directory name is assigned more than once to a directory within the given root directory and its sub directories.
% 
% The check result is passed if no failed case applies.
% 
% The allowed characters are:
% 
%     a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9 _
% 
%
% SOLUTION:
% =========
% Rename the directory according to this guideline. 
%
% FIX OPERATION:
% ==============
% No automatic fix available.
%
% CHECK PARAMETERS:
% =================
% MAAB.ar_0002.ParentDirectory:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'modelroot'
%   DESCRIPTION:
%       Defines the root directory from which the check searches recursively. Default value 'modelroot' is the directory path of the model (artifact). If the parameter is set to 'pwd' the current directory is analyzed. The parameter must not be empty.
%   Syntax:
%       '<Full path of the directory to be checked>'
% =================
% MAAB.ar_0002.IgnoredDirectoryNames
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%      {'_sfprj','_self','_sfun'}
%   DESCRIPTION:
%       Define the names of directories to be ignored in the parent directory, given by parameter MAAB.ar_0002.ParentDirectory.
%       Syntax: {'directory name1','directory name2',.....'directory nameN'}
% NOTE:
% =====
% By default, the parameter is set to 'modelroot'.
% 
% The check might be time consuming as the analysis depends on the number 
% of directories found within the root directory and its sub directories. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:13CEST $
% Revision:     $Rev: 7125 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_ar_0002(system, cmd_s)






















































