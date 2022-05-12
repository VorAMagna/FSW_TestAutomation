%% Simulink blocks: Default Size
%
% [result,cr_items,r_stats] = misra_slsf_025_a_1(system, cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistic s on the check result
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>
%
% REFERENCED GUIDELINE:
% =====================
% MISRA AC SLSF - Modeling design and style guidelines for the application
% of Simulink and Stateflow
% Version 1.0 
% The Motor Industry Software Reliability Association
% Guideline Rule ID: MISRA AC SLSF 025 A(3.4.7)
%
% DESCRIPTION:
% ============
% The default shape and size must be used on all blocks, including those 
% added to support real-time applications (e.g. The Mathworks Real-Time 
% Workshop, thirdparty blocks). 
% 
% PASS/FAIL CRITERIA:
% ===================
% A Fail is given if a block is smaller than its default size (default size
% == size of this block in library)
%
% SOLUTION:
% =========
% Use the default shape and size on all blocks
%
% FIX OPERATION:
% ==============
% No fix available. 
%
% CHECK PARAMETERS:
% =================
% MISRA_SL_SF.misra_slsf_025_a_1.Libs2Check:
%   DATATYPE: 
%       cellstring (columnvector)
%   DEFAULT VALUE:
%       {'simulink'; 'sflib'}
%   DESCRIPTION:
%       List of libraries, in which default sizes for blocks are looked up.
%
% NOTE:
% =====
% Other parts of MISRA AC SLSF 025 A are checked by misra_slsf_025_a_[i].
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:14CEST $
% Revision:     $Rev: 15265 $
% *************************************************************************

function [result,cr_items,r_stats]= mes_misra_slsf_025_a_1(system,cmd_s,reg, s_regerr)







































