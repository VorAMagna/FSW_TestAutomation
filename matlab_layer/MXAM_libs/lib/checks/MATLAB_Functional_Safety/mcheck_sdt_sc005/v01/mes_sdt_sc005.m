%% Signal Lines: Name Propagation
%
% [result,cr_items,r_stats]=mes_sdt_sc005(system,cmd_s)
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
% The signal name should be propagated as far as possible, i.e  until the 
% signal name is changed purposely or signal is connected to a block that 
% can not propagate its name.
%
% PASS/FAIL CRITERIA:
% ===================
% Each signal, that has a source block (user defined) as its source is 
% considered and receives a pass if
% - it has a signal name AND
% - all the signals that can inherit this signal name have set the property 
%   'signalPropagation' to 'on'.
% 
% If a signal has a name that is different to its source signal, it is 
% regarded as be changed purposely. In this case no error is reported, as
% long as property 'signalPropagation' is not set to 'on'.
% 
% SOLUTION:
% =========
% Set the signal property 'signalPropagation' of failed signal lines to 
% 'on'.
% 
% FIX OPERATION:
% ==============
% Fix will set property 'signalPropagation' of signal lines to 'on'.
% 
% CHECK PARAMETERS: 
% =================
% SDT.sc005.UserSourceBlocks:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%      {'SubSystem', 'CONSTREAL'; ...                                
%       'SubSystem','CONSTLOGIC';...
%       'Constant','TL_Constant';...
%       'Inport','TL_Inport' }
%   DESCRIPTION:
%       Each row specifies a kind of block (blocktype, masktype), which is
%       treated as a source.
% 
% NOTE:
% =====
% - For failed signal lines, the source block of source signal line is
%   hilited. 
% - Reuseable subsystems are treated as sources.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:11CEST $
% Revision:     $Rev: 6834 $
% *************************************************************************

function [result,cr_items,r_stats]=mes_sdt_sc005(system, cmd_s)



































































