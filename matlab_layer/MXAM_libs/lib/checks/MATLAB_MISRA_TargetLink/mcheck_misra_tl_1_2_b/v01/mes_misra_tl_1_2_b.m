%% Umlaute in Block Properties
%
% [result,cr_items,r_stats] = mes_misra_tl_1_2_b(system, cmd_s)
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
% Reference:
% Modelling style guidelines for the application of TargetLink in the
% context of automatic code generation, MISRA, November 2007, Version 1.0
%
% Guideline Rule ID: MISRA TL 1.2
%
% DESCRIPTION:
% ============
% All comments provided should be valid ANSI C comments without 'umlaute'.
% The rule ensures that comments on the block level can be transformed into
% valid C comments.
%
% PASS/FAIL CRITERIA:
% ===================
% A block receives a fail if its description does contain 'umlaute', i.e.
% 'äöüßÄÖÜ°'.
%
% A data dictionary variable receives a fail if
% - it model is connected to the parent data dictionary and
% - if the description of DD objects do contain 'umlaute', i.e. 'äöüßÄÖÜ°'.
%
% SOLUTION:
% =========
% Replace 'umlaute' with underscores or replace i.e. 'ä' with 'ae'.
%
% FIX OPERATION:
% ==============
% Fix will replace
% ä with ae
% ö with oe
% ü with ue
% ß with ss
% Ä with Ae
% Ö with Oe
% Ü with Ue
% ° with grad celsius
%
% CHECK PARAMETERS:
% =================
% No check parameters are used.
%
% NOTE:
% =====
% - Prohibited umlaute are hard coded. If this list should be extended,
%   please contact MXAM Support.
% - As DD objects, variables, scalings, typedefs, variable classes and
%   function classes are considered
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2019/03/29 12:54:15CET $
% Revision:     $Rev: 15335 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_misra_tl_1_2_b(system, cmd_s) %#ok<INUSD>


















































































































































































































































































