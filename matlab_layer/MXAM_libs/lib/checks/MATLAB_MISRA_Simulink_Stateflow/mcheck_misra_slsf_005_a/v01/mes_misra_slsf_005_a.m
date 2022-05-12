%% Allowable Simulink Blocks - Simulink Block Library
%
% [result,cr_items,r_stats] = mes_misra_slsf_005_a(system, cmd_s)
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
% GUIDELINE:
% ==========
% Document: MISRA AC SLSF Version 1.0 (2009)
% Guideline ID: MISRA AC SLSF 0005, Parts A
%
% DESCRIPTION:
% ============
% Use of blocks outside the standard Simulink block library must be agreed 
% for each specific project
% 
% Reason:
% Code generation may not be possible because the chosen blocks may not
% be supported by the auto coding tool set.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each block B in the model.
%     Failed1: if B is a Simulink block and B is defined in the check
%     parameter misra_slsf_005_a.ProhibitedSLBlocks Failed2: if B is not a
%     standard Simulink block and B is not defined in the check parameter
%     misra_slsf_005_a.AllowedNonSLBlocks
% The check result is passed if all failed cases do not apply.
% 
% SOLUTION:
% =========
% Only use allowed standard simulink blocks or blocks that have been 
% verified. 
%
% FIX OPERATION:
% ==============
% No automatic fix available.
%
% CHECK PARAMETERS:
% =================
% MISRA_SL_SF.misra_slsf_005_a.ProhibitedSLBlocks:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       { '','',''}
%   DESCRIPTION:
%       Each row in this cell array represents a block from the standard
%       simulink library, that is prohibited. Array must have at least two
%       columns. Third column is optional.
%       First column:   Blocktype
%       Second column:  Masktype 
%       Third column:   Maskdescription 
% 
% MISRA_SL_SF.misra_slsf_005_a.AllowedNonSLBlocks:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       { '','',''}
%   DESCRIPTION:
%       Each row in this cell array represents a block that is not from the 
%       standard simulink library, but is allowed to be used. 
%       Array must have at least two columns. Third column is optional. 
%       First column:   Blocktype
%       Second column:  Masktype 
%       Third column:   Maskdescription
%
% NOTE:
% =====
% Corresponding Guideline part B prohibts three standard simulink blocks. 
% This part is checked by mes_misra_slsf_005_b - therefore these three
% blocks must not be entered in misra_slsf_005_a.ProhibitedSLBlocks
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:59CEST $
% Revision:     $Rev: 5609 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_005_a(varargin)















































