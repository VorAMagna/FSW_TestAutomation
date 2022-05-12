% MES check: misra_tl_3_2 - Definition of calibration constants in Simulink
% and Stateflow
%
% function [result,cr_items,r_stats] = mes_misra_tl_3_2(system, cmd_s)
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
% (Original requirement)
% misra_tl_3_2 - Definition of calibration constants in Simulink
% and Stateflow
% Calibrateable constants in Simulink and Stateflow should
% have an entry in the data dictionary and a value that is initialized from
% the MATLAB workspace. The names of the Simulinik/Stateflow object, data
% dictionary variable and MATLAB workspace item must be the same.
%
% Because:
% - In a TargetLink model, all Simulink constant-blocks are replaced by
%   TL constant-blocks
% - In Stateflow, a constant can be connected with a DD variable but its
%   value can not be defined by a variable of the Matlab workspace
%
% the original requirement has been adapted as follows:
%
% A TargetLink calibrateable constant
% - should be defined as a variable in the data dictionary, and
% - should be initialized by a MATLAB workspace variable with the same name.
% Regarding the TL Constant-block, this leads to
% - if the output.class is calibrateable, then output.variable must be a
%   variable in DD and
% - the output.value must a variable in Matlab workspace;
% Regarding the TL LookUp Table, this leads to
% - the table.value must be a Matlab variable, and
% - the table.variable must be a DD variable.
%
% Regarding Stateflow this leads to
% - a constant with a calibrateable class should connect with a DD variable
%   with the same name. (this is realized in the field Description, like:
%   $TL$ name=$D; class=CAL; variable=SF_const1; $TL$)
%
%
% PASS/FAIL CRITERIA
% ==================
% A fail is given for TL-Constant blocks if one of the following cases are
% true. The constant
% - output.class
%   - is not empty
%   - is not 'default'
%   - has 'info', which
%       - is not 'none'
%       - is not 'readonly'
% - output.value is defined by
%   - a number
%   - a variable, which does not exist in Matlab base workspace
% - output.variable
%   - is empty
%   - is not defined in DD
% - output.variable, variable in output.value and name of block are not
%   identical
%
% For TL-LookUp-Table additionally, the table.variable and table.value have
% to fullfil the same criteria as output.variable and output.value.
%
% For Stateflow, a fail is given, if a stateflow constant is defined as
% calibrateable
% - but is not connected with a DD variable
% - is connected with a DD variable, which has a different name.
%
% If none of the above criterias is true, a pass is given.
%
% See also misra_tl_3_3
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2019/03/29 12:54:15CET $
% Revision:     $Rev: 6145 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_misra_tl_3_2(system,cmd_s) %#ok<INUSD>

















































































































































































































































































































