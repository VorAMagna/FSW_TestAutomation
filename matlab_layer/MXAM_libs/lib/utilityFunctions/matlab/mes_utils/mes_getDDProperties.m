%% Get content of specified parts of data dictionary
%
% [cs_AllProps,cs_AllNames,cs_AllPaths] = mes_getDDProperties(cs_kind,cs_path,s_prop)
%
% returns for each object specified by cs_kind in cs_path property s_prop. 
%
% INPUT: 
% ======
% cs_kind, type: cell array of strings, column vector
%          Each row specifies a DD objectKind.
%          
% 
% cs_path, type: cell array of strings, column vector
%          Each row specifies the path, within the corresponding DD
%          objectKind is considered. 
% 
% s_prop, type: string, optional input
%         If s_prop is given, this property of all specified DD objectKind
%         is returned.
%         If s_prop is not used, names of all specified DD objectKinds are
%         returned. 
% 
% OUTPUT:
% =======
% cs_AllProps, type: cell array of strings, column vector
%        Each row is a value of property s_prop of a specified DD objectKind.         
% 
% cs_AllNames, type: cell array of strings, column vector
%       Each row is the name of one specified DD objectKind. Rows
%       corresponds to rows in cs_AllProps, i.e. DD object with name
%       cs_AllNames{j} has property value cs_AllProps{j}.
% 
% cs_AllPaths, type: cell array of strings, column vector
%       Each row is the path of one specified DD objectKind. Rows
%       corresponds to rows in cs_AllProps, i.e. DD object with path
%       cs_AllPaths{j} has property value cs_AllProps{j}.
%           
% EXAMPLE: 
% ========
% cs_kind = {'Variable'; 'Typedef'};
% cs_path = {'/Pool/Variables'; '/Pool/Typedefs'};
% s_prop = 'GeDescription';
% 
% [cs_AllProps,cs_AllNames,cs_AllPaths] = mes_getDDProperties(cs_kind,cs_path,s_prop)
% 
% will return desctiptions of all variable objects in /Pool/Variables and
% of all typedef objects in /Pool/Typedefs
% 
% NOTE:
% =====
% - If s_prop = 'GetChildrenNames', cs_AllProps and cs_AllNames are equal to
%   each other.
% - If no TargetLink Version is installed, cs_AllProps, cs_AllNames and
%   cs_AllPaths will be returned as empty cell arrays. 
% 
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:10CEST $
% Revision:     $Rev: 6372 $
% *************************************************************************

function [cs_AllProps,cs_AllNames,cs_AllPaths] = mes_getDDProperties(cs_kind,cs_path,s_prop)











































































































