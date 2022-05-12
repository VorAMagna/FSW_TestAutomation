%
% This function checks if i_count 1, then the returned string is an empty
% string, otherwise the plural ending is returned. 
% This is useful for error messages to avoid the possible plural (s).
%
% function [s_ending] = mes_getPluralEnding(i_count, s_ending)
%
% INPUT:
% =======
% i_count - integer 
% s_ending - string with the plural ending which is needed in the context
% 
% OUPUT:
% ======
% s_ending -  empty string or input string s_ending, depending on i_count
% 
% EXAMPLE:
% ========
% >> number_uncondTrans = 2;
% >> s_ending =  mes_getPluralEnding(number_uncondTrans, 's');
% >> msg=['This junction should have exactly one outgoing unconditional transition, but this junction has ' ...
%     num2str(number_uncondTrans) ' outgoing unconditional transition' s_ending '.'];
% >> msg
% 
% msg =
% 
% This junction should have exactly one outgoing unconditional transitio n, 
% but this junction has 2 outgoing unconditional transitions.

function [s_ending,s_verb] = mes_getPluralEnding(i_count, s_ending)



















