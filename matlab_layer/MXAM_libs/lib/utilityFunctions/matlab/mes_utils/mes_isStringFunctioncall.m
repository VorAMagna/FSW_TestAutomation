%function b_ok=mes_isStringFunctioncall(s)
% test if the given string is a function call, e.g it is in format as
% abc1_2(....)
% 
% INPUT ARGUMENT:
% s: string
%
% RETURN VALUES:
% b_ok     -- true if the string is a function call.
% fun_name -- function name if string is a function call
% param    -- parameter string, e.g. content between '(' and ')'
%
% EXAMPLES:
% >> b_ok=mes_isStringFunctioncall('a+b-c')
% b_ok=false
% >> [b_ok,fun_name,param]=mes_isStringFunctioncall('abc1_2(aaa+2)')
% b_ok=true
% fun_name=abc1_2, param=aaa+1
% >> b_ok=mes_isStringFunctioncall('abc1_2(aaa+2')
% b_ok=false
%
% *************************************************************
% Copyright: Model Engineering Solutions GmbH
% Revision:  $Rev: 3136 $
% Date:      $Date: 2020/07/31 16:10:19CEST $
% **************************************************************

function [b_ok,fun_name,param]=mes_isStringFunctioncall(s)













































