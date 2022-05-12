%% Allowable Simulink Blocks - Prohibited Blocks
%
% [result,cr_items,r_stats] = mes_misra_slsf_005_b(system, cmd_s)
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
% cmd_s     - check options, syntax /<key>:<val>,
%
% GUIDELINE:
% ==========
% Document: MISRA AC SLSF Version 1.0 (2009)
% Guideline ID: MISRA AC SLSF 0005, Parts B
%
% DESCRIPTION:
% ============
% The following blocks must not be used:
%    - Function block
%    - Embedded MATLAB function
%    - Duplicate inport 
%
% MES Remarks:
% ============
% Since Matlab R2011a Embedded MATLAB Function blocks are called MATLAB
% Function.
% 
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each block in the model.
%     Failed: The block is a Fcn block, a MATLAB function block or a
%     duplicate inport block.
% The check result is passed if the failed case does not apply.
%
% FIX OPERATION:
% ==============
% No automatic fix available.
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:00CEST $
% Revision:     $Rev: 6168 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_005_b(system, cmd_s)





































