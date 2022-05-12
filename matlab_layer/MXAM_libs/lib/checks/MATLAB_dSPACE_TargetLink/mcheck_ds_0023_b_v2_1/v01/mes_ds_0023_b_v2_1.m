% MES check: ds_0023_b_v2_1 -  Limitations with Regard to the Discrete-Time
%                       Integrator Block
%
% function [result,cr_items,r_stats] = mes_ds_0023_b_v2_1(system, cmd_s)
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
% ds_0023_b_v2_1 -  Limitations with Regard to the Discrete-Time Integrator Block
% 
% The level and sampled level option for the External reset property is not permitted for 
% the Discrete-Time Integrator block.
% The integrator method is either 'Forward Euler', 'Backward Euler' or
% 'Trapezoidal'
% The Show state port option is not permitted and the Gain value property must be set to 1.0
%
% Remark: TargetLink does not support this option for the 
% Discrete-Time Integrator block.
% 
% PASS CRITERIA:
% ================
% A pass is given to every Discrete-Time Integrator block 
% - whose External reset property is not set to level or sampled level AND
% - whose integrator method is set to 'Forward Euler', 'Backward Euler' or
%   'Trapezoidal'
% - the show state port option is off AND
% - Gain value property is 1.0.
%
% Otherwise, a fail is given.
%  
% PARAMETER: 
% ==========
% dSPACE.DiscreteIntegratorRequiringSetting.IntegratorMethod:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'Integration: Forward Euler','Integration: Backward Euler',
%        'Integration: Trapezoidal' }
%   DESCRIPTION:
%       Allowed values for integrator method. 
% Note: the above parameter is only for dSpace guideline 3.0
%
% dSPACE.DiscreteIntegratorRequiringSetting.ExternalReset:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'none','rising','falling','either'}
%   DESCRIPTION:
%       Alowed values for external reset. 
%
% dSPACE.DiscreteIntegratorRequiringSetting.ShowStatePort:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'off'
%   DESCRIPTION:
%       Allowed value for 'show state port'
%
% dSPACE.DiscreteIntegratorRequiringSetting.Gainval:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       '1.0'
%   DESCRIPTION:
%       Allowed value for  'gain value'. 
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:06CEST $
% Revision:     $Rev: 7102 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0023_b_v2_1(system, cmd_s)















































































































