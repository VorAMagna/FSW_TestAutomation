% Pretty Print formated of variable
%
% This function takes the given variable and produces a string
% containing the contents of the variable in a pretty printed
% format.
% The function checks the variable, if it contains characters.
% When characters are in the variable/matrix, each row is printed
% as one string without looking at 'FormatIn'. 'Between' is used as
% divider.
% Otherwise (VarData contains only numbers), each element is printed
% using 'FormatIn'. 'Between' is used to divide the elements of one
% row. Between rows a number of spaces is included to visually
% divide the rows.
% If the variable contains structures or cell arrays, this function
% is called recursively for every element, even structure arrays.
% An internal function prstruct handles the special case of structures
% appropriately. The field names are printed as well, every element on
% a single line.
% All this produces a good looking string of the elements in 'VarData'
% without worrying to much about the format of the elements.
%
% Syntax:  [PrString, ErrMsg] = prprintf(FormatIn, Between, VarData)
%
% Input parameter:
%    FormatIn  - (optional) String containing formatstring, uses same 
%                syntax as sprintf
%                   if omitted, '%g' is used
%    Between   - (optional) String containing characters to put
%                between elements in VarData 
%                   if omitted, '   ' is used
%                   if a cell array, first element between elements on the same row,
%                                    second element between different rows and
%                                    third element between cell elements
%    VarData   - Variable(s) to pretty print, may be a scalar,
%                a character, a string, a matrix, a cell array or 
%                a structure with all of this, even mixed up
%
%    If only 2 input parameters are provided, the first input is
%    FormatIn and the second input VarData, Between is set to an empty
%    string.
%
%    If only 1 input parameters is provided, the first input is
%    VarData, FormatIn and  Between are set to default values.
% 
% Output parameter:
%    PrString  - String containing the elements in VarData pretty
%                printed
%    ErrMsg    - String containing possible error message, then PrString
%                is an empty string
%                ErrMsg is an empty matrix, when no error occured
%
% Examples:
% >>prprintf('%g', '/', [1.02 4.07 3.0532])
%     1.02/4.07/3.0532
%
% >>prprintf('%.3g ', '',[1.02 4.07; 3.0532 5.875; 3.324 4.123])
%     1.02 4.07   3.05 5.88   3.32 4.12
%
% >>prprintf('%s', ' ', ['eins';'zwei';'drei';'vier'])
%     eins zwei drei vier
%
% Try prprintf with cell arrays and structures as well!
%
% See also: sprintf

function [PrString, ErrMsg] = prprintf(FormatIn, Between, VarData)













































































































































