% MES_REPLACECHAR checks if s_name contains unwanted chars
%
% Test if s_name contains unwanted chars given by regular expresion
% s_regExp and cut them out or replace them by underscore if b_replace =
% true.
% If b_replace is true and unwanted chart exist, then replace it with _, if
% b_replace is false, then drop this char.
% SYNTAX [s_text] = mes_replaceChar(s_name,s_regExp,b_replace)
%
%   INPUT ARGUMENTS
%   s_name     string to check
%   s_regExp   regular expression which is applied on s_name
%   b_replace  if true, replaces unwanted char by underscore, otherwise
%              char will be dropped (default)
%   n_pos      position in string to be checked (optional)
%
%   OUTPUT ARGUMENTS
%   s_text     clean string
%
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:26CEST $
% Version:      $Rev: 3136 $
% ***********************************************************

function [s_text] = mes_replaceChar(s_name,s_regExp,b_replace,n_pos)













































