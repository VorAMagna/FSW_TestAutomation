% MES check: ds_test_0105 - Use of Data Types for selector blocks.
%
% function [result,cr_items,r_stats] = mes_ds_test_0105(system, cmd_s)
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
% GUIDELINE:
% ==========
% Reference:
%   dSpace Modeling Guidelines for MATLAB/Simulink/Stateflow and
%   TargetLink, Version 3.0, 10.06.2010
%   Guideline Rule ID: 8.11
%
%
% MES CHECK:
% ==========
% ds_test_0105 - Use of TL Data Types for selector blocks.
%
% If the option Index vector (port) for the source of the element indices
% is specified for the Selector Block, all input signals must have identical
% data type and scaling information, i.e. must be of vector type
%
% PASS/FAIL CRITERIA:
% ===================
% A selector block receives a pass if, in case of indexing the input vector
% signal by an external source, each source has the same targetlink data
% type. If target link datatype is not float, sources must have identical
% scaling informations (lsb and offset).
%
% SOLUTION:
% =========
% Make sure that all input signals have identical data type and scaling
% information.
%
% RATIONALE:
% =========
% TargetLink supports this option under the above mentioned limitations for
% reasons of code efficiency
%
% NOTE:
% =====
% To check simulink data types, just compile the model (strg+d). If a
% selector block has several sources with different simulink data types,
% simulink throws an error.
%
% ************************************************************************
% copyright:    Model Engineering Solutions
% Date:         $Date: 2012-02-01 10:10:30
% Revision:     $Rev: 6115 $
% ************************************************************************

function [result,cr_items,r_stats]= mes_ds_0105(system,cmd_s) %#ok<INUSD>









































































































































































































































