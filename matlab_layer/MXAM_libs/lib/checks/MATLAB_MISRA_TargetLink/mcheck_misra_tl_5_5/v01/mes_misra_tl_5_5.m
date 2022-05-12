% MES check: misra_tl_5_5 - Inports and Outports at the TargetLink
% subsystem interface
%
% function [result,cr_items,r_stats] = mes_misra_tl_5_5(system, cmd_s)
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
%
% MES CHECK: 
% ==========
% misra_tl_5_5 - Inports and Outports at the TargetLink
% subsystem interface
%
% The TargetLink Inports and Outports at the top level of a TargetLink
% subsystem that are used to define the system interface must be directly
% connected to the corresponding Simulink Input and Outport ports with no
% blocks such as From-Goto in between.
%
% The connection of intermediate blocks between the Simulink and TragetLink
% Inports and Outports at the TargetLink subsystem boundary is prohibited
% and will result in an error during code generation.
%
% This check is reasonable only for models with TargetLink-Version < 3.0
% and does not check Models with later TargetLink-Versions.
%
% PASS/FAIL CRITERIA:
% ===================
% This check searches for all Inports and Outports that are defined around
% the TargetLink top-level subsystem (the MaskType of this subsystem is
% "TL_SimFrame"). 
% Every simulink Inport around the top-level subsystem which is followed by
% one and only one TargetLink (bus) inport receives a pass; otherwise a
% fail.
% Every Simulink Outport around the top-level subsystem which is
% driven by a TargetLink (bus) outport that drives ONLY this Simulink
% outport receives a pass; otherwise a fail.
%
%
% ************************************************************************
% copyright:    Model Engineering Solutions
% Date:         $Date: 2019/03/29 12:54:17CET $
% Revision:     $Rev: 6115 $
% ************************************************************************

function [result,cr_items,r_stats] = mes_misra_tl_5_5(system, cmd_s) %#ok<INUSD>



























































































































































































































































































































































