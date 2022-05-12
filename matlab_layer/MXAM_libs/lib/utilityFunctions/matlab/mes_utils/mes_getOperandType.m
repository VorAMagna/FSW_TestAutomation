% DESCRIPTION:
% ============
% returns type and class of a simulink/stateflow expression
%
% SYNTAX:
% =======
% [s_type,s_termClass] = mes_getOperandType(s_expr,h_chart)
%
% INPUT ARGUMENT:
% ===============
% s_expr: 
% string with a Simulink/Stateflow expression
% h_chart (optional): 
% a chart handle so that enum types are collected from the corresponding 
% SF data in order to distinguish identifiers from enum elements; the
% latter are of type 'constant' 
% note: in Stateflow charts it is possible to use
% enumerations elements without specifying the enum type
%
% RETURN VARIABLES:
% =================
% s_type: either 'identifier','expression','constant','function' or 'unknown'
% s_termClass: classification of expression, e.g.
%              'logical and','logical or', 'relational','function call'
%               cf. mes_getTerms
%
% EXAMPLES:
% =========
%
% Constants:
% -123
% +1.3e-012
% i
% pi
% mySimulinkEnum.Element (enumeration data type + element)
% Element (here, Element is an element of an enumeration used as SF data item of h_chart)
% [1 2 3] 
% [ +2.081618890e-019, -1.441693666e-014]
% [1 2; 3 4] (arrays of arbitrary dimension without signed entries)
% true
% false
% exp(1)
% cos(1)
%
% Expressions:
% 1e-01-2
% 5-6
% i++
% 2^5
% -2+1
% 1e-01-2
% 2/3
% 2*a
% param[2]+4
% 3a - 2*c
% max(a,b)+5
% max(a,b)+var
%
% Identifiers:
% ab
% variable
% param[2]
% a(j)(2)
% Inherited: Inherited from Simulink
% memory
%
% Functions:
% max(a,b+1)
% sin(var2)
%
% Unknown: 
% 2a
% 9EF580B209F
% [1 variable 2]
% [1 2; -3 4] (note the sign, cf. above)

function [s_type,s_termClass] = mes_getOperandType(s_expr,h_chart)



































































































































































































