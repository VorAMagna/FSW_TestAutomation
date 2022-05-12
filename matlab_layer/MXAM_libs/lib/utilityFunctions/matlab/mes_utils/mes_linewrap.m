% wraps the text given in s into separate lines with upto maxlen chars
% at word breaks (whitespaces chars).
%
% input arguments:
%  s: string to be wrapped
%  maxlen: maximal chars per line, default: 80
% notes: - words in s are never split, even if they contain
%          more than maxlen chars,
%        - leading and trailing whitespaces are removed after the split
% 
% return variable: 
%  cs_out: cell array with lines of s
% 
% recognized whitespace characters: {space (char32), tab (char9)}
% Linefeed characters ( newline (char10), carriage return (char13)}
%   enforce a split of the string at that position

function cs_out=mes_linewrap(s,maxlen)




































































