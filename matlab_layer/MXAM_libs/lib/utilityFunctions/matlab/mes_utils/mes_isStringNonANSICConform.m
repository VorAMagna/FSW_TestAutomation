% function b_isStringNonANSICConform = mes_isStringNonANSICConform(s_Name,b_ignoreWhiteSpaces)
%
% DESCRIPTION:
%======
% This function tests if the input string contains ANSI C non-conforming 
% characters which correspond to the characters 33 to 127 of the Unicode table.
% 
% INPUT:
%======
% s_name:               Name of the element to be tested.
% b_ignoreWhiteSpaces:  If true, white spaces in s_name are ignored.    
%
% OUTPUT:
%=======
% b_isStringANSICConform: If string is not ANSI C conforming 1,
% otherwise 0.
%
%***************************************************************
% Copyright:  Model Engineering Solutions
%***************************************************************

function b_isStringNonANSICConform = mes_isStringNonANSICConform(s_name,b_ignoreWhiteSpaces)







































