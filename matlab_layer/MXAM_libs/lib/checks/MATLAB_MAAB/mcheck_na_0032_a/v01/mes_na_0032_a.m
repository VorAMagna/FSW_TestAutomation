%% Use of Merge Blocks: Identical buses
%
% [result,cr_items,r_stats] = mes_na_0032_a(system, cmd_s)
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
% Guideline Rule ID: na_0032 (7.1.14.)
%
% DESCRIPTION:
% ============
% When using merge blocks:
%  - All buses must be identical. This includes: Number of elements,
%    element names, element order, element data type, element size
%  - Buses must be either all virtual or all non-virtual
%
% PASS/FAIL CRITERIA:
% ===================
% Each Merge block , that has set the option 'Allow unequal port widths' to 
% 'on' receives a fail. 
%
% SOLUTION:
% =========
% Uncheck the option 'Allow unequal port widths'.
%
% FIX OPERATION:
% ==============
% Fix action will set the option 'Allow unequal port widths' to 'off'
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% - Checking the option 'Allow unequal port widths' is sufficient enough to
%   fulfill this guideline. 
%   Reason: If 'Allow unequal port widths' is set to 'off', setting the model 
%   into compile mode would fail if one of the demands of this guideline is 
%   not fulfilled. But setting the model into compiled mode is necessary if
%   one wants to analyse the incoming buses/signals of a (merge)-block. 
%   Therefore it is sufficient to ensure, that it is not possible to set the
%   model into compiled mode while there is at least one point of this
%   guideline that is not fulfilled. 
% - To check Signals/Buses entering Merge blocks, use mes_na_0032_b
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:44CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0032_a(system, cmd_s)













































