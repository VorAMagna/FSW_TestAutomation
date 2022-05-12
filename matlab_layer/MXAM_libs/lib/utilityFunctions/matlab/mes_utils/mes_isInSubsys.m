% function ok=mes_isInSubsys(hSubsHost,hBlock)
% Tests if the block or subsystem hBlock resides inside the subsystem hSubsHost
% input arguments:
% subshost: handle or namestring of the subsystem tested to host 'block'
% block: handle or namestring of block or subsystem tested for being within subsys
% returned variable
%  ok: (boolean) true, if block is hosted by subshost or false otherwise
% Example: >> mes_isInSubsys(get_param(gcb,'Parent'),gcb)
%          ans = 
%               1
% *******************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:18CEST $
% Version:      $Rev: 5977 $
% Author:       Yonge.Yu@model-engineers.com
% *******************************************

function ret=mes_isInSubsys(subshost,block)























