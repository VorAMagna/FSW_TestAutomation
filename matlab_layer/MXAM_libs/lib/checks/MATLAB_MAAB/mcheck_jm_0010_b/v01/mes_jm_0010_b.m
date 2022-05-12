%% Signal Names of Inports and Outports of Stateflow Charts
%
% [result,cr_items,r_stats] = mes_jm_0010_b(system, cmd_s)
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
% Control Algorithm Modeling Using Matlab,Simulink, and Stateflow
% Version 3.0
% MathWorks Automotive Advisory Board (MAAB)
% Guideline Rule ID: jm_0010 (7.1.15.)
%
% DESCRIPTION:
% ============
% This check verifies that the Inport and Outport names of Charts
% match the correspondent signal name.
%
% PASS/FAIL CRITERIA:
% ===================
% This check verifies that the names of Inport and Outport Stateflow Charts match the correspondent signal name.
%
%     Failed 1: Name of Chart Inport/Outport is not identical with the name of its signal.
%     Failed 2: Signal from/to Chart Inport/Outport has no label.
%     Failed 3: Signal from/to Chart Inport/Outport has no label, but has inherited name. The setting ''show propagated signals'' should be set to ''on''.
%
%
% The check result is passed if:
%
%     Passed 1: The fail cases do not apply.
%     Passed 2: Library blocks and reusable subsystems that encapsulate generic functionality are not checked.
%     Passed 3: The Signal label and the name of Chart Inport/Outpot differ only by angle brackets, which indicates propagated signal.
%
% Example:
% PortName= 'v_Fzg' is identical with the inherited
% SignaleName= '<v_Fzg>'
%
% SOLUTION:
% =========
% Match the names of signal or Stateflow chart port names.
%
% FIX OPERATION:
% ==============
% No automatic fix available. 
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% Leading and trailing whitespace and case is significant, i.e. 
% PortName= 'v_Fzg' is NOT identical with
% SignalName= 'v_Fzg ' or
% SignalName= 'v_fzg' or
% SignalName= ' v_Fzg' and vice versa
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:36CEST $
% Revision:     $Rev: 6755 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jm_0010_b(system, cmd_s)











































































































































































































































































