%% Block sample time
%
% [result,cr_items,r_stats] = mes_misra_slsf_009_d(system, cmd_s)
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
% Reference:
%   MISRA AC SLSF Modelling design and style guidelines for the
%   application of simulink and stateflow, MIRA limited, May 2009,
%   Ver 1.0, www.misra.org.uk
%
% Guideline Rule ID:
%   MISRA AC SLSF 009 d
%
% DESCRIPTION:
% ============
% All blocks must have the sample time set to 'Inherit' (Numeric -1),
% exception are blocks that contain state information, for example,
% discrete time integrators, unit delays, rate transition, signal, sources
% excluding constants and inports.
% Rationale:Hide functionality: if changes of rate are required, this
% better expressed explicitly.
%
% PASS/FAIL CRITERIA:
% ===================
% A TargetLink block except blocks with state information will get a pass
% if it has no property 'dt' or has property 'dt' and it is set to -1.
% A Simulink block except blocks with state information will get a pass if
% it has no property 'Sampletime', 'tsamp' and 'sample_time' or has such
% property and has it set to -1.
%
% SOLUTION:
% =========
% Set sample time to -1.
%
% FIX OPERATION:
% ==============
% set the sample time to -1
%
% CHECK PARAMETERS:
% =================
% MISRA_SL_SF.misra_slsf_009_d.BlocksWithStateInfo:
%   DATATYPE:
%       cellstring
%   DEFAULT VALUE:
%       {'',''}
%   DESCRIPTION:
%       Each row in this cell array represents a block that has state
%       information. Array must have at least two columns.
%       First column:   Blocktype
%       Second column:  Masktype
%
%
% NOTE:
% =====
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:03CEST $
% Revision:     $Rev: 6820 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_009_d(system, cmd_s)













































































































































































