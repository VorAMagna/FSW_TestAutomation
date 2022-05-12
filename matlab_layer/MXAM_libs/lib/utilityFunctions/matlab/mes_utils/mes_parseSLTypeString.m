% parses simulink data type string and returns base type, lsb and offset
%
% syntax:
%    [s_basetype,d_lsb,d_offset,s_err,b_isbusobj]=mes_parseSLTypeString(s)
%
% input argument:
%   s: simulink data type string,
%      e.g. obtained by get(h_ports.Outport(1),'CompiledPortDataTypes')
%
% return variables:
%   s_basetype: string with base type, e.g. 'Int8','UInt16','Double'
%   d_lsb: gain or lsb of scaling, if variable is not scaled, d_lsb=1
%   d_offset: offset/bias of scaling, if variable is not scaled, d_offset=0
%   s_err: string with error message or empty, if no error occured
%   b_isbusobj: true if the input s is a simulink.bus object
% examples:
%
% >> [basetype,lsb,offs]=mes_parseSLTypeString('sfix16_En1_B1p2')
%
%  basetype='Int16'
%  lsb=0.5
%  offs=1.2
%
% >> [basetype,lsb,offs]=mes_parseSLTypeString('ufix8_Sp22')
%
%  basetype='UInt8'
%  lsb=0.22
%  offs=0
%
% *************************************************************************
% Copyright: Model Engineering Solutions
% Revision: $Rev: 3136 $
% Date:     $Date: 2020/07/31 16:10:23CEST $
% *************************************************************************

function [s_basetype,d_lsb,d_offset,s_err,b_isbusobj]=mes_parseSLTypeString(s)















































































































































