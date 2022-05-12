% Returns cleaned name(s) of block(s) or subsystem(s) w/o path. 
%
% SYNTAX:
% =======
% s_name = mes_cleanName(block,r_format)
% 
% DESCRIPTION:
% ============
% Returns cleaned name(s) of block(s) or subsystem(s) w/o path. 
% NOTE: difference to mes_cleanpathname: only the block name is formatted
% (no recurrence to parent needed as in mes_cleanpathname)
%
% INPUT ARGUMENTS:
% ================
% - block:  string | double
%           Pathname or handle of block or subsystem
% - format: struct | string
%           Structure or string with format options
%           format as structure:
%           --------------------
%           - format.b_linefeed2space (default=true)
%             replaces all linefeeds (char(10)) by spaces
%             needed for disp()
%           - format.b_doublequote (default=false)
%             duplicates all quotes
%             needed for building an eval string, e.g by hilite_system 
%             e.g.:
%             s1='do''nt'; % string with single quote
%             es=sprintf('disp(''%s'')',s1); % eval string with s1
%             eval(es); % this does not work! 
%           - format.b_doublenameslash (default=true)
%             duplicates slashes found in the block name, but not in the path
%             to distinguish it from a path separator
%             needed for hilite_system()
%           format as string:
%           -----------------
%           - use format string to quickly change defaults, e.g.
%             mes_cleanName(block,'/linefeed2space:false')
%           - options in string may be combined, e.g.
%             mes_cleanName(block,'/doublenameslash:false /doublequote:true')
%
% RETURN VALUES:
% ==============
% - s_name: string
%           Block name cleaned by given format
%
% EXAMPLE:
% ========
% mes_cleanName(block,'/linefeed2space:true')
%
% *************************************************************************
% Copyright: Model Engineering Solutions
% Date:      $Date: 2020/07/31 16:10:03CEST $
% Revision:  $Rev: 5684 $
% *************************************************************************
%
% See also: mes_cleanpathname

function s_name = mes_cleanName(block,r_format)

































































































































































