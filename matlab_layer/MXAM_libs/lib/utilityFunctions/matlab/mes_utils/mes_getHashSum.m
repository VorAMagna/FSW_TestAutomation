% function s_err=s_hash=mes_getHashSum(file)
%
% DESCRIPTION:
% ============
% gets md5 hash sum of given file as string
%
% FUNCTION ARGUMENT:
% ==================
% file: (string) Either the name of a known
%       MatLab function or script
%       or a full filepathname with extension
%
% RETURN VALUE:
% =============
%
% s_hash: (sring) hash sum or empty if file
%        can't be found
%
%
% EXAMPLES:
% ========
%
%   >> mes_getHashSum('mes_check')
%   ans = 
%
%    'F18C7511410079C0D23747F81055DF65'
% 
%   >> mes_getHashSum('c:\autoexec.bat')
% 
%   ans = 
%
%     'D41D8CD98F00B204E9800998ECF8427E'
%
%   >> mes_getHashSum('fantasy')
%   ans = 
%        ''
%
% ***********************************************************
% Copyright: Model Engineering Solutions
% Date:      $Date: 2020/07/31 16:10:11CEST $
% Revision:  $Rev:$
% ***********************************************************

function s_hash=mes_getHashSum(file)





































































