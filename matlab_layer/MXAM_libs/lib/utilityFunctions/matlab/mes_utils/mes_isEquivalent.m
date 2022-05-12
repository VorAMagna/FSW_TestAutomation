% returns true, if strings s1,s2 are equivalent according to table cse
% - equivalent pairs are tabled in the same row of cell of strings cse
% - order in row and case are not relevant
%
% SYNTAX:
% =======
%   b_res=mes_isEquivalent(cse,s1,s2)
%
% INPUT ARGUMENTS:
% ================
% cse: n x 2 cell array of strings
%      each row is a pair of equivalent strings
% s1,s2: strings to be searched in cse
%
% RETURN VARIABLE
% ===============
% b_res= (boolean)
%        true, if s1 and s2 are found in the same row of cse
%        otherwise false
%
% EXAMPLE:
% ========
% >> mes_isEquivalent({'one','uno';'two','due'},'two','due')
% ans = 
%        1
%
% ***********************************************************
% Copyright: Model Engineering Solutions
% Date:      $Date: 2020/07/31 16:10:17CEST $
% Revision:  $Rev:$
% ***********************************************************

function b_res=mes_isEquivalent(cse,s1,s2)










































