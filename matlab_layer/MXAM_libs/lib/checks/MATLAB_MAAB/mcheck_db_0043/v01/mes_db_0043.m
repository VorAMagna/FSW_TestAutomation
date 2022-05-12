%% Simulink font style and size
%
% [result,cr_items,r_stats] = mes_db_0043(system, cmd_s)
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
% Guideline Rule ID: db_0043 (7.1.2.)
%
% DESCRIPTION:
% ============
% All text elements (block names, block annotations and signal labels) 
% except free text annotations within a model must have the same font style 
% and font size. Fonts and font size should be selected for legibility.
%
% PASS/FAIL CRITERIA:
% ===================
% Each block/line which has font attributes (name, size, wight and angle)
% not equal to the values parameters 'MAAB.db_0043.BlockFont'/
% 'MAAB.db_0043.LineFont' OR to 'auto' (name, weight, angle) or '-1' (size) 
% receives a fail
%
% SOLUTION:
% =========
% Set font attributes back to default values (auto/-1).
%
% FIX OPERATION:
% ==============
% Fix will set each font attribute to auto/-1. 
%
% CHECK PARAMETERS:
% =================
% MAAB.db_0043.BlockFont.Name:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'auto'
%   DESCRIPTION:
%       Font-Name of blocks. Choose 'auto' to inherit model settings.  
% 
% MAAB.db_0043.BlockFont.Weight:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'auto'
%   DESCRIPTION:
%       Font-Weight of blocks. Choose 'auto' to inherit model settings. 
% 
% MAAB.db_0043.BlockFont.Angle:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'auto'
%   DESCRIPTION:
%       Font-Angle of blocks. Choose 'auto' to inherit model settings. 
% 
% MAAB.db_0043.BlockFont.Size:
%   DATATYPE: 
%       integer
%   DEFAULT VALUE:
%       -1
%   DESCRIPTION:
%       Font-Size of blocks. Choose -1 to inherit model settings. 
% 
% MAAB.db_0043.LineFont.Name:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'auto'
%   DESCRIPTION:
%       Font-Name of lines. Choose 'auto' to inherit model settings.  
% 
% MAAB.db_0043.LineFont.Weight:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'auto'
%   DESCRIPTION:
%       Font-Weight of lines. Choose 'auto' to inherit model settings.
% 
% MAAB.db_0043.LineFont.Angle:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'auto'
%   DESCRIPTION:
%       Font-Angle of lines. Choose 'auto' to inherit model settings. 
% 
% MAAB.db_0043.LineFont.Size:
%   DATATYPE: 
%       integer
%   DEFAULT VALUE:
%       -1
%   DESCRIPTION:
%       Font-Size of lines. Choose -1 to inherit model settings. 
%
% NOTE:
% =====
% - If parameters .Name, .Weight or .Angle are set to '' or ' ' an error 
%   will be thrown 
% - If standard values should differ from models default values, use the
%   parameters
% - It has no effect for the current model, if Simulink default values are
%   changed by using the GUI. You need to use the API in this case. 
% - The selected font should be directly portable (e.g. Simulink/Stateflow
%   default font) or convertible between platforms (e.g. Arial/Helvetica 
%   12pt).
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:17CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0043(system, cmd_s)





























































