% MES check: misra_slsf_026_c - Port names and corresponding signal names,
% Part C
%
% function [result,cr_items,r_stats] = mes_misra_slsf_026_c(system, cmd_s)
%
% INPUT PARAMETERS:
% =================
%   system:  model/subsystem to be checked
%   cmd_s:   check options, syntax /<key>:<val>, for details See also
%   mes_jc_0061
%
% MES CHECK:
% ==========
% MES check: misra_slsf_026_c -  Port names and corresponding signal
% names
%
% All input and output port names, including trigger and enable blocks, must
% be named and be identical to the corresponding signal or bus label
% connected to the port, if one exists.
%
% Exception:
% - When creating reusable blocks, the port name must be generic and visible
%   with no label on the signal.
%
%
% NOTE:
% =====
% In order to handle direct connection of inports, outports, enable or
% trigger blocks, a suffix or prefix should be used on the blocks. 
% This selected suffix/prefix should be used consistantly throughout the
% model. 
%
% RATIONAL:
% =========
% Allows accurate identification of data flow through a hierarchical model.
% A re-useable block has predefined input and output labels and as such when
% re-applied in different architectures will have non-matching labels. The
% re-usable block will have been validated in its library form with the given
% labels and if modified will require re-validation.
%
% PASS/FAIL CRITERIA:
% ===================
% The names of Inports and Outports match the labels of the connected signals
% except for the following cases:
% - Reusable library blocks use generic port names. Connected signals have
%   no label.
% - Input and output port blocks connected to the same signal use the same
%   signal name plus prefix or suffix.
% - Also use prefix or suffix if the port block name would be the same as
%   any other block name, i.e. any block has the same name as a signal
%   connected to a port.
%
% SOLUTION:
% =========
% Adapt signal or block names.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:17CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_026_c(system, cmd_s)








































