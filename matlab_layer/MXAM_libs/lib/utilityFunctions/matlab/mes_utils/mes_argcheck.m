% s_err=mes_argcheck(arg,s_argname,s_argtype,arg_min,arg_max,b_raiseerr)
% cs_validargtypes=mes_argcheck()
%
% DESCRIPTION:
% ============
% Checks type and range of argument 'arg'.
%
% INPUT PARAMETERS:
% =================
% - arg:        value of argument to be checked (types: see below)
% - s_argname:  name of argument to be checked (string)
% - s_argtype:  string with required type of 'arg', 
%               currently supported types:
%               'bool': logical or in (0,1)
%               'char': any character
%               'int':  type must be numeric and value must be an integer
%                       logicals are not accepted
%               'float' type must be single or double
%               'double': double
%               'numeric' any numeric type, logicals are not accepted
%               'cell':
%               'cs':   cell array of strings
%               'struct': struct  
% - arg_min:    minimal allowed value of argument (optional), leave empty if you
%               don't want to check the minimum. Only checked for numeric types.
% - arg_max:    maximal allowed value of argument (optional, leave empty if you
%               don't want to check the maximum. Only checked for numeric types.
% - b_raiseerr: (optional, default=true) if true, an error is raised in case
%                of an invalid type or value of 'arg'
%                if false, the error message is returned
%
% RETURN VALUES:
% ==============
% - s_err: string with error message or empty, if 'arg' is ok
% - cs_argtypes: cell array of strings with supported argument types
%                (returned if called without arguments)
%
% EXAMPLE:
% ========
% 
%   >> x=int8(1);
%   >> s_err=mes_argcheck(x,'x','float',[],[],false) % wrong type
%   s_err =
%
%   Argument 'x' must be of a float type.
%   >> s_err=mes_argcheck(x,'x','numeric',2,3,false) % wrong range
%   s_err =
%
%   Argument 'x' (=1) must not be smaller than 2.
%
%
% Note: if arg is empty, no type check is done
%
% ***********************************************************
% Copyright: Model Engineering Solutions
% Date:      $Date: 2020/07/31 16:10:02CEST $
% Revision:  $Rev: 5615 $
% ***********************************************************

function s_err=mes_argcheck(arg,s_argname,s_argtype,arg_min,arg_max,b_raiseerr)


























































































































































































