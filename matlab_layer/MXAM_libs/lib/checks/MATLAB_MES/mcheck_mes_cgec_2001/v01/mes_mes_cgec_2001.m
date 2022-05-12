%% Prohibited Simulink Blocks for Code Generation
%
% [result,cr_items,r_stats] = mes_mes_cgec_2001(varargin)
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
% MES CHECK:
% ==========
% mes_cgec_2001 - Prohibited Simulink Blocks for Code Generation
% The prohibited blocks in this check are not supported or not recommended for code generation.
%
% PASS/FAIL CRITERIA:
% ===================
%  The check analyzes each Simulink block.
%     Failed 1: The block is a standard Simulink block and is defined in the check parameter mes_cgec_2001.ProhibitedSLBlocks.
%  The check result is passed if all failed cases do not apply.
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:49CEST $
% Revision:     $Rev: 15223 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_cgec_2001(varargin)








































