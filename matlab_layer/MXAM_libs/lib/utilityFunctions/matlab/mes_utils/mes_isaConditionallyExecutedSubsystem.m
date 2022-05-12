%function res=mes_isaConditionallyExecutedSubsystem(sys,lum,fl)
% tests if <sys> is a conditionally executed subsystem
% input arguments:
%  - sys: pathname or handle of subsystem
%  - lum: find_system LookUndermask option (string) default: 'on'
%         see find_system help for details
%  - fl:  find_system FollowLinks option (string)  default: 'all'
%         see find_system help for details
% return value:
%  - res: true if sys is a ConditionallyExecuted Subsystem
%       false, if not
% The following subsystems are considered as being conditionally executed:
% - Enabled subsystems
% - Triggered subsystems
% - Enabled and Triggered Subystems
% - If Action subsystems
% - Switch Case Action subsystems
% - For Iterator subsystems
% - While Iterator subsystems
% 
% ***********************************************************
% Copyright: Model Engineering Solutions
% Revision:  $Rev: 633 $
% Date:      $Date: 2020/07/31 16:10:21CEST $
% ***********************************************************

function res=mes_isaConditionallyExecutedSubsystem(sys,lum,fl)




























































