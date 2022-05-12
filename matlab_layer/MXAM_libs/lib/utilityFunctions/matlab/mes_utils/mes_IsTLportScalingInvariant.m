%test if the given TL_port block(inport or outport) is set to be scaling invariant
% SYNTAX:
% =======
% b_res = mes_IsTLportScalingInvariant( h_TLport)
%
% DESCRIPTION:
% ============
% If TL_port block is inside a TargetLink function subsystem, it is
% possilbe that this block is defined to be scaling invariant. This
% funciton check the setting of the TL_Function block and execute the
% scaling propagation script, if this block is defiend as scaling
% invariant, this function return true, otherwise, return false.
%
% Note: if Ret_In(i).invaiant ==1, then the scaling of this port is not
% valid, but it should be the scaling of its source block.
%
% INPUT ARGUMENTS:
% ================
% -  h_TLport     (double) (no default value)
%                    Handle of the Targetlink port(inport or outport) block.
%
% RETURN VALUES:
% ==============
% - b_res           true if given TL block is scaling invariant, otherwise,
%                   false
% ****************************************************************
% Copyright:  Model Engineering Solutions
% ****************************************************************

function [b_res,s_error] = mes_IsTLportScalingInvariant( h_TLport )
































































































































































