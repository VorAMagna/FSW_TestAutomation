% function type_DDId = mes_find_match_TLDDScaling(Scaling_name)
%
% Description:
% ============
% Find the Scaling ID defined in DD with name as datatye name (include the
% path of scaling group, such as 'Scalings/datatye'.
% If more than one Scaling with same name exist in different Scaling groups,
% this function can find the right one.
%
% INPUT PARAMETERS:
% =================
% - Scaling_name: Scaling name, include the Scaling group, it is the value of
%                  the 'Scaling' field of the TL block dialog
%
% RETURN VALUES:
% ==============
% - type_DDId: id of the Scaling definition in the TargetLink Data
%             Dictionary with Scaling name as given; or empty if no this
%             Scaling in DD
%
% EXAMPLE:
% ========
%   Scaling_name='ScalingGroup/Input'
%   type_DDId=mes_find_match_TLDDScaling(Scaling_name)
%     get the Scaling id from DD, then type_DDId can be used in dsdd to get
%     other attribute, such as :
%     storage=dsdd('Get',type_DDId,'module')
%
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:06CEST $
% Revision:   $Rev: 5916 $
% ****************************************************************

function type_DDId = mes_find_match_TLDDScaling(Scaling_name)



























