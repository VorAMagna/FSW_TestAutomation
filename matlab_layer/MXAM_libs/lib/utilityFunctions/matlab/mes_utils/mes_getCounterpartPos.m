% function pos = mes_getCounterpartPos(s_text,s_char,start_pos)
%
% DESCRIPTION:
% ============
% Find the position of the counterpart of the given char in the given
% string.
% The given char can be '(', ')', '{', '}', '[' and ']'.
% 
% INPUT PARAMETERS:
% =================
% - s_text:    given string to be searched
% - s_char:    counterpart of this char is searched in s_text
% - start_pos: search start position of s_text,if text is abc(aaa), and the
% s_char='(', the start_pos must be 5, e.g, start position is the position
% after the original char whose conterpart is searched.
%
% RETURN VALUES:
% ==============
% - pos: position of the found counter part
%
% EXAMPLE:
% ========
% mes_getCounterpartPos(s,'(',i+1);
%
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:10CEST $
% Revision:   $Rev: 3136 $
% ****************************************************************

function pos = mes_getCounterpartPos(s_text,s_char,start_pos)





















































































