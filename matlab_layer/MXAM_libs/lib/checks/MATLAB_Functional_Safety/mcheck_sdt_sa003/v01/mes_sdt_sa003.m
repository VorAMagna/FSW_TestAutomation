%% Control Input of Switch Blocks
%
% [result,cr_items,r_stats] = mes_sdt_sa003(system,cmd_s)
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
% DESCRIPTION:
% ============
% mes_sdt_sa003 - Control Input of Switch Blocks
% The control signal of a Switch block must be boolean. 
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each Simulink and TargetLink Switch block of the model.
% 
%  - Failed: The control signal of the Switch block is not of a Boolean
%            data type. 
%  - Warning 1: A Simulink Switch block is found in a TargetLink model.
%  - Warning 2: The control signal of the Switch block originates either
%               from a Simulink Constant block or from a TargetLink
%               Constant block with variable class that is neither CAL 
%               nor MERGEABLE CAL.
% 
% The check result is passed if all failed and all warning cases do not apply. 
% 
% FIX ACTION:
% ===========
% No automatic repair action available.
% 
% CHECK PARAMETERS:
% =================
% SDT.sa003.AllowedBaseTypesForSwitchControlInputs:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'Bool','Boolean'}
%   DESCRIPTION:
%       Cell array of base type strings which are allowed for control
%       inputs of switch blocks. Note: 'Bool' is always allowed and needs
%       not to be specified here.
%       Example - {'Bool','Int16','UInt32'}
% 
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result,cr_items,r_stats]=mes_sdt_sa003(system, cmd_s) 


































































































































































































































































































































































