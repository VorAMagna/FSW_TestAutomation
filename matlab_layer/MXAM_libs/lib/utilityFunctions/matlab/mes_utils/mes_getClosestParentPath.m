% function index=mes_getClosestParentPath(childPath,cs_parentPaths)
% Find the path that is closest to the child path, return it's index in
% cs_parentPaths
% input arguments:
% childPath: string, path to be compared
% cs_parentPaths: cell array of string, which is part of child path
% b_returnAbsDist(option):default is false, if true, use absolute distance
% to decide the closet path.
% returned variable
% index: index of cs_parentPaths, means that cs_parentPaths{index} is the
% closest to childPath
% Example: >> mes_getClosestParentPath('c:\abc\efg\hig',{'c:\abc','c:\abc\ddd','c:\abc\efg'})
%          ans = 3
% *******************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:09CEST $
% Version:      $Rev: 108 $
% Author:       Yonge.Yu@model-engineers.com
% *******************************************

function index=mes_getClosestParentPath(childPath,cs_parentPaths,varargin)


































