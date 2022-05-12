% MES check: ds_0047 - Use of the Multiport Switch block
%
% function [result,cr_items,r_stats] = mes_ds_0047(system, cmd_s)
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
% ds_0047 - Use of the Multiport Switch block
%
% The Multiport Switch block in Simulink does not support a default path.
% Proper behavior of the Multiport Switch block should be ensured by restricting
% the potential values of the control port (e.g. employ additional logic).
%
% PASS/FAIL CRITERIA:
% ===================
% Since it is hard to check whether a default path has been modeled, the
% modeler is always informed, i.e. a warning is raised, about a potential
% missing default path. The existence of the default path must be ensured 
% individually by the modeler.
% 
% NOTE:
% =====
% This guideline becomes obsolete with Matlab versions higher or equal
% than R2010b. Since this version, the default case option is automatically
% set by the MultiSwitch block itsself. Models, that are saved with older
% versions and are opened with the newer Matlab version are updated
% automatically. 
% If this check is applied to a model opened with R2010 (or higher), check
% will return a pass with notes, that emphasizes, that this checks is no
% longer necessary. 
% 
% CHECK PARAMETERS:
% =================
% dSPACE.checkds47.trustUserSpecifiedRange:
%   DATATYPE: 
%       boolean
%   DEFAULT VALUE:
%       false (0)
%   DESCRIPTION:
%       if true, user-defined ranges (in Targetlink: output.min, output.max, 
%       in Stateflow: sf.min, sf.max) are accepted to limit the control  
%       input range.
%       If false, the data-limited range of control input is checked, and 
%       user-defined min and max values are ignored.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:15CEST $
% Revision:     $Rev: 6835 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0047(varargin) %#ok<INUSD>









































