% s_blockpath = mes_getBlockPath(s_path)
%
% get the block path from the give path. 
%
% description:
% The given path may be the variable path such as model/Chart/Fun_name/var,
% or model/Chart/Fun_name/var.var1,the block path is then model/Chart. 
%
% Input arguments
%  s_path--path of a variable of data
% Return values
%  s_blockpath-- path of the block that the variable belongs to
%
%***************************************************************
%Copyright: Model Engineering Solutions
%Revision:  $Rev: 14855 $
%Date:      $Date: 2020/07/31 16:10:09CEST $
%***************************************************************

function  [s_blockpath,b_found] = mes_getBlockPath( s_path )








































