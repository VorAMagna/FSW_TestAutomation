%% Simulink Block, Subsystem and Library Shape and Size - Resize Restrictions
%
% [result,cr_items,r_stats] = misra_slsf_025_b(system, cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistic s on the check result
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>
%
% REFERENCED GUIDELINE:
% =====================
% MISRA AC SLSF - Modeling design and style guidelines for the application
% of Simulink and Stateflow
% Version 1.0 
% The Motor Industry Software Reliability Association
% Guideline Rule ID: MISRA AC SLSF 025 (3.4.7)
%
% DESCRIPTION:
% ============
% Blocks that contain calibration parameters or named constants must not be resized to make the name visible. 
% 
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes each block containing calibration parameters and each Constant block in the model.
% 
%     Failed 1: The block size is bigger than the default size of the library block.
% 
% The check result is passed if all failed cases do not apply.
% 
% SOLUTION:
% =========
% Do not resize blocks containing calibration parameters and constant blocks.
%
% FIX ACTION:
% ===========
% No automatic repair action available.
%
% Note: following blocks will be checked:
% Constant 
% Merge 
% FromFile
% FromWorkspace
% ToWorkspace
% DataStoreMemory
% DataStoreRead
% DataStoreWrite
% GotoTagVisibility
% Goto
% From
% Logic(AND,NAND,OR,NOR,XOR)
% DataTypeConversion (single,int8,boolean,.....)
% Trigonometry (sin,cos,tan,acos,...)
% S-Function
% TL_Constant
% TL_Merge
% TL_DataStoreRead
% TL_DataStoreMemory
% TL_DataStoreWrite
% TL_LogicalOperator
% TL_Trigonometry
%
% CHECK PARAMETERS:
% =================
% No check parameters are used.  
% 
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:16CEST $
% Revision:     $Rev: 6179 $
% *************************************************************************

function [result,cr_items,r_stats]= mes_misra_slsf_025_b(system,cmd_s,reg, s_regerr)


















































