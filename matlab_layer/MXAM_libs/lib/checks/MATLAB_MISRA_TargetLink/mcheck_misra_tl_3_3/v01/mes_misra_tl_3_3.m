% MXAM check: misra_tl_3_3 - Use of calibration constants
%
% function [result,cr_items,r_stats] = mes_misra_tl_3_3(system, cmd_s)
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
% RETURN VARIABLES:
% ==================
%   result: string with a short description of the check result
%           'failed' | 'passed' | 'fixed' | 'Error <error message>' | 'fixed/failed'
%   cr_items:  cell array with structs on the found rule deviation
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
% GUIDELINE:
% ==========
% (original requirement of MISRA TL guideline 3.3)
% - Use of calibration constants -
% Upper and lower constraints must be supplied for
% calibration constants. The preferred method is to define the
% constraints with the symbol definition in the Data Dictionary.
%
% The MISRA requirements are adapted as following:
%
% Calibratable...
%   1) output.variables of TargetLink constant blocks,
%   2)  table.variables of TargetLink lookup table blocks and
%                   and of TargetLink interpolation blocks and
%   3) variables underlying stateflow constants
% should be linked to
%  a) variables held in the TargetLink data dictionary, having
%  b) defined Min and Max values.
%
% PASS/FAIL CRITERIA
% ==================
% 1) TargetLink constants fail, whose property output.class is not empty and
% not 'default' and the property 'info' of the class is neither 'none'
% nor 'readonly' (it is then calibratable), and its' output.variable is
% linked to a DD variable, but the Min and/or Max property of the DD variable
% is not defined.
% 2) Lookup tables and interpolation blocks fail, if their table.class is
%    a calibratable class, and their table.variable is a DD variable but
%    its min and max are not defined,
% 3) DD variables fail, it they are connected to a Stateflow constant and
%    belong to a calibratable class, but their Min and/or Max is not defined
% All other constants pass.
%
% Note: The check misra_tl_3_3 does not inspect calibratable constants which
% are not linked to the DD. For this check, see MXAM check misra_tl_3_2.
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% Date:         $Date: 2019/03/29 12:48:32CET $
% Revision:     $Rev: 6115 $
% *******************************************************************

function [result,cr_items,r_stats]=mes_misra_tl_3_3(system,cmd_s) %#ok<INUSD>













































































































































































































































































