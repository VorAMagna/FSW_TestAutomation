% MES check: ds_0016 - Bus Capable Blocks
%
% function [result,cr_items,r_stats] = mes_ds_0016(system, cmd_s)
%
% INPUT PARAMETERS:
% =================
%   system: specifies the model/system/block to be searched by the check
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
% ds_0016 - Bus Capable Blocks
%
% The following nonvirtual blocks, which are bus-capable in Simulink since
% R14, should not be driven by a bus in the targetlink environment:
% - Unit Delay
% - Multiport Switch
% - Merge
% - Switch
%
% Inspected are only Simulink blocks of the given type
% which are located in a Targetlink subsystem
%
% REFERENCE:
% ==========
% Modeling Guidelines for MATLAB/Simulink/Stateflow and TargetLink, Version 3.0
% Chapter 2.1.5: Buc-Capable Blocks
%
% CHECK PREREQUISITES:
% ====================
% This check requires the model to be in COMPILE MODE!
%
% PASS/FAIL CRITERIA
% ==================
% This check raises a fail for every block of the above mentioned type
% that is driven by a nonvirtual bus. If no bus is connected to the
% inport(s) of the checked block, a pass is given.
%
% NOTE: Bus creator blocks not necessarily create a (nonvirtual) bus.
%       Often, a vector signal is created instead, which is
%       in compliance with this check. Nonvirtual busses
%       can be identified by displaying the signal dimensions, which
%       are enclosed in in curly braces {}. Please refer to the MATLAB
%       documentation for more information on bus signals.
%
% CHECK PARAMETERS:
% =================
% dSPACE.BlocksRequiringNoBus.BlockType:
%   DATATYPE:
%       cellstring
%   DEFAULT VALUE:
%       {'UnitDelay', 'MultiPortSwitch', 'Merge', 'Switch'}
%   DESCRIPTION:
%       Blocktypes of blocks, that should not be driven by a bus.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:04CEST $
% Revision:     $Rev: 6835 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0016(system, cmd_s) %#ok<INUSD>








































































































































































































