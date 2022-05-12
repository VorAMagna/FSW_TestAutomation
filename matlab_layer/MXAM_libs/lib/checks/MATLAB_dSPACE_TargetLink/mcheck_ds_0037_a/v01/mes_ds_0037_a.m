% MES check: ds_0037_a - Show Default Case option of Switch Case block shall be set
%
% function [result,cr_items,r_stats] = mes_ds_0037_a(system,cmd_s)
%
% RETURN PARAMETERS:
% ==================
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items 
%
% INPUT PARAMETERS:
% =================
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>, for details See also mes_jc_0061
%
% DESCRIPTION: 
% ============
% ds_0037_a - Show Default Case option of Switch Case block shall be set
%
% This test checks whether the "Show default case" option of Switch Case
% block is set, which is the first criterion of dSPACE guideline 2.10.2
% (The second critierion is implemented by check mes_ds0037_b)
%
% RATIONALE:
% ==========
% All switch case instructions in the generated code should have 
% a default branch to avoid undefined states during program execution   
%
% PASS/FAIL CRITERIA:
% ===================
% A fail is given to Switch Case blocks if the block option
% "Show default case" is not set.
%
%
% FIX ACTION:
% ===========
% The parameter "Show default case" of Switch Case blocks will be set.
%
% REFERENCE:
% ==========
% dSPACE Modeling guidelines for ML/SL/SF/TL, version 2.1
% chapter 2.10.2
% Note: this check only test compliance with the first
% criterion of the guideline.
%
% See also: mes_ds_0037_b
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:12CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0037_a(system,cmd_s) %#ok<INUSD>































































































