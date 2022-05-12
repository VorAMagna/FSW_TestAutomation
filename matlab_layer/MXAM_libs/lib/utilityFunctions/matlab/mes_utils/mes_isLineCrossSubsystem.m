% Test if a line crosses any obj of a subsystem
%
% SYNTAX:
% =======
%   result=mes_isLineCrossSubsystem(line,h_subsystem)
%
% DESCRIPTION:
% ============
% Test if one line of a subsystems crosses with other lines or blocks, or
% one vitual line crosses with the lines and blocks of the given subsystem.
% 
% INPUT ARGUMENTS:
% ================
% - line     an array of n*2 elements, every row is a point (x,y), or handle of
%            a line that belongs to given subsystem
% - hsubsys  handle of a subsystem
%
% RETURN VALUES:
% ==============
% result:    boolean
%            true  -- if the line crosses any obj of the subsystem
%            false -- no crossing
% EXAMPLE(S):
% ===========
% result=mes_isLineCrossSubsystem(h_line,h_subsystem);
% result=mes_isLineCrossSubsystem([100 200;200 200] ,h_subsystem);
%
% *************************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:18CEST $
% Revision:   $Rev: 1616 $
% *************************************************************************

function [result,errmsg]=mes_isLineCrossSubsystem(line,hsubsys) %#ok<INUSD,INUSL>




























































































































































































































































































