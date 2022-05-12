% merges the cell arrays cs1 and cs2 without duplicates of cs1 in cs2
% ignorecase: if true (default) case of chars is not relevant
%             if false, elements are compared casesensitive
% returned variables:
%   cs_out: cs1 + all elements of cs2 which are not a member of cs1
%   mapping2: array of the positions of the items of cs2
%             in the returned cs_out
%  note: cs2 is added to cs1, so duplicates within cs2 are removed,
%        whereas existing duplicates within cs1 are kept
%
% used by mes_preprocess
%
% revision history:
% 209/09/14: created by jsa
%

function [cs_out,mapping2]=mes_mergestringcells(cs1,cs2,ignorecase)











































