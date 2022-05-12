%% Strong Data Typing at the Stateflow Interface - Input Interface
%
% [result,cr_items,r_stats] = mes_sdt_sc002_b(system,cmd_s)
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
% DESCRIPTION:
% ============
% If Stateflow Charts reside in a Targetlink system, data types,
% scalings, and ranges of all input signals must be consistent
% with their sources.
%
% When used in a TargetLink model of TargetLink version prior to 2.2,
% the inheritance mechanism for the Size and Data Type properties at
% the Simulink-Stateflow interface must not be used.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each input data item of every Stateflow chart of a TargetLink model.
%  - Passed1: the setting "sf.inheritscaling" is "true" and the minimum range value 
%             (limit.min) and the maximum range value (limit.max) match with their 
%             corresponding range values of the respective source block.
%  - Passed2: the setting "sf.inheritscaling" is not "true", but
%      - the data type, scaling and range values are the same as that of the output of the 
%        TargetLink block that connects with this input, or
%      - the description field of this input is empty (no TargetLink properties are defined). 
%  - Passed3: the inport is set to scaling invariant and the data type is same as its source.
% The check issues a failed if these passed cases do not apply. 
%
% SOLUTION: 
% ========= 
% Adjust the data type, scaling and range values of each reported input
% data item such that these settings match with the TargetLink block that
% connects with that input. Note, that the data type, scaling and range
% values of the Stateflow input can be set in the property manager or in
% the description of the input data item. Alternatively, consider adapting
% the value of the setting "sf.inheritscaling" or adapting the particular
% TargetLink block that connects with a reported data item. In case of a
% range value error, adapt the check parameter
% "SDT.sc002_b.RangeDifferenceThreshold" that defines a tolerated
% difference for two range values.
%
% FIX OPERATION:
% ==============
% No automatic repair action available. 
%
% CHECK PARAMETERS:
% =================
% SDT.sc002_b.IgnoreUndefinedSFVariableRange:
%   DATATYPE:
%       boolean
%   DEFAULT VALUE:
%       true (1)
%   DESCRIPTION:
%       If true, empty Variable Ranges of Stateflow variables will be
%       ignored. If false, they will raise an error.
%
% SDT.sc002_b.RangeDifferenceThreshold:
%   DATATYPE:
%       float
%   DEFAULT VALUE:
%       1e-5
%   DESCRIPTION:
%       Range comparison fails, if min or max values differ by more than
%       this value
%
% SDT.sc002_b.UseDataRangeForMissingUserRange:
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
% If no min or max values should be considered, this check could be ignored
% if sf.inheritscaling is true.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************

function [result,cr_items,r_stats]=mes_sdt_sc002_b(system, cmd_s)

















































































































































































































































































































































































































































































































































