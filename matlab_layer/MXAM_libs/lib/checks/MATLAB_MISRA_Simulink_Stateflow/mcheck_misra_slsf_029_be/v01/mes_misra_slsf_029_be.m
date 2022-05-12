%% Signal and Bus Line Positioning - Overlaps and Branching
%
% [result,cr_items,r_stats] = mes_misra_slsf_029_be(system,cmd_s)
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
% Signal and Bus Line Positioning - Overlaps and Branching
% B: All signal and bus lines must not be drawn one upon the other.
% E: For all signal and bus branching, the mark point of the branching must 
%    be situated at the branching point. 
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each signal line in the model.
%  - Failed 1: The line is drawn upon another line.
%  - Failed 2: The line is closer to another line than the minimal distance 
%              in parameter MISRA_SLSF.misra_slsf_029_be.MinDist
% The check result is passed if all failed cases do not apply.
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% CHECK PARAMETERS:
% =================
% MISRA_SL_SF.misra_slsf_029_be.MinDist: 
%   DATATYPE: 
%       integer
%   DEFAULT VALUE:
%       0 (unit: pixel)
%   DESCRIPTION:
%       Minimal distance between line and line or line and egde of block. 
%       If distance is closer, a fail is returned.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result,cr_items,r_stats] = mes_misra_slsf_029_be(system, cmd_s)









































