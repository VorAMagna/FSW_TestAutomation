%Check if the given subsystem is a reuseable subsystem
% in case only one parameter is given:
% If the linkstatus of a subsystem is not 'none', or it is a configurable
% subsystem, then it is regarded as a reuseable subsystem.
%
% In case two parameters are given and the second parameter is a cell array with
% string element (the element of this paramter is then reusable libraries):
% If the linkstatus of a subsystem is not 'none', or it is a configurable
% subsystem, and the subsystem is linked to a library listed in the second
% parameter, then it is regarded as a reuseable subsystem.
%
% This criteria can be changed. For example, a subsystem with some special
% attribute, such as in some speical string in attribute format string
% peop, or with special subsystem.
%
%Syntax:re=mes_isReuseableSubsystem(lh_block[,reusable_libs])
%
%Parameters:
%lh_block--the handle of the block that will be tested
%(option)reusable_libs-- list of reusable libraries
%result--  if block is a reuseable subsystem, return 1, otherwise, 0
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:19CEST $
% Version:      $Rev: 6888 $
% ***********************************************************

function result=mes_isReuseableSubsystem(lh_block,varargin)














































































