% splits string s into substrings using the delimiter characters s_delimiters
%
% SYNTAX:
% =======
% [cs_parts,cs_delimsfound]=mes_splitstring(s,s_delimiters,b_keeptags)
%
% INPUT ARGUMENTS:
% ================
%  - s: string to be splitted
%  - s_delimiters: string with definition of delimiter characters used to
%                  split s
%  - b_keeptags (boolean, default=false): if true, s is not split
%        inside a html-tag (a pair of matching brackes; '< ... >')
%        Unpaired brackets are not considered here.
%        When using this option, delimiters <,> are 
%        not allowed.
%
% RETURN VALUES:
% ==============
% - cs_parts:  cell array of substrings (without delimiter chars)
% - cs_delimsfound: cell array of strings with delimiter char sequences found in s.
%              size = size of cs_parts or size of cs_parts + 1
%              note: cs_delimsfound{1} is reserved for leading delimiters and is empty,
%                    if no leading delimiters exist, cf. [p,d]=mes_splitstring('a;b',';')
%                     p = { 'a'    'b'}
%                     d = { []     ';'}
%
% DESCRIPTION:
% ============
% Splits string s into substrings using the delimiter characters given in 
% s_delimiters and returns the parts of the split string and the found
% delimiters. Optionally, html-tags are kept (not split)
%
% EXAMPLES
% ========
% [parts,delims]=mes_splitstring('<<2>d<3de4','de',true)
%
% parts = 
%     '<<2>'    '<3'    '4'
%
% delims = 
%      ''    'd'    'de'
%    
%
% 
% *************************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:28CEST $
% Version:    $Rev: 3161 $
% *************************************************************************

function [cs_parts,cs_delimsfound]=mes_splitstring(s,s_delimiters,b_keeptags)




















































































































































