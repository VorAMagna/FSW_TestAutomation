%% ismember for case ismember(A,B,'rows') where A and B are cell arrays of strings
%
% lb = mes_ismemberForCellArraysRowwise(cs_Given,cs_ToLookFor)
%
% INPUT:
% ======
% cs_Given and cs_ToLookFor, type: cell array of strings, both array must 
%           have same number of columns               
%
% OUTPUT:
% =======
% lb, type: list of boolean,  
%     If i-th entry of lb is true, i-th row of cs_Given is a member of 
%     cs_ToLookFor.
% 
% NOTE:
% =====
% If cs_Given and cs_ToLookFor have only one column, result of 
% mes_ismemberForCellArraysRowwise(cs_Given,cs_ToLookFor) is equal to
% ismember(cs_Given,cs_ToLookFor).
%
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:22CEST $
% Revision:     $Rev: 6716 $
% *************************************************************************

function lb = mes_ismemberForCellArraysRowwise(cs_Given,cs_ToLookFor)



































