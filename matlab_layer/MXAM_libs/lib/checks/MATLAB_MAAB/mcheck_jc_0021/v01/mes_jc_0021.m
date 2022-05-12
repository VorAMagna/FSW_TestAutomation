%% Model diagnostic settings
%
% [result,cr_items,r_stats] = mes_jc_0021(system, cmd_s)
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
% Guideline Rule ID: jc_0021 (6.1.2.)
%
% DESCRIPTION:
% ============
% The following diagnostics must be enabled. An enabled diagnostic is set 
% to either 'warning' or 'error'. Setting the diagnostic option to 'none' 
% is not permitted.
% Diagnostics that are not listed can be set to any value (none, warning or 
% error).
%
% Algebraic loop              
% Minimize algebraic loop
% MultiTask rate transition  
% Inf or NaN block output
% Duplicate data store names
% Unconnected block input     
% Unconnected block output   
% Unconnected line   
% Unspecified bus object at root Outport block
% Mux blocks used to create bus signals
% Invalid function-call connection
% Element name mismatch
%
% PASS/FAIL CRITERIA:
% ===================
% Check returns a pass, if none of the above listet parameters is set to
% 'none'.
%
% SOLUTION:
% =========
% Set the above listet parameter at least to 'warning'.
%
% FIX OPERATION:
% ==============
% Each diagnostic setting that is listed in the advice and that is set to
% 'none' is set to 'warning'.
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% Paths given in error messages corresponds to paths in Matlab 2012b
% (Simulink Version ). They might differ in other versions.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:26CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jc_0021(varargin)




























































