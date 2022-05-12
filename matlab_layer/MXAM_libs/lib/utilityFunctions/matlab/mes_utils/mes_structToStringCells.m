% function [cs_fileContent,s_result] = mes_structToStringCells(param,s_result,cs_fileContent,...
%                                   b_root, i_numElementsForLineBreak, i_numTabsAfterLineBreak)
%
% DESCRIPTION:
% ============
% Goes recursively through a struct and appends a string of each value (as expression) to a
% cell array.
%
% RETURN VALUES: 
% ==============
% - cs_fileContent:   cell array with lines of file content
% - s_result:         string of struct value
% 
% INPUT ARGUMENTS:
% ================
% - param:            struct 
% - s_result:         struct field with value as string
% - cs_fileContent:   cell array with all struct fields
% - b_root:           true if struct root (inital call), false otherwise
% - i_numElementsForLineBreak: number of elements to force a line break
% - i_numTabsAfterLineBreak: number of tabs for indention after line break
%
% ****************************************************************
% Copyright: Model Engineering Solutions
% Version:   $Rev: 4516 $
% Date:      $Date: 2020/07/31 16:10:28CEST $
% ***************************************************************

function [cs_fileContent,s_result] = mes_structToStringCells(param,s_result,cs_fileContent,...
                                    b_root, i_numElementsForLineBreak, i_numTabsAfterLineBreak)























































































































































































