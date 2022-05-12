% mes_findDuplicates: Find duplicates
%
% B = mes_findDuplicates(A) for the vector A returns values that are 
% non-unique in A. B will also be sorted. A can be a cell array of 
% strings. 
%
% [B,I]= mes_findDuplicates(A) also returns, index Vector I, which gives 
% the position of the non-unique elements in A. I is an cell array where 
% each row contains the indices for the corresponding value in A. 
%
% [B,I,J] = mes_findDuplicates(A) also returns how often each value in B 
% appears in A.
%
% Depending on A, I and J might be a row- or a columnvector.
%  
%
% Example 1:
%   A = [1 1 2 3 2 5 4 5 1];
%   [B,I,J] = mes_findDuplicates(A) 
%
% returns
%
%   B = 
%        1     2     5 
% 
%   I =  
%       [1x3 double]    [1x2 double]    [1x2 double]
% 
%   J = 
%        3     2     2
% 
% 
% where 
%   I{1}
%   ans =
%      1     2     9 

function [duplicates,indizes,times] = mes_findDuplicates(input)








































































































