% concatenates, sorts and reshapes cell arrays of strings
% and removes non-string elements
% SYNTAX:
% =======
% csout=mes_cleanupCellOfStrings(cs1[,cs2..])
%
% DESCRIPTION:
% ============
% - all provided arguments will be reshaped and concatenated into
%   a 1 x n cell of strings (char) and sorted in asccending order.
% - the following elements of the concatenated cell will be removed
%    a) empty elements
%    b) non-character elements
%    c) duplicate strings (case sensitive)
% - if called with a single string argument, it will be wrapped into the returned cell
%
% INPUT ARGUMENTS:
% ================
% - cs1 ..csn :   variable number of cell array of strings
%                 or strings
%
% RETURN VALUE:
% =============
% - cs:   1 x n  cell array of strings
%
% EXAMPLES:
% ========
% >> mes_cleanupCellOfStrings({'a' 'a' 'b' 123})
% ans =
%     'a'    'b'
%
% >> mes_cleanupCellOfStrings('a')
% ans =
%     'a'     (a cell)
%
% >> mes_cleanupCellOfStrings({'a';'b'})
% ans =
%     'a'    'b'
%
% >> mes_cleanupCellOfStrings('a',{'b','a','c'})
% ans =
%     'a'    'b'    'c'
%
% >> mes_cleanupCellOfStrings({'a';'b'},{'a','c'})
% ans =
%     'a'    'b'    'c'
%
% *************************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:03CEST $
% Version:    $Rev: 5886 $
% *************************************************************************
%

function cs=mes_cleanupCellOfStrings(varargin)


































































































