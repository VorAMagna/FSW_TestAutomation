%% Port block name visibility in Simulink models
%
% [result,cr_items,r_stats] = mes_na_0005(system, cmd_s)
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
% Guideline Rule ID: na_0005 (7.1.4.)
%
% DESCRIPTION:
% ============
% For some items it is not possible to define a single approach that is 
% applicable to all organizations internal processes. However, it is 
% important that within a given organization, a single consistent approach 
% is followed. An organization applying the guidelines must select one of 
% the following alternatives to enforce.
% Organizationally-Scoped Alternatives (follow one practice):
% 1. The name of an Inport or Outport is not hidden. ('Format / Hide Name'
%    is not allowed.) 
% 2. The name of an Inport or Outport must be hidden. ('Format / Hide Name'
%    is used.) Exception: inside library subsystem blocks, the names may 
%    not be hidden.
%
% PASS/FAIL CRITERIA:
% ===================
% Depending on parameter MAAB.na_0005.PortNameVisibility, each Inport and
% Outport receives a fail, if their names are hidden (parameter is set to
% 'on') or not hidden (parameter is set to 'off') 
%
% SOLUTION:
% =========
% Depending on the solution for your orgainzation hide or do not hide the 
% name of  the inports and outports by switch on/off 'Format->Hide Name'
% (path in Matlab 2012b) or use the the Simulink API (corresponding
% parameter is 'ShowName')
%
% FIX OPERATION:
% ==============
% Depending on parameter MAAB.na_0005.PortNameVisibility, fix will hide/
% 'un-hide' all inport/outport names. 
%
% CHECK PARAMETERS:
% =================
% MAAB.na_0005.PortNameVisibility:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'on'
%   DESCRIPTION:
%       If 'on', names of inports/outports must be visible. If 'off', names 
%       of inports/outports must be hidden. 
%
% NOTE:
% =====
% This check considers SL and TL Inports and Outports. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:39CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_na_0005(system, cmd_s)



















































