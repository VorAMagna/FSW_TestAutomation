%% Extended find_system() for input argument cell array of strings
%
% mes_find_system(s_modelname,cs_parameters)
% 
% returns object in 's_modelname' that are specified by key value pairs in
% cs_parameters. 
%
% INPUT:
% ======
% s_modelname, string, modelname for find_system
% cs_parameters, cell array of strings, row-vector
%               entries are key value pairs, that specifies an simulink
%               object that could be identified by find_system
%
% OUTPUT:
% =======
% objects, cell array of strings or list of handles (depends on entries of 
%             cs_parameters)
%          objects that have been identifies by find_system
%
% NOTE:
% =====
% - cs_parameters must have an even number of entries. 
% 
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:06CEST $
% Revision:     $Rev: 5570 $
% *************************************************************************

function Objects = mes_find_system(s_modelname,cs_parameters)

















































