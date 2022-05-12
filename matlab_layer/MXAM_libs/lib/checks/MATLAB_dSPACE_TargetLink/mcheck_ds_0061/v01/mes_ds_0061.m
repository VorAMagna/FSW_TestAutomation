% MES check: ds_0061 - Order Numbers for Parallel States
%
% function [result, cr_items] = mes_ds_0061(system, cmd_s)
%
% RETURN PARAMETERS:
% ==================
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
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
%              e.g.: '/f:user
%
% MES CHECK:
% ========== 
% ds_0061 - Order Numbers for Parallel States 
% An AND state that broadcasts an event to its neighbouring states must
% have a higher priority number than the receivers. In theory,multiple
% parallel (AND) states in the same chart execute concurrently. In
% practice, a Stateflow chart determines when to activate each state during
% simulation. To this end, parallel states are assigned priority numbers
% based on the order of their execution. The lower the number, the higher
% the priority. The priority number of each state appears in the upper
% right corner.
%
% PASS CRITERIA:
% ================
% A parallel state receives a pass, if this state sends any event from its
% state actions or transition/condition actions not coming from any states
% to its neighbouring states and has a higher priority number than all the
% reveivers; or it does not send any event to its neighbouring states from
% its state actions and transiton/contition actions not coming from any
% states.
%
% NOTE
% ====
% An event can be sent via state action like en du ex and in transition
% actions, but the event sent from the transitions that connect two states
% will not trigger the problem described above, so that the transitions
% connecting two states will not be checked.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:20CEST $
% Revision:     $Rev: 14938 $
% ***********************************************************

function [result, cr_items, r_stats] = mes_ds_0061(system, cmd_s)





























