% MES check: misra_slsf_006_c -  Block parameters
%
% function [result,cr_items,r_stats] = mes_misra_slsf_006_c(system, cmd_s)
%
% INPUT PARAMETERS:
% =================
%   system:  model/subsystem to be checked
%   cmd_s:   check options, syntax /<key>:<val>, for details See also
%   mes_jc_0061
%
% GUIDELINE:
% ==========
% Reference:
%   MISRA AC SLSF Modelling design and style guidelines for the
%   application of simulink and stateflow, MIRA limited, May 2009,
%   Ver 1.0, www.misra.org.uk
%
% Guideline Rule ID:
%   MISRA AC SLSF 006
%
% MES CHECK:
% ==========
% Numeric values should be entered as named constant. exceptions:
% - 0 is permitted provided it specifies an initial value
% - -1 is permitted as a sample time
%
% PASS/FAIL CRITERIA:
% ==================
% If block parameters are not entered as numeric number but named
% constant,a pass will be given. If numeric 0 is used as initial value and
% -1 is used as sample time, a pass is given too. Otherwise, a fail is
% given.
%
% SOLUTION:
% =========
% use named constant to replace numeric values, except 0 for initial value
% and -1 for sample time.
%
% FIX OPERATION:
% ==============
% No automatic fix available.
%
% CHECK PARAMETERS:
% =================
% NOTE:
% =====
% This check will call function 'mxam_misra_slsf_006_checkedParameters.m'.
% If this file does not exist or is not in Matlab path, an error will be
% returned.
% This file returns a list of blocks and parameters that should be considered by
% this check. Only parameters specified by mxam_misra_slsf_006_checkedParameters
% will be checked.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:01CEST $
% Revision:     $Rev: 15479 $
% *************************************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_006_c(system,cmd_s)




















































































































































































































































































































