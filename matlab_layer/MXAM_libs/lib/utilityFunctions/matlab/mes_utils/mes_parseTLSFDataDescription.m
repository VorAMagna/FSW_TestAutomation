% gets lsb, data type, offset and data inheritance info from the targetlink description string of a stateflow data object
%
% syntax:
%   [d_lsb,s_type,d_offset,s_class,i_scalingmode,cs_errs]=mes_parseTLSFDataDescription(s_descrip)
% 
% input arguments:
%  - s_descrip: description string of SF-Data object
%  
% return values:
%  - d_lsb (double): scaling lsb (value of least significant bit, a.k.a. gain,slope)
%                    default=1
%  - s_type (string): data type
%  - d_offset (double): scaling offset (bias)
%                       default=0
%  - s_class (string): data class [input,local,output]
%  - i_scalingmode (integer): 
%      0 (explicit): lsb and offset are directly specified in the description string
%      1 (from dd): (keyword scaling=<DDSCALING>: lsb and offset are taken from
%            the datadictionary scaling definition <DDSCALING>
%      2 (inherited): d_lsb,offset and type are inherited from the input of the
%         chart (TL property, only for input variables.
%         Note that, in this case, Targetlink ignores all other entries in the
%         description
%  - cs_errs (cell of strings): error and warnings, if applicable
%
% examples:
% '$TL$ type=UInt8; offset=5; lsb=8; inheritscaling=1; createinputvariable=1;$TL'
% '$TL$ type=UInt8; scaling=VOID_SCALING; inheritscaling=1; createinputvariable=1; $TL$
%
% notes:
% - if no class or variable entry exists, corresponding return values are empty.
% - if a DD Scalingobject is specified (e.g. "scaling=<ddscaling>"), lsb and offset 
%      is taken from the definition in the data dictionary
% - if  inheritscaling is set, ignored type,lsb,offset,dd-scalings are NOT
%      returned, even if they are specified in the description.
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright: Model Engineering Solutions
% Version:   $Rev: 3136 $
% Date:      $Date: 2020/07/31 16:10:23CEST $
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [d_lsb,s_type,d_offset,s_class,i_scalingmode,cs_errs,s_variable]=mes_parseTLSFDataDescription(s_descrip)




















































































































































































































