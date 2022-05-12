%% Multiport Switch Blocks: Range of Control Input
%
% [result,cr_items,r_stats]=mes_sdt_sa004_b(system,cmd_s)
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
% Corresponding Guideline: 2.2
%
% DESCRIPTION:
% ============
% The control signal of a Multiport Switch block must have a range limited
% to [1 .. number of data signals].
%
% PASS/FAIL CRITERIA:
% ===================
% For multiport switch blocks, a pass is only given if the control signal
% has a range limited to [1..number of data signals].
%
% A warning is raised if
% - the control input of a multiport switch is taken from a Simulink block,
%   and has unconstrained integer range .
% - a Simulink  multiswitch block is found in a TargetLink model
%
% SOLUTION:
% =========
% Limit the range of the control input to the numer of data signals.
%
% FIX OPERATION:
% ==============
% No automatically fix available.
%
% CHECK PARAMETERS:
% =================
% SDT.sa004_b.TrustUserSpecifiedRange:
%   DATATYPE:
%       boolean
%   DEFAULT VALUE:
%       true (1)
%   DESCRIPTION:
%       if true, user-defined ranges (in Targetlink: output.min, output.max,
%       in Stateflow: sf.min, sf.max) are accepted to limit the control
%       input range.
%       If false, the data-limited range of control input is checked, and
%       user-defined min and max values are ignored.
%
% NOTE:
% =====
% Restricting the datatype to integer data avoids rounding and
% resolution effects on the switch behavior. Restricting the range of the
% MultiportSwitch control input avoids undefined output conditions.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:05CEST $
% Revision:     $Rev: 7358 $
% *************************************************************************

function [result,cr_items,r_stats]=mes_sdt_sa004_b(system, cmd_s)






























































































































































































































































































































































































































































































































































































































































