% function lb_res = mes_compareStringLists(cs_stringList,cs_admissibleStrings,s_option)  
% 
% This function determines whether the elements of a cell string have a certain match, specified
% by s_option, in another cell string.
% 
% INPUT:
% ======
% cs_stringList: Nx1 or 1xN cell array of strings 
% - holds the elements to be checked
%
% cs_admissibleStrings: Mx1 or 1xM cell array of strings 
% - cell string where matches are sought
%
% s_option: char
% - 'full': just check if the whole string is an element of cs_admissibleStrings  
% - 'withoutPostfix': check if a prefix (indicated by a closing underscore) of the string OR the whole string matches an element of cs_admissibleStrings  
% 
% OUTPUT:
% =======
% lb_res: Nx1 logical array
% - 0: no match found in cs_admissibleStrings
% - 1: match found in cs_admissibleStrings
%

function lb_res = mes_compareStringLists(cs_stringList,cs_admissibleStrings,s_matchOption)  




































