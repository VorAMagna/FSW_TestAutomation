%% Simulink blocks: Sufficient size for Parameter Names
%
% [result,cr_items,r_stats] = jm_0002_a(system, cmd_s)
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
% Control Algorithm Modeling Using Matlab,Simulink, and Stateflow
% Version 3.0
% MathWorks Automotive Advisory Board (MAAB)
% Guideline Rule ID: jm_0002 (4.2.5.)
%
% DESCRIPTION:
% ============
% All blocks in a model must be sized such that their icon is completely 
% visible and recognizable. In particular, any text displayed (e.g. tunable 
% parameters, filenames, equations) in the icon must be readable.
% 
% This guideline requires resizing of blocks with variable icons or blocks 
% with a variable number of inputs and outputs. In some cases it may not be 
% practical or desirable to resize the block icon of a subsystem block so that 
% all of the input and output names within it are readable. In such cases, 
% the user may hide the names in the icon by using a mask or by hiding the 
% names in the subsystem associated with the icon. If you do this, the signal 
% lines coming into and out of the subsystem block should be clearly labeled 
% in close proximity to the block. 
%
% PASS/FAIL CRITERIA:
% ===================
% A Fail is given if parameter value of given block can not be shown
% completely.
%
% SOLUTION:
% =========
% change the size of block, so that its parameter name is visiable.
%
% FIX ACTION:
% ===========
% The size of the block is changed such that its given property will be
% visible.
%
% Note: following blocks will be chcked:
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
% TL_Data
% StoreWrite
% TL_LogicalOperator
% TL_Trigonometry
%
% CHECK PARAMETERS:
% =================
% No check parameters are used.
%
% NOTE:
% =====
% This check uses informations about font-size, font-type,... to compute
% the size of a parameter name.
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:35CEST $
% Revision:     $Rev: 6179 $
% *************************************************************************

function [result,cr_items,r_stats]= mes_jm_0002_a(system,cmd_s,reg, s_regerr)













































