%% Stateflow: Strong Data Typing at the Output Interface
%
% [result,cr_items,r_stats]=mes_sdt_sc002_c(system,cmd_s)
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
% MES Functional Safety Guidelines
% Release 1.7 (21 June 2013)
% Corresponding Guideline: 2.1 
%
% DESCRIPTION:
% ============
% If Stateflow Charts reside in a Targetlink system, data types, 
% scalings, and ranges of all output signals must be consistent
% with their destination block.
% 
% When used in a TargetLink model of TargetLink version prior to 2.2, 
% the inheritance mechanism for the Size and Data Type properties at
% the Simulink-Stateflow interface must not be used.
%
% PASS/FAIL CRITERIA:
% ===================
% If a chart fulfills the following conditions, a pass will be given:
% For a TargetLink model, the following conditions must all be fulfilled
% for the outports of a given Stateflow Chart diagram block.
% 
% For all outports which connect to a TL outport, the data types, scalings 
% and ranges must be the same as that of the TL outport, or the TL outport
% must have the option 'inherit properties' selected. 
% 
% Additionally, under TL version 2.2, the inheritance mechanism for the 
% Size and Data Type properties at the Simulink-Stateflow interface must 
% not be used.
%
% For all other cases a fail will be given to the chart or the involved 
% port.
%
% SOLUTION:
% =========
% Adapt the properties of each Inport to a SF Chart according to this 
% guideline. 
% 
% FIX OPERATION:
% ==============
% No automatically fix available. 
% 
% CHECK PARAMETERS:
% =================
% SDT.sc002_c.IgnoreUndefinedSFVariableRange:
%   DATATYPE: 
%       boolean
%   DEFAULT VALUE:
%       true (1)
%   DESCRIPTION:
%       If true, empty Variable Ranges of Stateflow variables will be 
%       ignored. If false, they will raise an error.
% 
% SDT.sc002_c.RangeDifferenceThreshold:
%   DATATYPE: 
%       float
%   DEFAULT VALUE:
%       1e-5
%   DESCRIPTION:
%       Range comparison fails, if min or max values differ by more than  
%       this value
% 
% SDT.sc002_c.UseDataRangeForMissingUserRange:
%   DATATYPE: 
%       boolean
%   DEFAULT VALUE:
%       true (1)
%   DESCRIPTION:
%       If true, data ranges will be used, if user defined range data are
%       missing. 
% 
% NOTE:
% =====
% If TargetLink Version is higher than 2.2, corresponding part mentioned in
% advice will not be checked. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:07CEST $
% Revision:     $Rev: 7366 $
% *************************************************************************

function [result,cr_items,r_stats]=mes_sdt_sc002_c(system, cmd_s)
































































































































































































































































































































































































































































































































