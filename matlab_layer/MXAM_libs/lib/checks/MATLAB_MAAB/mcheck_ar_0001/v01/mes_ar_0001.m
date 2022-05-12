%% Filenames
%
% [result,cr_items,r_stats] = mes_ar_0001(system, cmd_s)
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
% Guideline Rule ID: ar_0001 (4.1.1.)
%
% DESCRIPTION:
% ============
% A filename conforms the following constraints.
% 
% Form: 
% filename = name.extension
% name: no leading digits, no blanks
% extension: no blanks
%
% Uniqueness: 
% - All filenames within the parent project directory
% - cannot conflict with MATLAB keywords
% 
% Allowed Characters: 
% name: a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H
% I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9 _
% extension: a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E
% F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9
%
% Underscores:
% name: 
% - can use underscores to separate parts
% - cannot have more than one consecutive underscore
% - cannot start with an underscore
% - cannot end with an underscore
% extension:
% - should not use underscores
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes the name of each file found within the given root 
% directory and its sub directories. The root directory is defined by the
% check parameter MAAB.ar_0001.ParentDirectory.
% 
% Failed1: At least one of the following cases hold for a file name:
% 
%     starts with a digit or an underscore
%     has more than one consecutive underscore
%     ends with an underscore
%     contains a MATLAB function name
% 
% Failed2: The file name or file extension consists of at least one character that is not allowed or it contains at least one blank.
% 
% Failed3: The extension contains an underscore.
% 
% Failed4: The same file name is assigned more than once to a file within the given root directory and its sub directories.
% 
% Warning: The given root directory does not exist.
% 
% The check result is passed if no failed case applies.
% 
% The allowed characters are:
% 
%     file name: a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9 _
%     file extension: a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9
% 
%
% SOLUTION:
% =========
% Rename the file according to the given rules. 
%
% FIX OPERATION:
% ==============
% No automatic fix available.
%
% CHECK PARAMETERS:
% =================
% MAAB.ar_0001.ParentDirectory:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'modelroot'
%   DESCRIPTION:
%       Defines the root directory from which the check searches for files 
%       recursively. Default value 'modelroot' is the directory path of the model (artifact)
%       Syntax:
%       '<Full path of the directory, where the files are to be checked>'
% 
% MAAB.ar_0001.IgnoredFileNames:
%     DATATYPE:
%         string
%     DEFAULT VALUE:
%         {''}
%     DESCRIPTION:
%         Define the names of files to be ignored in the parent directory and all subdirectories, given by parameter MAAB.ar_0001.ParentDirectory.
%         Syntax: {'file name1','file name2',.....'file nameN'}
%         Each file name must include the respective file extension.
%         
% MAAB.ar_0001.IgnoredDirectoryNames:
%     DATATYPE:
%         string
%     DEFAULT VALUE:
%         {'_sfprj','_self','_sfun'}
%     DESCRIPTION:
%         Define the names of directories to be ignored in the parent directory and all subdirectories, given by parameter MAAB.ar_0001.ParentDirectory.
%         Syntax: {'directory name1','directory name2',.....'directory nameN'}
%        
% 
% NOTE:
% =====
% The guideline ar_0001 states that file names should not contain C/C++ keywords. This is not checked automatically. 
% The check might be time consuming as the analysis depends on the number of files found within the root directory and its sub directories. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:13CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_ar_0001(system, cmd_s)























































