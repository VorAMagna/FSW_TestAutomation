% DESTINATIONENDPOINT [x y] spatial coordinates for the endpoint of a
% transition in Stateflow
%
% DestinationEndpoint = mes_getDestinationEndpoint(lh_trans)
% computes the coordinates for the endpoints of all  transitions stored in
% lh_trans
%
% INPUT:
% ======
% lh_trans -> (list of handles) list of transitions.
%
% OUTPUT:
% =======
% DestinationEndpoint -> (matrix) contains rowwise the x and y coordinate
%                        of the DestinationEndpoint for each transition in 
%                        lh_trans.
%
% NOTE:
% The API Junction.Position.Center returns only FLOOR values [x y].
% Therefore the actual center is positioned somewhere in a circle with
% center [x y] and radius 0.9999... .
% To compensate this error, we add a correction of 0.5 to x and y. If you
% need the actual value, you have to look into the .mdl file. 
%
% *************************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:10CEST $
% Version:    $Rev: 7398 $
% *************************************************************************

function DestinationEndpoint = mes_getDestinationEndpoint(lh_trans)









































































































































































