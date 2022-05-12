% MES check: misra_slsf_013_bc - Control input of Multiport Switch
% Blocks
%
% function [result,cr_items,r_stats]=mesmisra_slsf_013_c(system,cmd_s)
%
% RETURN PARAMETERS:
% ==================
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
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
%
% MES CHECK:
% ==========
% mes_misra_slsf_013_c - Use of Multiport Switch Block
%
% The control input into the "multiport switch" block must be greater than
% or equal to 1 and not exceed the number of switched inputs.
%
% The control input should be 1-based to ensure a consistent approach within
% the company.
%
%
% PASS/FAIL CRITERIA:
% ===================
% Control input is 1-based.
%
% If the preceeding block has defined minimum and maximum values, minimum
% value has to be 1, maximum value has to be the number of switched inputs
% of the Multiport Switch block.
%
% If the preceeding block is a Saturation block, the saturation limits have
% to be 1 and the number of switched inputs of the Multiport Switch block.
%
% If no range is defined for the control signal, a warning is given by the
% check.
%
% SOLUTION:
% =========
% Add some additional logic at the control port of the Multiport Switch
% block in order to define a default path for possible data port selections
% and to guarantee that the value of the control input does not exceed the
% number of switched inputs, e.g. Saturation block.
%
% Note: If using minumim and maximum values for the control signal, the
% developer has to garuantee that the signal value never exceeds this range.
% The guideline check accepts the range if it fits to the number of inputs
% without further checking. The range information is used for code
% optimization and will also not be checked by TargetLink.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:06CEST $
% Revision:     $Rev: 7353 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_013_c(system,cmd_s)
















































































































































































