% Returns string with compact information of error stack.
% 
% SYNTAX:
% =======
% message = mes_shortErrorLocationString(r_lasterr,b_appenderrormessage)
% message = mes_shortErrorLocationString(exception,b_appenderrormessage)
% message = mes_shortErrorLocationString(errorstring,linenumber)
% 
% DESCRIPTION:
% ============
% Returns string with compact information of error stack with filenames and
% line numbers.
%
% INPUT ARGUMENTS:
% ===============
% - r_lasterr:             Structure with last error, 
%                          returned by lasterror
%
% - exception:             returned by calling try .. catch exception ...
%                          class: MException
%
% - b_appenderrormessage:  boolean (default = false)
%                          If true, the error message in error is appended to  
%                          the returned message string
%                          note: only used, if first argument is an
%                          lasterror struct or an MException
%
% - errorstring:           string with error message, 
%                          e.g. returned by lasterr
%
% - lineNumber: (int) line number, default: empty
%                     note: only used if first argument is an errorstring
%
% RETURN VALUES:
% ==============
% - message:    string 
%               Format: "file_1(line_1,rev_1,date_1)>file_2(line_2,rev_2,
%                       date2)> ... filen_n(line_n,revn,daten):", where
%                       file_1 is the name of the toplevel calling m-file
%                              (without path and extension), 
%                       line_1 is the line number where the error occured
%                              or the subfunction was called
%                       rev_1: SVN revision number (if available)
%                       date_1: SVN revision date (if available)
% 
%                       file_n:  the level n file where the error occured.
%                                ...
%
% EXAMPLE(S):
% ===========
% 1)
% message = mes_shortErrorLocationString(lasterror);
% > message = 'mes_mycheck_0001(140)>check_param(262,99,12-08-31):file not found.'
%
% comment: error 'file not found' occured in check_param, line 262, rev 99 of 12/08/31
%                 
% which was called by mes_mycheck_0001 in line 140
%
% 2)
% message = mes_shortErrorLocationString('My error message',100);
% > message = 'callingfunc(55)>calledfunc(100): My error message.'
% 
% comment: 'my error message' refers to an error in line 100 of function 'calledfunc,
%           which was called by 'callingfunc' in line 55
%
%        
% *************************************************************************
% Copyright:    Model Engineering Solutions
% *************************************************************************
%
% See also: lasterror, lasterr, catch

function message = mes_shortErrorLocationString(error,arg2)























































































