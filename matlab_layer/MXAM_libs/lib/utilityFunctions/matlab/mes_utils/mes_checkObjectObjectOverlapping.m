% [h_overlap,errmsg] = mes_checkObjectObjectCrossing(lh_objects1,lh_objects2,dist)
%
% returns handles of objects in lh_objects1 which overlap objects in 
% lh_objects2. 'Objects' could be signal-line segments or block-lines. 
%
% INPUT: 
% lh_objects1:  Either:
%               1. matrix, list of block or line handles
%               or
%               2. matrix [x1 y1 x2 y2 handle], where 
%                - (x1,y1): source coordinates of line
%                - (x2,y2): destination coordinates of line
%                - handle:  handle of signal-segment
% lh_objects2:  Either:
%               1. matrix, list of block or line handles
%               or
%               2. matrix [x1 y1 x2 y2 handle], where 
%               	- (x1,y1): source coordinates of line 
%                   - (x2,y2): destination coordinates of line
%                   - handle:  handle of block
% dist:         Scalar, allowed distance between two parallel lines. Unit
%               is pixel. Optional input. 
%
%
% Input lh_objects2 is optional. If only one input is provided, lh_objects2
% is set equal to lh_objects1, i.e. each object in lh_objects1 is checked,
% if it overlaps the other objects in lh_objects1
%
% If you want to set 'dist' but not use lh_objects2, set lh_objects2 =[];
%
% OUTPUT:
% h_overlap: Matrix of handles, h_cross consists of two columns. Each row
%            returns handles of an objects of lh_objects1 (column1) which 
%            overlaps an object of lh_objects2 (column2, same row).
% errmsg:    String, in case of wrong input
%
% NOTE 1: 
% You might get the source and destination coordinates of some signal-segments
% by using Simulink API.
% Assume, that lh_lines represents a list of handles of signal-lines in one
% subsystem. 
% Then:
%     allLines = [];
%     for j=1:length(lh_lines)
%         h_signal = get(lh_lines(j),'Handle');
%         points = get(h_signal,'Points');
%         allLines = [allLines; points(1:end-1,:) points(2:end,:) h_signal*ones(size(points,1)-1,1) ]; 
%     end
%
% returns a matrix, which fits as an input for this function
%
% NOTE 2:  
% You might get the edges of a block by using the Simulink API. 
% Assume that lh_blocks represents al list of handles of blocks in one
% subsystem. 
% Then: 
%     allBlockLines = [];
%     positions = get(lh_blocks,'Position');
%     positions = reshape([positions{:}],4,size(positions,1))';
%     for j=1:size(positions,1)
%         allBlockLines = [allBlockLines;...
%                           [positions(j,1) positions(j,2) positions(j,1) positions(j,4);
%                            positions(j,1) positions(j,4) positions(j,3) positions(j,4);
%                            positions(j,3) positions(j,4) positions(j,3) positions(j,2);
%                            positions(j,3) positions(j,2) positions(j,1) positions(j,2)] ...
%                           lh_blocks(j)*ones(4,1)];
%     end
% 
% returns a matrix, which fits as an input for this function
%
% NOTE 3: 
% lh_objects1 (and lh_objects2) could contain handles of lines and of
% blocks. 
%
% NOTE 4:
% You might also use this function to check Stateflow transitions and objects. 
% For this case, you have to choose the second option for both inputs (matrix).
% Furthermore, this function can only treat linear transitions, i.e. vertical, 
% horizontal or diagonal transitions.
% It is recommended to apply 'mes_prepareStateflowTransitions' and 
% 'mes_prepareStateflowBlocks' to the transitions and objects (states, juctions 
% etc.) you want to analyse and use its outputs as inputs for this function.
% 
% Note, that in the case of Stateflow, h_cross does not contain
% handles but ids. 
%
% *************************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:03CEST $
% Version:    $Rev: 7253 $
% *************************************************************************

function [h_overlap,errmsg] = mes_checkObjectObjectOverlapping(lh_objects1,lh_objects2,dist) 





























































































































































































































































































