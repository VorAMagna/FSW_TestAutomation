% Stateflow Options
% % [result,cr_items,r_stats] = mes_mes_slsf_9003(system, cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistic s on the check result
% for details use 'open mes_check_info'
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>, 
% for details use 'open mes_check_info'
%
% REFERENCED GUIDELINE:
% =====================
% Reference:
% MES slsf_9003
%
% DESCRIPTION:
% ============
% The options in all Stateflow charts should be set consistently.
%
% PASS/FAIL CRITERIA:
% ===================
% If the options of the Stateflow charts are set according to the
% parameters, the check will give a pass.
%
% SOLUTION:
% =========
% Set all options according to the default values.
%
% FIX OPERATION:
% ==============
% Fix repairs the options by setting the option to the default values
%
% CHECK PARAMETERS:
% =================
% MES.mes_slsf_9003.StateMachineType
% DATATYPE: 
%       string
% DEFAULT VALUE:
%       'Classic'
% DESCRIPTION
%       The property 'State Machine Type' for a Statflow chart is defined in this parameter. 
% =================
% MES.mes_slsf_9003.UpdateMethod
% DATATYPE: 
%       string
% DEFAULT VALUE:
%       'INHERITED'
% DESCRIPTION
%       The property 'Update method' for a Statflow chart is defined in this parameter. 
% =================
% MES.mes_slsf_9003.SampleTime
% DATATYPE: 
%       string
% DEFAULT VALUE:
%       'ignore'
% DESCRIPTION
%       The property 'Sample Time' for a Statflow chart is defined in this parameter.
% =================
% MES.mes_slsf_9003.EnableCBitOperations
% DATATYPE: 
%       string
% DEFAULT VALUE:
%       1
% DESCRIPTION
%       The property 'Enable C-bit operations' for a Statflow chart is defined in this parameter.
% =================
% MES.mes_slsf_9003.StateTransitionOrder
% DATATYPE: 
%       string
% DEFAULT VALUE:
%       1
% DESCRIPTION
%       The property 'User specified state/transition executon order' for a Statflow chart is defined in this parameter.
% =================
% MES.mes_slsf_9003.ExpChartLevelGraphFunc
% DATATYPE: 
%       string
% DEFAULT VALUE:
%       0
% DESCRIPTION
%       The property 'Export Chart Level Graphical Functions (Make Global)' for a Statflow chart is defined in this parameter.
% =================
% MES.mes_slsf_9003.ExecuteChartAtInit
% DATATYPE: 
%       string
% DEFAULT VALUE:
%       0
% DESCRIPTION
%       The property 'Execute (enter) Chart At Initialization' for a Statflow chart is defined in this parameter.
% =================
% MES.mes_slsf_9003.InitializeOutput
% DATATYPE: 
%       string
% DEFAULT VALUE:
%       0
% DESCRIPTION
%       The property 'Initialize Outputs Every Time Chart Wakes Up' for a Statflow chart is defined in this parameter.
% =================
% MES.mes_slsf_9003.EnableSuperStepSem
% DATATYPE: 
%       string
% DEFAULT VALUE:
%       0
% DESCRIPTION
%       The property 'Enable Super Step Semantics' for a Statflow chart is defined in this parameter.
% =================
% MES.mes_slsf_9003.MaxIt
% DATATYPE: 
%       string
% DEFAULT VALUE:
%       1000
% DESCRIPTION
%       The property 'Maximum Iterations in each Super Step' for a Statflow chart is defined in this parameter.
% =================
% MES.mes_slsf_9003.BehaviourAfterMaxIt
% DATATYPE: 
%       string
% DEFAULT VALUE:
%       'Proceed'
% DESCRIPTION
%       The property 'Behaviour after too many Iterations' for a Statflow chart is defined in this parameter.
% =================
% MES.mes_slsf_9003.SuppVariableSizeArrays
% DATATYPE: 
%       string
% DEFAULT VALUE:
%       0
% DESCRIPTION
%       The property 'Support variable-size arrays' for a Statflow chart is defined in this parameter.
% =================
% MES.mes_slsf_9003.SaturateOnIntegerOverflow
% DATATYPE: 
%       string
% DEFAULT VALUE:
%       0
% DESCRIPTION
%       The property 'Saturate on integer overflow' for a Statflow chart is defined in this parameter.
% =================
% MES.mes_slsf_9003.DebuggPointOnEntry
% DATATYPE: 
%       string
% DEFAULT VALUE:
%       0
% DESCRIPTION
%       The property 'Debugger breakpoint: On chart entry' for a Statflow chart is defined in this parameter.
% =================
% MES.mes_slsf_9003.Locked 
% DATATYPE: 
%       string
% DEFAULT VALUE:
%       0
% DESCRIPTION
%       The property 'Lock Editor' for a Statflow chart is defined in this parameter.      
%
% PUBLIC INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions GmbH
% Date:         $Date: 2020/07/31 16:03:55CEST $
% Revision:     $Rev: 15236 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_mes_slsf_9003(system, cmd_s)




























































