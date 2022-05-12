%% Naming of Trigger Port block and Enable Port block
%
% [result,cr_items,r_stats] = mes_jc_0281(system, cmd_s)
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
% Guideline Rule ID: jc_0281 (7.1.16.)
%
% DESCRIPTION:
% ============
% For Trigger port blocks and Enable port blocks, match the name of the
% signal triggering the subsystem.
%
% Exception:
%  - The block name should match the name of the signal triggering the
%    subsystem.
%  - When any combination of an Enable block, an Trigger block, and any
%    other block have the same block name, a suffix or prefix must be 
%    used on the Trigger and Enable port and it must be consistently used
%    throughout the model.
%
% PASS/FAIL CRITERIA:
% ===================
% A fail is given to each signal line that is 
% - connectet to an trigger or an enable port and this port is not named
%   identical to the signal line   
% - connectet to a reuseable subsystem and has a non-empty label
% 
% Additionally a fail is given if not all used suffixes or prefixes are
% identical. 
%
% SOLUTION:
% =========
% Adapt signal or port names.
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
% - In spite of the intuitiv assumption to search all ports and compare
%   their names with the connected signal line labels, this check is
%   implemented the other way around. Therefore the statistic might be 
%   differ from your assumed result: The checked lines are counted.
% - This check does not cover the case, that an Enable or Trigger port is
%   directly connected to an Outport. In this case, Enable/Triger port and
%   Outport must use some prefix or suffix. With default settings this
%   would not be detected by this check - even if suffix or prefix is used,
%   this will case an error.  
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:31CEST $
% Revision:     $Rev: 6583 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jc_0281(system, cmd_s)






























































