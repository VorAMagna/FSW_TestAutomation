%% Placement of the default transition
%
% [result,cr_items,r_stats] = mes_jc_0531(system, cmd_s)
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
% Guideline Rule ID: jc_0531 (8.1.8.)
%
% DESCRIPTION:
% ============
% - Default transition is connected at the top of the destination object.
% - The destination object of the default transition is put above the other
%   objects in the same hierarchy.
%
% PASS/FAIL CRITERIA:
% ===================
% Each default transition receives a fail, that
% - has Option DestinationOclock greater than 10.5 or smaller than 1.5
% - is connected to an object, which is not the most upper object (not
%   considering the default transition itself) in the considered hierachy
% 
% Furthermore a fail is given to an object, if it contains more than one
% default transition. In this case, the position of the destination object
% and the position of the connection between default transition and 
% destination object is NOT checked. 
%
% SOLUTION:
% =========
% Reposition the connection between default transition and destination
% object. 
% Reposition the position of the default transition destination object such
% that it is most upper left object. 
%
% FIX OPERATION:
% ==============
% No automatic fix available. 
%
% CHECK PARAMETERS:
% =================
% No parameters are used.
%
% NOTE:
% =====
% - 'objects' covers 'states', 'graphical functions', 'boxes', 'embedded
%   Matlab functions', 'simulink function block' and 'truth tables. 
% - related Guideline only consideres 'states' for 'objects'. This
%   implementation checks on a more generale basis and considered all
%   stateflow objects
% - 'upper' is defined as: the upper left corner of the destination object
%   (case non-junction object) or the 12 O'clock coordinate (case junction)
%   is more upper than all other upper left corners 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:33CEST $
% Revision:     $Rev: 6115 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_jc_0531(system, cmd_s)








































