% MES check: ds_0096 - Data Types for Relational and Logical Operator
%
% function [result,cr_items,r_stats] = mes_ds_0096(system, cmd_s)
%
% INPUT PARAMETERS:
% =================
%   system: model/subsystem to be checked
%   cmd_s:  command string to specify nonstandard calling options 
%          may contain any number of key/value pairs according to following 
%          syntax: '/<key>:(!)<val>(!) (/<key>:(!)<val>(!)) (...)'
%          <key>: command option key word (see below)
%          <val>: value of the associated key
%                 if <val> contains whitespaces, slashes or other keywords,
%                 it must be enclosed in exclamation marks, 
%                 e.g.   '/ignorelist:!c:\Program Files\register.igl!'
%                 val can also be empty if the key simply sets a flag,
%                 whereas the colon must be present , e.g. '/register:'
%
%         supported key words
%
%         key             val           meaning/example
%
%         /register       :(empty)      if set, performs a register-call, 
%                                       i.e. only returns check infos, but does 
%                                       not perform the check
%         /ignorelist     :!<path>!     list containing blocks/subsystem
%                                       that are ignored by the check
%                                       e.g. /ignorelist:!c:\myignorelist.igl!
%         /fixmode        :user         shows a dialog where the user can
%                                       decide, if and how the found
%                                       deviations are fixed.
%                         :automatic    fixes automatically all found rule
%                                       deviations, given the check supports
%                                       a fix action
%                         :interactive  shows a dialog which enables the
%                                       user to view the found rule
%                                       deviations (items) one by one and
%                                       decide for each item if a fix should
%                                       be made or not.                   
%        /followlinks    :on            find_system option: do follow library links
%                        :off           find_system option: do not follow library links
%        /lookundermasks :none          find_system option : dont look under masks
%                        :graphical          : Masks with no workspace and no dialog
%                        :functional         : Masks with no dialog 
%                        :all         
%        /quiet          :(empty)       if set, most messages on the MATLAB
%                                       Command Window are suppressed.
%        /xml                                   
%
%        note: all /fixmode options assume that the check support fixing.
%        note: shortcuts of keys (but not of vals) are recognized if unique
%              within the active keylist (as defined in mxam_cmdkeylist)
%              e.g.: '/f:user' 
% 
% RETURN PARAMETERS:
% ==================
% result: string with a short description of the check result
%           'failed' | 'passed' | 'fixed' | 'Error <error message>' | 'fixed/failed'
% cr_items:  cell array with structs on the found rule deviation
%              fields common to all item:
%                .qualifier: describes item type ('block','tl-block','signal','sf-chart')
%                .result: 'faulty', 'fixed' 'fix failed'
%                .linkaction: hyperref string linking to the faulty/fixed items 
% r_stats: struct with statistics on the check result
%          checkeditems.count
%          ignoreditems.count
%          fixeditems.count
% See also mxam_cmdkeyset (displays available keywords), mxam_add2cmdstr
%
% MES CHECK: 
% ==========
% ds_0096 - Data Types for Relational and Logical Operator
%
% For the Relational Operator and Logical Operator blocks, the boolean,
% logical (see Configuration Parameters:Optimization) or double output data types 
% must be used. The settings should also be consistent for all blocks, meaning
% they should be set to either boolean, double, or logical for all Relational
% Operator and Logical Operator blocks. 
% If the blocks setting is 'logical', then the models simulation option
% 'Implement logical signals as boolean (vs. double)' must be set to 'on'. 
% 
% Purpose:
% Identical data types for TargetLink and Simulink.
%
% Remark
%
% The output data types of the TargetLink Relational Operator and Logical Operator
% blocks are either double or boolean, depending on the global Simulink option
% 'Implement logical signals as boolean (vs. double)' in the Simulation/Configuration 
% Parameters/Optimization dialog. The behavior is therefore identical to the logical
% option in Simulink. In order to ensure equal data types in Simulink and TargetLink,
% the options above have to be specified consistently for all blocks. If necessary,
% the global Simulink option 'Implement logical signals as boolean (vs. double)' has
% to be modified also. If succeeding blocks must be driven by a different data type,
% the output signals of Relational Operator and Logical Operator blocks have to be cast
% to the proper type using a Data Type Conversion block.
%
% PARAMETERS:
%     dSPACE.SL.RelOpBlockDataType must be either 'Boolean','Logical' or
%     'Double'
% 
%
% PASS/FAIL CRITERIA:
% ===================
% A fail is given to each relational and logical operator block, if the
% blocks properties Output Data Type Mode and Output Data Type are not consistent
% with the mxam parameter dSPACE.SL.RelLogOpBlockDataType, as follows:
%
% FIX ACTION:
% ===========
% LogicDataType, OutDataTypeMode (Logical Operator blocks only) and  LogicOutDataTypeMode 
% (Relational Operator blocks only) will be set according to the mxam parameter specified 
% in dSPACE.SL.RelOPBlockDataType as defined above.
%
% Note: This setting can also be applied manually by opening the block properties
% dialog and selecting the "Signal Data Types" tab. Here, the setting is
% called "Output Data Type Mode".
% 
% CHECK PARAMETERS:
% =================
% dSPACE.SL.LogRelOpBlockDataType:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'Boolean'}
%   DESCRIPTION:
%       value of parameter       required setting of                                    required setting of        
%                                (Logic)OutDataTypeMode:                                LogicOutDataType:
%       'Boolean'                'Boolean'                                              (irrelevant)
%       'Logical'                'Logic (see Configuration Parameters: Optimization)'   (irrelevant)
%       'Double'                 'Specify via dialog'                                   'double'
%       '
%       Furthermore, if RelLogOpBlockDataType is set to 'boolean' or 'logical',
%       then the models configuration parameter 'Implement logical as boolean (vs. double)',
%       Diagnostics Pane, must be set to 'on'. 
% 
% 
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:26CEST $
% Revision:     $Rev: 6835 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_ds_0096(system,cmd_s) %#ok<INUSD>































































































































































































































































