%% Simulink Subsystems: Sufficient Size to display Portnames
%
% [result,cr_items,r_stats] = jm_0002_b(system, cmd_s)
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
% % Control Algorithm Modeling Using Matlab,Simulink, and Stateflow
% Version 3.0
% MathWorks Automotive Advisory Board (MAAB)
% Guideline Rule ID: jm_0002 (4.2.5.)
%
%
% DESCRIPTION:
% ============
% All blocks in a model must be sized such that their icon is completely 
% visible and recognizable. In particular, any text displayed (e.g. tunable 
% parameters, filenames, equations) in the icon must be readable.
% 
% This guideline requires resizing of blocks with variable icons or blocks 
% with a variable number of inputs and outputs. In some cases it may not be 
% practical or desirable to resize the block icon of a subsystem block so that 
% all of the input and output names within it are readable. In such cases, 
% the user may hide the names in the icon by using a mask or by hiding the 
% names in the subsystem associated with the icon. If you do this, the signal 
% lines coming into and out of the subsystem block should be clearly labeled 
% in close proximity to the block. 
%
% PASS/FAIL CRITERIA:
% ===================
% If portnames of a subsystem overlap each other, this subsystem receives a
% fail.
%
% SOLUTION:
% =========
% Change the size of subsystem, such that its port name is shown completely.
%
% FIX OPERATION:
% ==============
% The size of subsystems will be changed such that their port names will be
% shown clearly.
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
% Date:         $Date: 2020/07/31 16:03:35CEST $
% Revision:     $Rev: 6179 $
% *************************************************************************

function [result,cr_items,r_stats]= mes_jm_0002_b(system,cmd_s,reg, s_regerr)












































