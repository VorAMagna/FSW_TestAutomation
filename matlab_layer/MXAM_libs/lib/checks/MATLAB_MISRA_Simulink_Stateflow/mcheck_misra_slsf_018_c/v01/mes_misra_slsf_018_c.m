%% Use of Goto blocks: Uniqueness of Tags
%
% [result,cr_items,r_stats]=mes_misra_slsf_018_c(system,cmd_s)
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
% MISRA AC SLSF
% Modelling desing and style guidelines for the application of Simulink and
% Stateflow
% Version: 1.0
% Guideline Rule ID: MISRA AC SLSF 018
%
% DESCRIPTION:
% ============
% The tag of Goto blocks must be unique. (More than one From block can 
% have the same tag).
%
% PASS/FAIL CRITERIA:
% ===================
% This check tests if From and Goto blocks fulfill the following
% criteria:
%   - The tags of Goto blocks must be unique
% If all criteria are met, the model will pass, otherwise, a fail is 
% given to each found rule violation.
% 
% SOLUTION:
% =========
% Rename the tag of Goto blocks.
% 
% FIX OPERATION:
% ==============
% No automatic fix available.
%
% CHECK PARAMETERS:
% =================
% MISRA_SL_SF.misra_slsf_018_c.CheckLibBlock:
%   DATATYPE: 
%       boolean
%   DEFAULT VALUE:
%       true (1)
%   DESCRIPTION:
%       If true, all Goto blocks are checked. If false, all Goto blocks 
%       with an active LinkStatus will be ignored. 
% 
% NOTE:
% =====
% Library blocks with broken link wont be ignored, if parameter 
% MISRA_SL_SF.misra_slsf_018_c.CheckLibBlock is set to true. 
% 
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:10CEST $
% Revision:     $Rev: 7040 $
% *************************************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_018_c(system,cmd_s) 













































































































