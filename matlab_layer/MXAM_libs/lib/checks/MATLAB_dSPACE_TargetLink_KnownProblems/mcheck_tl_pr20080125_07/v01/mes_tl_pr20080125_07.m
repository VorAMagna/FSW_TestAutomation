% MES check: tl_pr20080125_07 - Wrong code generated for While Iterator
% block
%
% function [result,cr_items,r_stats] = mes_tl_pr20080125_07(system, cmd_s)
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
% MES CHECK:
% ==========
% tl_pr20080125_07 - Wrong code generated for While Iterator block
%
% If the following conditions are fulfilled for case 1 or case2 wrong code
% is generated for a While Iterator block:
%
% Case 1:
% - "While loop type" is set to "do?while"
% -- AND –
% - "Show iteration number port" is activated
% -- AND –
% - "Maximum number of iterations" is exactly equal to the upper range
% limit of the data type selected as "Output data type", e.g. "Output data
% type" = int8 and "Maximum number of iterations" = 127.
%
% Case 2:
% - "While loop type" is set to "do-while"
% -- AND –
% - "Show iteration number port" is not activated
% -- AND –
% - "Maximum number of iterations" is exactly equal to the upper range
% limit of of an integer data type, e.g. "Maximum number of iterations" =
% 127.
%
% In case 2 TargetLink determines the data type based on the value of
% "Maximum number of iterations". Following the example the value 127 will
% fit into a Int8 variable, thus this data type will be used.
% The generated code is wrong because the generated iteration variable may
% overflow during run time.
%
% PASS/FAIL CRITERIA:
% ================
% An While-Iterator block failes in case 1 or 2.
%
% FIX ACTION:
% ===========
% NOT AVAILABLE YET:
% 1. Activate "Show iteration number port" (terminate the output if not needed).
% 2. Select a sufficient "Output data type". The selected type must be able
% to held values up to "Maximum number of iterations" + 1.
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% version:      $Id: mes_tl_pr20080125_07.m 1.1 2020/07/31 16:05:40CEST Vojnic-Hajduk, Vladimir (vladvojn) Exp  $
% ***********************************************************

function [result,cr_items,r_stats] = mes_tl_pr20080125_07(system, cmd_s) %#ok<INUSD>











































































































































































