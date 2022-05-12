% Splits the function parameter into parts delimited by comma
%
% SYNTAX
% =======
% DESCRIPTION:
% ============
% This function splits the parameter string of a function into parts delimited by
% comma. For parameter that is again a function call, does not splits its
% parameters agagin.
% 
% INPUT PARAMETERS:
% =================
% sp -- string, parameter of a function
%
% RETURN VALUES:
% ==============
% cs -- cell array of string, contains all seperated parameters
%
% EXAMPLES:
% =========
% cs=mes_splitFunctionParameter('a(b,c),d');
% --> cs{1}='a(b,c)',cs{2}=d

function cs=mes_splitFunctionParameter(sp)



















































































































