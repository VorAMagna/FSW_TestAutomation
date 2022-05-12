% function [PathFileList, FileList, PathList] = findfiles(SearchFileMask,
% SearchPathMask, SearchRecursiv)
%
% DESCRIPTION:
% ============
% Find Files regarding a search mask 
%
% This function searches for files in the current directory /
% a given directory: The serach can be recursively, depending 
% on the provided parameters.
% The search mask is relatively simple (just '*' as wildcard).
%
% Syntax:  [PathFileList, FileList, PathList] = findfiles(SearchFileMask, SearchPathMask, SearchRecursiv)
%
% INPUT PARAMETERS:
% =================
% - SearchFileMask: String or cell array of strings containing the file mask
%                   to search for {'*.m'; 'ma*'; '*am.mat'}
%                   if omitted or empty '*' is used
%                   if NaN (not a string): search for all directories
% - SearchPathMask: String or cell array of strings containing the path
%                   to search on
%                   Each path may contain as many masks (*) as necessary
%                   and also on lower levels {'v:\ge*\pl*\fritz'}, the extension 
%                   of the * is handled by the function
%                   special strings: '' or '.': current directory
%                   if omitted or empty '.' (current directory) is used
% - SearchRecursiv: Scalar indicating recursiv searching or not
%                   0: do not search recursively
%                   1: search recursively
%                   if omitted or empty 0 (no recursiv search) is used
%
% RETURN VALUES:
% ==============
% - PathFileList: Cell array of string(s) containing the path and name of the found files
% - FileList:     Cell array of string(s) containing the name of the found files
% - PathList:     Cell array of string(s) containing the path of the found files
%
% EXAMPLE:
% ========
%
%   % Search in directories gea*\gr* and in geaobj for files with mask *an*.m and *objfun1*.mat
%   % not recursively
%   
%   >> [pfl, fl, pl] = findfiles({'*am*.m'; '*objfun1*.mat'}, {'gea*\p*', 'geaobj\gr*'});
%      pfl = 
%          'geatbx\plotext\samdata.m'
%          'geatbx\plotext\sammon.m'
%          'geaobj\grafics\res_beasv_objfun1_var_2_01.mat'
%          'geaobj\grafics\res_beasv_objfun1c_var_2_01.mat'
%      fl = 
%          'samdata.m'
%          'sammon.m'
%          'res_beasv_objfun1_var_2_01.mat'
%          'res_beasv_objfun1c_var_2_01.mat'
%      pl = 
%          'geatbx\plotext\'
%          'geatbx\plotext\'
%          'geaobj\grafics\'
%          'geaobj\grafics\'
%
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:00CEST $
% Revision:   $Rev: 633 $
% ****************************************************************

function [PathFileList, FileList, PathList] = findfiles(SearchFileMask, SearchPathMask, SearchRecursiv)













































































































































































































































