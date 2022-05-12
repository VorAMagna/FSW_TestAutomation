% DESCRIPTION:
% ============
% Checks the signal name of the outport of the given block. For propagated
% signal name, no leading '<' and trailing '>' are included.
%
% SYNTAX:
% [name,b_propPropagation,lh] =
% mes_getOutputSignalName(hBlock,portIndex,b_outportInport)
%
% INPUT PARAMETERS:
% =================
% - hBlock:    block handle
% - portIndex: one-base index of outport or inport
% - b_outportInport: if true, get the name of the output signal, if false,
% get the name of the input signal at given inport. default is true.
% - s_TypeOfPort: string, optional argument, gives the user the possibility
% to define Trigger or Enable Port as port for an incoming signal.
% Must be a member of the list 
% {'Inport','Outport','Enable','Trigger','State','LConn','Rconn','Ifaction'}
%
% RETURN VALUES:
% ==============
% - name:       String, the label of the output signal. For propagated
%               signal name, no leading '<' and trailing '>' are included.
% - b_propPropagation: if true, property 'signalpropagation' of the signal line is
%               'on', if false, the property is off.
% - lh          handle of the line whose name is returned
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:12CEST $
% Revision:      $Rev: 5543 $
% ***********************************************************

function [name,b_propPropagation,lh] = mes_getOutputSignalName(hBlock,portIndex,b_outportInport,s_TypeOfPort)





































































































































