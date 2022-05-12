% MES check: ds_0036 - Restrictions with regard to the use of blocks from
% the ports & subsystems library.
%
% function [result,cr_items,r_stats] = mes_ds_0036(system, cmd_s)
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
% r_stats: struct with statistic s on the check result
%          checkeditems.count
%          ignoreditems.count
%          fixeditems.count
% See also mxam_cmdkeyset (displays available keywords), mxam_add2cmdstr
%
% INPUT PARAMETERS:
% =================
%   system: spefies the model/system/block to be searched by the check
%           format: full path name or handle or a list of full path names or handles
%           (arrays and 2d arrays are not supported)
%   cmd_s: command string to specify nonstandard calling options 
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
% MES CHECK: 
% ==========
% ds_0036 - Restrictions with regard to the use of blocks from the
% ports & subsystems library.
%
% This check tests if only allowed block of ports & subsystems library is used in
% model.
%
% Rationale:
% TargetLink supports all combinations of subsystems in Simulink. The Model
% block however, which is used for the Model referencing feature, is
% currently not supported.
%
% PASS/FALL CRITERIA:
% ================
% A pass is given if no block of ports & subsystems library, except the blocks
% given in the parameter dSPACE.checkds0022.AllowedBlocks, is used,
% otherwise fail is given.
%
% Note: The blocks listet in dSPACE.checkds0022.AllowedBlocks must exactly
% be the same as the corresponding block in the library (i.e. including
% linebreaks, spaces)
% 
% CHECK PARAMETERS:
% =================
% dSPACE.checkds0036.BeingCheckedSLLib:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       ['simulink/Ports &' char(10) 'Subsystems']
%   DESCRIPTION:
%       Simulink library that is checked. 
% 
% dSPACE.checkds0036.ProhibitedBlocks:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {['simulink/Ports &' char(10) 'Subsystems/Model']}
%   DESCRIPTION:
%       Allowed blocks within this library. 
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:12CEST $
% Revision:     $Rev: 6835 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0036(varargin)






































