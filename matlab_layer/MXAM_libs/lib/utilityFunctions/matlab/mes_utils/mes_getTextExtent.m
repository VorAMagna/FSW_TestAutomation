% returns extent of the string s in Pixels
%
% Syntax:
%  [width,height] = mes_getTextExtent(s,font,b_reusefigure)
%  [width,height] = mes_getTextExtent(s,fontsize,b_reusefigure)
%  mes_getTextExtent()  % to clear temporary figure
%
% Input Arguments:
%  s: string
%  fontsize (integer) = fontsize in Points, all other font props are set to
%  default as shown below
%  font: structure with font properties:
%    fields:            
%    font.FontName  :   string with font name, default: 'Helvetica'
%    font.FontAngle :  ('normal') | 'italic' | 'oblique' 
%    font.FontSize  :  Size of Font FontUnits, default: 10
%    font.FontUnits :   'points' | 'centimeters', | 'inches' | 'pixels'
%    font.FontWeight :   'normal' | 'demi' | 'bold'
%  b_reusefigure: (optional, default=false)
%    if false (default), the temporary figure needed to compute the text extent
%           is cleared after the call 
%     if true, the figure is not cleared and remains visible until
%           a subsequent call of this function with the flag set to true
%     note: by reusing the figure the function is about 100 times faster.
%           To improve performance of this function in a loop, set the flag
%           to true except for the final call, e.g. 
%               mes_getTextExtent(s,font,i<imax)
%
% Return values:
% width = with of text s in pixels
% height = height of text s in pixels
%
% Examples:
%  >> mes_getTextExtent('abc',12)
% ans =
%
%     30
% >> [w,h]=mes_getTextExtent('abc',struct('FontName','Arial','FontWeight','bold'))
% w =
% 
%     23
% 
% 
% h =
% 
%     17
%
% ***********************************************************
% Copyright: Model Engineering Solutions, 2008
% Author:    Jörg Sangals   (joerg.sangals@model-engineers.com)
% Date:      $Date: 2020/07/31 16:10:13CEST $
% Version:   $Rev: 633 $
% ***********************************************************

function [width,height] = mes_getTextExtent(s,f,b_reusefigure)






















































































































