% MES check: mes_mes_sf_003 - Interaction between Parallel States
%
% function [result, cr_items] = mes_mes_sf_003(system, cmd_s)
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
% mes_sf_003 -  Parallel states in Stateflow must be confluent
%
% If in a Stateflow chart parallel states influence each other by sending 
% and receiving events from or to each other, then the respective states 
% shall either be sender or receiver of events, but never both. For the order
% number (execution priority) Guideline dSpace_2.16.8 has to be respected. 
% The execution order shall be given by the user, not by geometrical ordering.
%
% This guideline defines a modelling-style, which restricts Stateflow charts 
% to a safer and less ambiguous subset. Fixing the execution order in the 
% right way and restricting the states to being either sender or receiver, 
% it can be assured that sending and receiving events is done in the same 
% cycle and collisions with other actions of the next cycle can be avoided.
%
% PASS/FAIL CRITERIA:
% ==================
% When parallel states communicate with each other by events the respective 
% states are either only sending events to or receiving events from the other 
% parallel states, but not both.
% 
% Parallel states communicating with each other by events are both senders 
% and receivers of cross state events.
%
% SOLUTION:
% =========
% Redesign the communication of the parallel states such that states are 
% only receivers or senders of crossstate events 
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:02:57CEST $
% Revision:     $Rev: 7304 $
% ***********************************************************

function [result, cr_items, r_stats] = mes_mes_sf_003(system, cmd_s)














































































































































































































































































































































