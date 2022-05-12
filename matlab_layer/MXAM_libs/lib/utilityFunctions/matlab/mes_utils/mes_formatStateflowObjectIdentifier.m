% s_label = prepareObjectLabel(h_object,kind,letters) 
% 
% returns formatted identifier of Stateflow object h_object.
%
% If h_object is a Stateflow.Junction, an empty string is returned.
%
% INPUT:
% h_object: struct,  Stateflow object i.e. a transition, a state 
% kind:     string,  identifier corresponding to h_object, i.e. 'LabelString' 
%                    for a transition, 'name' for a state
% letters:  integer, length of s_label. Objects identifier is cut after
%                    'letters' characters.
%                    Optional input, default value is 15.
%
% OUTPUT:
% s_label:  string,  formatted identifier of h_object. Each linebreak is
%                    eliminated and length(s_label)=letters
% 
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:06CEST $
% Version:      $Rev: 6390 $
% ***********************************************************

function s_label = mes_formatStateflowObjectIdentifier(h_object,kind,letters) 
































