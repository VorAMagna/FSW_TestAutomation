% MES check: ds_0064 - Use of MATLAB Functionality
%
% function [result,cr_items,r_stats] = mes_ds_0064(system, cmd_s)
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
% ds_0064 - Use of MATLAB Functionality
%
% The MATLAB functionality
% 
%     * MATLAB functions
%     * MATLAB actions
%     * time t for the absolute simulation time
% 
% must not be used within Stateflow.
% 
% Remark: The MATLAB functionality listed above is not supported by
% TargetLink for reasons of code efficiency. 
%
% PASS CRITERIA:
% ================
% Within Stateflow neither Matlab functions or actions are used nor is the 
% global simulation time t accessed. Also, no variable named ‘t’ is defined 
% locally.
% 
%
% FAIL CRITERIA:
% ================
% Each chart, be it a flowchart or a state machine, which uses 
% embedded MATLAB within the action part of a transitions' label 
% receives a fail.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:21CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0064(system, cmd_s) %#ok<INUSD>






















































































































