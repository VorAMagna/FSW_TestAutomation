% Get the busstruct info of the mux block, even the setting: 'configuration
% parameters->diagnostis->connectivity->Mux blocks used to create bus
% signals' is 'error'.
%
% SYNTAX:
% =======
%   busstruct=mes_getMuxBusStruct(hblock)
%
% DESCRIPTION:
% ============
% If the model setting : 'configuration
% parameters->diagnostis->connectivity->Mux blocks used to create bus
% signals' is not 'error', using function get_param to obtain the sigal
% struct of a mux block will lead to crash of Matlab, this function get the
% same struct as using get_param but can be used in case the setting
% mentioned above is 'error'.
%
% INPUT ARGUMENTS:
% ================
% -  hBlock          double (no default value)
%                    Handle of the mux block.
%
% RETURN VALUES:
% ==============
% - busstruct    struct
%                A struct that has the input signal info of the block
%                busstruct(i).name-- signal name of the ith input signal
%                busstruct(i).src -- source block handle of the ith input signal
%                busstruct(i).srcPort--outport number of the src block
%                busstruct(i).signals-- a struct with same struct as
%                busstruct, if the signal is a bus or vector
% - errmsg       string
%                Error message if the error occurs
% EXAMPLE(S):
% ===========
% [busstruct,errmsg]=mes_getMuxBusStruct(hblock);
%
% *************************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:11CEST $
% Revision:   $Rev$
% *************************************************************************

function [busstruct,errmsg]=mes_getMuxBusStruct(hblock)






































































































































































































































































































