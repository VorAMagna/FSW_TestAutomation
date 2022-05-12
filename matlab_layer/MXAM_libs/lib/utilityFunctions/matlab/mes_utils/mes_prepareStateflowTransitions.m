% [allLines,id_nonlin] = mes_prepareStateflowTransitions(lh_trans,tol)
% selects vertical, horizontal and diagonal transitions and returns their 
% sourcepoint, destinationpoint and id such that they are in the correct
% form to use as inputs for mes_checkSignalSignalCrossing and 
% mes_checkSignalSignalOverlapping. 
% 
% INPUT:
% lh_trans, matrix: list of handles of transitions, 
% tol:              numeric, optional input, default = 5, unit:pixel
%                   is the tolerance how much the slope of the segment
%                   (sourcepoint,midpoint) might differe from the slope of
%                   the segment (midpoint,sourcepoint) and still treat the 
%                   corresponding transitions as diagonal.
%                   Note: The DestinationEndpoint of a transition with
%                   destination 'Junction' has a correction of 0.5 (look
%                   into the docu of mes_getDestinationEndpoint). Therefore
%                   tol should at least be equal to 1.
% 
% OUTPUT:
% allLines, matrix: [x_source,y_source,x_dest,y_dest,id],
%                   all transitions of lh_trans, which are vertical,
%                   diagonal or horizontal and their ids. 
% id_nonlin, vector: ids of all nonlinear transition of lh_trans
% tol:              tolerance, wich decides, of a diagonal is diagonal
% directions, vector: returns identifiers, if transitions is horizontal,
%                   vertical (=1), diagonal (=3);
%
% *************************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:24CEST $
% Version:    $Rev: 6317 $
% *************************************************************************

function [allLines,id_nonlin,tol,directions] = mes_prepareStateflowTransitions(lh_trans,tol)






































































































