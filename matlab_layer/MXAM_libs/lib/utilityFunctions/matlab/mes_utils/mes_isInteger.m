% returns true if the value of n has an integral part <= eps (2.2204d-16),
% irrespective of the underlying type of the variable
%
% Examples:
%
% mes_isInteger(-4/2)
% >> 1
%
% mes_isInteger([1 2 3.04])
% >> 0
% 
% notes:
%   if n is an array, true is returned only, if all elements are integers
%   cell arrays or structs with integers are not recognized (res=false)
%
% ***********************************************************
% Copyright: Model Engineering Solutions
% Revision:  $Rev: 5615 $
% Date:      $Date: 2020/07/31 16:10:18CEST $
% Author:    Jörg Sangals (joerg.sangals@model-engineers.com)
% ***********************************************************

function res=mes_isInteger(n)
























