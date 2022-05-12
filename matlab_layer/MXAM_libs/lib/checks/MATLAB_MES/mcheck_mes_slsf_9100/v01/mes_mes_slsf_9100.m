%% Naming Conventions
%
% [result,cr_items,r_stats] = mes_mes_slsf_9100(system, cmd_s)
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
% mes_slsf_9100: Naming Conventions
%
% DESCRIPTION:
% ============
% Identifiers in Simulink should follow the naming convention defined by
% the project.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes the name of each item in the model whose type is
% listed in the check parameter 'MES.mes_slsf_9100.Types2Check'.
%    - Failed: The name of the item does not follow the naming convention
%     described in the XML file, which is defined in the check parameter
%     'MES.mes_slsf_9100.pathXMLFile'.
% The check result is passed if all failed cases do not apply.
%
% SOLUTION: 
% ========= 
% Review the name of the item and rename it according to the fragment
% pattern. The finding message identifies the first mandatory fragment
% which does not follow the naming convention given in the template or is
% missing.
%
% FIX OPERATION:
% ==============
% No automatic repair action available. 
%
% CHECK PARAMETERS:
% =================
% MES.mes_slsf_9100.pathXMLFile:
%   DATATYPE:
%       string
%   DEFAULT VALUE:
%       ''
%   DESCRIPTION:
%       Absolut path + Filename of the XML-file, which contains the naming
%       conventions.
% MES.mes_slsf_9100.Types2Check:
%   DATATYPE:
%       cellstring
%   DEFAULT VALUE:
%       {'type' 'block'}
%   DESCRIPTION:
%       Types2Check defines the object types to be checked, which are
%       defined by a key-value list.
%       %
%       Example: Check all signals and constant blocks.
%       Types2Check = {
%           'type' 'line' 'segmenttype' 'trunk';
%           'type' 'block' 'blocktype' 'constant'}
%
% NOTE:
% =====
% The naming convention of the item identifier is described in an XML
% file. The name and path of the XML file is defined in the check parameter
% 'MES.mes_slsf_9100.pathXMLFile'.
% 
% The Excel file must follow a specific scheme consisting of optional and
% mandatory fragments. The scheme is defined in an example Excel file that
% can be found in the folder where this check resides.
% 
% The template for the naming convention is a string with fragments and
% separators, e. g., 'Prefix_Source_[Label]_Suffix'.
% 
% Optional fragments are marked with []. In the example above, 'Label' is
% an optional fragment. Optional fragments are not separated in the
% message.
% 
% Free fragments are fragments whose text is free. Free fragments can be
% optional or mandatory. The free fragment must be followed by a mandatory
% fragment or be placed at the end of the template, and must not include
% separators.
% 
% The value of the check parameter 'MES.mes_slsf_9100.Types2Check' may be
% any key-value pair that is valid for the Simulink function 'find_system'.
% 
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:56CEST $
% Revision:     $Rev: 6850 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_slsf_9100(system, cmd_s)























































































































