%% Duplicated Inports
%
% [result,cr_items,r_stats] = mes_sdt_il001_b(system, cmd_s) 
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
% MES Functional Safety Guidelines
% Release 1.7 (21 June 2013)
% Corresponding Guideline: 2.4 
%
% DESCRIPTION:
% ============
% All inports and outports of a system must carry different signals.
% Duplicate inport blocks (Blocktype InportShadow) are not allowed.
% 
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each Simulink Inport in the model.
% Failed: If the Inport is a duplicated Inport.
% The check issues a pass if the failed case does not apply.
% 
% SOLUTION: 
% =========
% Remove each duplicated Inport or Outport.
% 
% If a duplicate signal is needed, duplicate the signal within the system 
% by creating a signal branch after the Inport. 
% 
% FIX OPERATION:
% ==============
% No automatically fix available. 
% 
% CHECK PARAMETERS:
% =================
% No parameters are used. 
% 
% NOTE:
% =====
% 
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:02CEST $
% Revision:     $Rev: $
% *************************************************************************

function [result,cr_items,r_stats] = mes_sdt_il001_b(system,cmd_s)


































