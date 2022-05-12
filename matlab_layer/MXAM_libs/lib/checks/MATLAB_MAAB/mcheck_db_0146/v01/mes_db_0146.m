%% Triggered, Enabled, Conditional Subsystems
%
% [result,cr_items,r_stats] = mes_db_0146(system, cmd_s)
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
% Guideline Rule ID: db_0146 (7.1.9.)
%
% DESCRIPTION:
% ============
% The blocks that define subsystems as either conditional or iterative 
% should be located at a consistent location at the top of the subsystem 
% diagram. These blocks are:
% - Enable
% - Trigger
% - Action Port
% - Switch Case Action
% - For Iterator
% - While Iterator
%
% PASS/FAIL CRITERIA:
% ===================
% A trigger block gets a fail, if its position is not within the region
% given by the two parameters MAAB.db_0146.Trigger.Region and 
% MAAB.db_0146.Trigger.Range. 
% The same holds true for enable ports, action ports, for-iterator ports 
% and while-iterator ports in combination with the corresponding parameters.
%
% Additionally, each enable block gets a fail, which is positioned more
% right than a trigger block (if one exist).
%
% SOLUTION:
% =========
% Move the ports to the top of the diagramm. Move the enable block to left 
% the trigger block (if one exist)
%
% FIX OPERATION:
% ==============
% Fix does switch the position of an enable and a the most left trigger port 
% (if both exist).
% The fix-operation does NOT move the ports to the upper part of the
% diagramm.
%
% CHECK PARAMETERS:
% =================
% MAAB.db_0146.IgnoredBlocks:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'' ''}
%   DESCRIPTION:
%       Blocks defined by {BlockType MaskType} will not be considered by
%       this check. 
% 
% MAAB.db_0146.TriggerPort.Region:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       'left'
%   DESCRIPTION:
%       Possible other values for this parameter are 'center' and 'right'. 
%       This parameter defines the region, where a trigger block has to be
%       positioned. Each region is a third of the used simulink diagramm. 
%       The range of the diagramm is given by the distance between the most 
%       left and the most right block. 
%
% MAAB.db_0146.TriggerPort.Range:
%   DATATYPE: 
%       string (of a vector with two entries)
%   DEFAULT VALUE:
%       '[150 100]' ([x y], unit: pixel)
%   DESCRIPTION:
%       Value of this parameter gives the height(x) and the width(y) 
%       relative to the top left corner of the corresponding region of the 
%       rectangular, within a trigger might be positioned. 
% 
% MAAB.db_0146.EnablePort.Region:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       'left'
%   DESCRIPTION:
%       Possible other values for this parameter are 'center' and 'right'. 
%       This parameter defines the region, where a trigger block has to be
%       positioned. Each region is a third of the used simulink diagramm. 
%       The range of the diagramm is given by the distance between the most 
%       left and the most right block. 
%
% MAAB.db_0146.EnablePort.Range:
%   DATATYPE: 
%       string (of a vector with two entries)
%   DEFAULT VALUE:
%       '[150 100]' ([x y], unit: pixel)
%   DESCRIPTION:
%       Value of this parameter gives the height(x) and the width(y) 
%       relative to the top left corner of the corresponding region of the 
%       rectangular, within a trigger might be positioned. 
% 
% MAAB.db_0146.ActionPort.Region:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       'left'
%   DESCRIPTION:
%       Possible other values for this parameter are 'center' and 'right'. 
%       This parameter defines the region, where a trigger block has to be
%       positioned. Each region is a third of the used simulink diagramm. 
%       The range of the diagramm is given by the distance between the most 
%       left and the most right block. 
%
% MAAB.db_0146.ActionPort.Range:
%   DATATYPE: 
%       string (of a vector with two entries)
%   DEFAULT VALUE:
%       '[150 100]' ([x y], unit: pixel)
%   DESCRIPTION:
%       Value of this parameter gives the height(x) and the width(y) 
%       relative to the top left corner of the corresponding region of the 
%       rectangular, within a trigger might be positioned. 
% 
% MAAB.db_0146.ForIterator.Region:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       'left'
%   DESCRIPTION:
%       Possible other values for this parameter are 'center' and 'right'. 
%       This parameter defines the region, where a trigger block has to be
%       positioned. Each region is a third of the used simulink diagramm. 
%       The range of the diagramm is given by the distance between the most 
%       left and the most right block. 
%
% MAAB.db_0146.ForIterator.Range:
%   DATATYPE: 
%       string (of a vector with two entries)
%   DEFAULT VALUE:
%       '[150 100]' ([x y], unit: pixel)
%   DESCRIPTION:
%       Value of this parameter gives the height(x) and the width(y) 
%       relative to the top left corner of the corresponding region of the 
%       rectangular, within a trigger might be positioned. 
% 
% MAAB.db_0146.WhileIterator.Region:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       'left'
%   DESCRIPTION:
%       Possible other values for this parameter are 'center' and 'right'. 
%       This parameter defines the region, where a trigger block has to be
%       positioned. Each region is a third of the used simulink diagramm. 
%       The range of the diagramm is given by the distance between the most 
%       left and the most right block. 
%
% MAAB.db_0146.WhileIterator.Range:
%   DATATYPE: 
%       string (of a vector with two entries)
%   DEFAULT VALUE:
%       '[150 100]' ([x y], unit: pixel)
%   DESCRIPTION:
%       Value of this parameter gives the height(x) and the width(y) 
%       relative to the top left corner of the corresponding region of the 
%       rectangular, within a trigger might be positioned.
%
% NOTE:
% =====
% The demand, that the enable block has to be positioned left to the
% trigger block has been made to clearify this guideline
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:24CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0146(system, cmd_s)








































































