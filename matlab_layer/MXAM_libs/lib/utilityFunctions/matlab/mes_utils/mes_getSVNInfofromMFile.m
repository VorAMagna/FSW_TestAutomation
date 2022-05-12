% cr_res=mes_getSVNInfofromMFile(mfile)
%
% returns SVN tags found in mfile(s)
%
% Input argument:
% ===============
%  - mfile (string): name of file to be searched, optionally including path and extension.
%       If no path is provided, the mfile is searched in the MATLAB path by calling which(infilename)
%       If no extension is provided, the extenstion '.m' is assumed
%       if type is cell of strings, then a cell of structs is returned
%
% return variable:
% ================
% cr_res: cell of structs with string fields
%                 which: filepathname of mfile
%                        date,rev,id: strings with SVN tags
%                        note: these fields only exist if tag was found
% 
% NOTE: only the first occurence of a tag is returned, tags are trimmed
%
% ***********************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:12CEST $
% Version:    $Rev: 3932 $
% ***************************************************************

function cr_res=mes_getSVNInfofromMFile(mfile)

























































































