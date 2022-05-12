% MES check: misra_slsf_005_c -  Allowable Simulink Blocks - Data Store Memory
%
% INPUT PARAMETERS:
% =================
%   system:  model/subsystem to be checked
%   cmd_s:   check options, syntax /<key>:<val>, for details See also
%   r_stats: struct with statistic s on the check result
%  
% GUIDELINE:
% ==========
% Reference:
%   MISRA AC SLSF Modelling design and style guidelines for the 
%   application of simulink and stateflow, MIRA limited, May 2009, 
%   Ver 1.0, www.misra.org.uk
% 
% Guideline Rule ID: 
%   MISRA AC SLSF 005 part C
% 
% MES CHECK: 
% ==========
% MES check: misra_slsf_005_c -  Allowable Simulink Blocks, Part C:
% Restrictions with Regard to the Data Store Memory/Read/Write Blocks.
% Data store memory must not be used to exchange data across subsystem
% boundaries and must only be used where data exchange is transparent, i.e.
% within a local subsystem.
%
% PASS-FAIL CRITERIA:
% ================
% The check analyzes each Data Store Read, Data Store Write and Data Store Memory block in the model:
% Failed 1: The Data Store Read block or Data Store Write block and its corresponding Data Store Memory block are not in the same subsystem. 
% The check result is passed if all failed cases do not apply.
%     
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:00CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_005_c(system, cmd_s)







































