%% Use of the switch block
%
% [result,cr_items,r_stats] = mes_jc_0141(system, cmd_s)
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
% misra_slsf_012_a
%
% DESCRIPTION:
% ============
% - The switch condition, input 2, must be a Boolean value. 
% - The block parameter "Criteria for passing first input" should be set to 
%   u2~=0. 
%
% PASS/FAIL CRITERIA:
% ===================
% Each Switch block receives a fail, if 
% - signal connected to inport 2 is not boolean OR
% - parameter 'Criteria for passing first input' is not set to 'u2~=0'
% Only Switch blocks are checked, that have a connected control input. 
%
% SOLUTION:
% =========
% Change the input to inport 2. Set the parameter 'Criteria for passing
% first input' to 'u2~=0' using the GUI or the Simulunk API. 
%
% FIX OPERATION:
% ==============
% No automatic fix available. 
%
% CHECK PARAMETERS:
% =================
% MISRA_SL_SF.misra_slsf_012_a.U2DataType:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'boolean','bool'}
%   DESCRIPTION:
%       Allowed datatypes for input U2
% 
% MISRA_SL_SF.misra_slsf_012_a.Criteria:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'u2~=0'}
%   DESCRIPTION:
%       Allowed setting for Switch setting. 
%
% NOTE:
% =====
% - TargetLink switch is not checked.
% - For Matlab version R13, the block parameter 'Criteria for passing first 
%   input' must not be set to u2 >Threshold.
%
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:05CEST $
% Revision:     $Rev: 15479 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_012_a(system, cmd_s)












































