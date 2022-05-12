% b_attributeSelection = mes_ifGivenAttributeExists(id_hdata,s_attributeToCheck)
% Description:
% Checks whether the given attribute of a TargetLink block exists, and returns whether the attribute is
% selected or not. In older matlab versions, some attributes do not exist.
%
% Example: b_createinputvariable = mes_ifGivenAttributeExists(ID_data,'createinputvariable')
%
% Inputs:
% ID_data: ID of a Stateflow Object of a Chart in a TargetLink Model.
% s_attributeToCheck: (string) Name of the attribute to be verified.
%                   
% Outputs:
% b_IfAttributeSelected: (boolean), 1 - If the given attribute is selected.
%                                   0 - If the given attribute is not selected.
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright: Model Engineering Solutions
% Version:   $Rev:  $
% Date:      $Date: 2020/07/31 16:10:15CEST $
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function b_IfAttributeSelected = mes_ifGivenAttributeExists(ID_data,s_attributeToCheck)

























