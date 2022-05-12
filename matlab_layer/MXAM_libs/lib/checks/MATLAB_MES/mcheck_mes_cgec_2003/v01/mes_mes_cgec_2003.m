%% Test Point Signals
%
% [result,cr_items,r_stats] = mes_mes_cgec_2003(system, cmd_s)
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
% mes_cgec_2003 - Test Point Signals
% The use of test point signals should be avoided. There are 2 possible
% recommended actions:
% - For each signal, in the Signal Properties dialog box, clear the Test
% point check box.
% - Alternatively, if the model is using an ERT-based system target file,
% select the Ignore test point signals check box in the Configuration
% Parameters dialog box. For Matlab R2011 and following versions, the
% Ignore test point signals parameter can be found in the Code Generation
% options. For Matlab R2010 and previous versions, the Ignore test point
% signals parameter can be found in the Real-Time Workshop options.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each signal in the model (only if the Configuration
% Parameter Option 'Ignore test points during code generation' is not
% selected):
% Failed 1: The parameter 'Test Point' is selected in the signal.
% The check result is passed if all failed cases do not apply.
%
% FIX ACTION:
% ===========
% The repair action clears the Test point check box in the Signal
% Properties dialog box of every signal.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:50CEST $
% Revision:     $Rev: 15223 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_mes_cgec_2003(system, cmd_s)























































































































