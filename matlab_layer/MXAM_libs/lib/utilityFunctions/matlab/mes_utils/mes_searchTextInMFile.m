% Searches the m-file <infilename> for an occurence of <searchstring>
%
% SYNTAX:
% =======
% [cr_foundfiles] 
% =  mes_searchTextInMFile(infilename,searchstring,b_casesensitive,
%                          b_includeshadowedfiles,stopstring,
%                          mincount,maxcount,b_truncate_comments)
%
% Input arguments:
% ================
%  - infilename (string): name of file to be searched, optionally including path and extension.
%       If no path is provided, the mfile is searched in the MATLAB path by calling which(infilename)
%       If no extension is provided, the extenstion '.m' is assumed
%  - searchstring: text to be searched in infilename
%  - b_casesensitive (boolean, optional, default: false) if true, the search is done case sensitive
%  - b_includeshadowedfiles (boolean, default=false) if true, shadowed
%    files are included
%  - stopstring: if provided, the text between the found instance of <searchstring> and
%    and <stopstring> is returned.
%  - mincount: minimum number of occurrencies returned within a file, default=1
%  - maxcount: maximum number of occurrencies returned within a file, default=Inf
%              note: use this option to short-cut search when searching for first occurence only
%  - b_truncate_comments, boolean, default=false,
%    if true, comments will not be searched (lines will be truncated from the first comment char (%)
%
%
% Return values:
% ==============
%  - cr_foundfiles (cell array) records with findings of ith file
%          fields of cr_foundfiles{i}:
%            filename (string) path,name, and extension of the ith file
%                      where a matching text was found
%            rows (cell array) matching text jth row of ith file
%                 fields of rows{j}:
%                    rownumber (integer): number of jth row with matchin
%                            text in ith file
%                        findings (cell array) findings in this row
%                              string: string of found text
%                              col
%                              
%                       false if searchstring or infilename were not found
%  - pathfilename (string): actual path and file name with extension of searched m-file
%                           or empty if file was not found
% 
% Examples:
% >> [r_res]=mes_searchTextInMFile('sl_customization','MES')
% See also which, mfilename
%
% ***********************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:27CEST $
% Version:    $Rev: 5604 $
% ***************************************************************

function cr_foundfiles = mes_searchTextInMFile(infilename,searchstring,b_casesensitive,b_includeshadowedfiles,stopstring,mincount,maxcount,b_truncate_comments)











































































































































































































