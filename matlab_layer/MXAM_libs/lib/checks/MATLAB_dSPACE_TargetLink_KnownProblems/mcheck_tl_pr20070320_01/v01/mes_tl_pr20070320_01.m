% MES check: tl_pr20070320_01 - TL Inport or Businport on root level may
% cause downsampling of data.
%
% function [result,cr_items,r_stats] = mes_tl_pr20070320_01(system, cmd_s)
%
% RETURN PARAMETERS:
% ==================
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
%
% INPUT PARAMETERS:
% =================
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>, for details See also mes_jc_0061
%
% MES CHECK:
% ==========
% tl_pr20070320_01 - A TargetLink Inport or BusInport on the top level of
% the TargetLink subsystem may cause an unwanted downsampling of the data
% which passes the TargetLink InPort or BusInport. This error may occur if:
%   a) The TargetLink subsystem does not result in an empty function
% AND
%   b) Behind the TargetLink InPort or BusInport, the signal line branches to a
%      subsystem which is executed by an own root step function.
%
% Fix: none
% Workaround:
% For each Simulink Inport which receives data from outside the TargetLink
% subsystem:
% Specify the Simulink Inport by adding a TargetLink InPort or BusInport.
% Create a "One to One" connection to the border of the TargetLink subsystem.
% [only TargetLink 2.0.x] Add TargetLink InPorts to the newly created Simulink Inports on root level.
% Set variable class to "default". Set datatype and scaling as set at the succeeding TargetLink
% InPort.
% [only TargetLink 2.1.x or TargetLink 2.2] Do not add TargetLink Inports or BusInports to the newly
% created Simulink Inports on root level.
%
% PASS/FAIL CRITERIA:
% ================
% in the following case, the model will get a fail:
%  1. the rtos.enablemultirate of Targetlink main dialog is 'on';
%  and
%  2. the output of a TLinport or TLbusinport on the top level of a Targetlink
%      subsystem is connected with two or more subsystems which belong to
%      different tasks.
%
% Note: Rules of Targelink task partitioning:
% 1. Subsystems with a task block that has the same task name belong to the same task,
% 2. All atomic subsystems and virtual subsystems containing a function block
%     with the same sample time belong to the same task,
% 3. Each function-call subsystem (containing a trigger port with
%     triggertype="function-call"), that is triggered from outside the
%     TargetLink subsystem (called "external function -call triggered subsystem")
%     becomes a separate task.

function [result,cr_items,r_stats] = mes_tl_pr20070320_01(system, cmd_s) %#ok<INUSD>











































































































































































































































































































































