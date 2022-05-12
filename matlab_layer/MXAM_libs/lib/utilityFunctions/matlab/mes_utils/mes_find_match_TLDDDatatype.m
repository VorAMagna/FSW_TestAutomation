% function type_DDId = mes_find_match_TLDDDatatype(datatype_name)
%
% Description:
% ============
% Find the datatype ID defined in DD with name as datatye name (include the
% path of datatype group, such as 'datatypes/datatye'.
% If more than one datatype with same name exist in different datatype groups,
% this function can find the right one.
%
% INPUT PARAMETERS:
% =================
% - datatype_name: datatype name, include the datatype group, it is the value of
%                  the 'datatype' field of the TL block dialog
%
% RETURN VALUES:
% ==============
% - type_DDId: id of the datatype definition in the TargetLink Data
%             Dictionary with datatype name as given; or empty if no this
%             datatype in DD
%
% EXAMPLE:
% ========
%   datatype_name='datatypeGroup/Input'
%   type_DDId=mes_find_match_TLDDDatatype(datatype_name)
%     get the datatype id from DD, then type_DDId can be used in dsdd to get
%     other attribute, such as :
%     storage=dsdd('Get',type_DDId,'module')
%
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:05CEST $
% Revision:   $Rev: 5916 $
% ****************************************************************

function type_DDId = mes_find_match_TLDDDatatype(datatype_name)































