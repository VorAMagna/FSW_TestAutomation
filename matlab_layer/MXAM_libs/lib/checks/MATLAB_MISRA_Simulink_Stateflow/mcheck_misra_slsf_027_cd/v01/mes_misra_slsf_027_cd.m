%% Signal and Bus Label Usage - Inport/Outport
%
% [result,cr_items,r_stats] = mes_misra_slsf_027_cd(system,cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistics on the check result
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>,
%
% MES CHECK:
% ==========
% misra_slsf_027_cd - Signal and Bus Label Usage - Inport/Outport
% 	
% C: All signals and busses passing through an inport must be labeled.
% D: All signals and busses passing through an outport must be labeled. 
% 
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each signal line in the model.
%  - Failed 1: The signal passes through an Inport block and it is not labeled.
%  - Failed 2: The signal passes through an Outport block and it is not labeled. 
% The check result is passed if all failed cases do not apply.
%
% CHECK PARAMETERS:
% =================
% MISRA_SL_SF.BasicMaskedBlocks:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {''}
%   DESCRIPTION:
%       Each entry of list is a masktype and represents a masked basic  
%       block. Signal lines placed in such blocks are not considered by 
%       Guideline. Note: Blocks with empty MaskType will be ignored.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% ***********************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_027_cd(system,cmd_s)



















































































































































