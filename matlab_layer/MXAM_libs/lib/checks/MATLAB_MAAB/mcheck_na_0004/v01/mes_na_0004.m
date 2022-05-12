%% Simulink model appearance
%
% [result,cr_items,r_stats] = mes_na_0004(system, cmd_s)
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
% Guideline Rule ID: na_0004 (7.1.1.)
%
% DESCRIPTION:
% ============
% The model appearance settings should conform to the following guidelines
% when the model is released. The user is free to change the settings
% during the development process.
%
% View Options:
% Model Browser (unchecked)
% Sreen Color (white)
% Status Bar (checked)
% Toolbar (checked)
% Zoom factor (normal, 100%)
%
% Block Display Options:
% Background Color (white) -> NOT CHECKED, see below
% Foreground Color (black) -> NOT CHECKED, see below
% Execution Context Indicator (unchecked)
% Library Link Display (None)
% Linearization Indicators (checked)
% Model/Block I/O Mismatch (unchecked)
% Model Block Version (unchecked)
% Sample Time Colors (unchecked)
% Sorted Order (unchecked)
%
% Signal Display Options:
% Port Data Types (unchecked)
% Signal Dimensions (unchecked)
% Storage Class (unchecked)
% Test point Indicators (checked)
% Viewer Indicators (checked)
% Wide Non-scalar Lines (checked)
%
% PASS/FAIL CRITERIA:
% ===================
% A pass is given to the model if all appearance settings conform with
% this guideline.
%
% SOLUTION:
% =========
% Set the model appearance settings according to this guideline.
%
% FIX OPERATION:
% ==============
% Fix set the model appearance settings according to this guideline. 
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% - This check only tests system-wide settings, so the following block 
%   settings are NOT tested: Background Color, Foreground Color
% - The guideline explicitly allows to change the settings during
%   development process. It is recommended not to apply this check in this
%   time to your models and just use it before the model is released.
% - Paths given in error messages corresponds to paths in Matlab 2012b
%  (Simulink Version 8.0). They might differ in other versions.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:39CEST $
% Revision:     $Rev: 7170 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0004(system, cmd_s)



































































