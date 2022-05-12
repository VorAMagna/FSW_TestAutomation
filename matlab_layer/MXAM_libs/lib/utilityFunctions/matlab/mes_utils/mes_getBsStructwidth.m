%% li_width = mes_getBsStructwidth(lr_bus)
%
% DESCRIPTION:
% ============
% This function returns the array of width(s) <li_width> for the bus struct
% (array) <lr_bus>. Since each bus element can be a vector or bus, the
% corresponding dimensions for each element are recursively summed up to 
% determine each entry of li_width. If the source of an element is not 
% found, it is assumed that the element has length 1.
%
% INPUT PARAMETERS:
% =================
% - lr_bus:  struct (array) corresponding to the struct given by the
%            'busstruct' property
%
% RETURN VALUES:
% ==============
% - li_width: length(s) of the bus (array)
%
% PUBLISHING INFORMATION
% ****************************************************************
% Copyright:  Model Engineering Solutions
% ****************************************************************

function li_width = mes_getBsStructwidth(lr_bus)










































