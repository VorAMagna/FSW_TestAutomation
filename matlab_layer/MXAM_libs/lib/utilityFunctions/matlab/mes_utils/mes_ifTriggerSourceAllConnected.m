%Test if the trigger source block (if action and switch case) has all
%conditions and all trigger signals are connected with a triggered
%subsystem.
% SYNTAX
% ======
% res=mes_ifTriggerSourceAllConnected(h,b_isHTriggerSource)
%
% DESCRIPTION:
% ============
% If a subsystem is a triggered subsystem, this function tests if the
% trigger source block has all conditions included and all trigger signals
% are connected with a triggered subsystem. 
% If the trigger source is a if block or a switch case block, this funtion
% tests if the option 'show else condition' or 'show default case' is
% selected and if all its outports are connected with a destination.
% If the trigger source is not if block or switch case block, this function
% returns always false.
%
% INPUT PARAMETERS:
% =================
% - h:             handle of the triggered subsystem or the trigger source
%                  block
% - b_isHTriggerSource: if == true, the first parameter h is then the
%                  handle of the trigger source block, otherwise, it is the
%                  handle of the triggered subsystem.
%                  default is false.
%
% RETURN VALUES:
% ==============
% - res:           =true, if all conditions are connected with a
%                  destination block, other wise, false.
%                  If the trigger source is not if block or switch case
%                  block, this function returns always false.
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:15CEST $
% Revision:   $Rev: 3136 $
% ****************************************************************

function res=mes_ifTriggerSourceAllConnected(h, b_isHTriggerSource)























































































