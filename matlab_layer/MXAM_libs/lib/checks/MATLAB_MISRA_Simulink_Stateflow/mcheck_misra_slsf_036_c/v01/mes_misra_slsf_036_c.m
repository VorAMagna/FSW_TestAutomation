% MES check: misra_slsf_306_c - The name of a Stateflow input/output is the
% same as the corresponding signal.
%
% function [result,cr_items,r_stats]=mes_misra_slsf_036_c (system,cmd_s)
%
% RETURN PARAMETERS:
% ==================
% result    - check summary (passed/failed/error messages)
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
% The name of a Stateflow input/output must be the same as the corresponding
% signal label
% Exception:
% Reusable Stateflow-blocks may have different port names. Those port names 
% are constructed like Simulink signal names.
%
% PASS/FAIL CRITERIA:
% ===================
% All the names of inports and outports of:
% stateflow subsystems are compared with the name of their signals;
% if they are identical then the model get a pass, otherwise, a fail
% will be returned.
% Stateflow subsystems with link status 'resolved' are not checked.
%
% Note:
% if a signal originates from a virtual input block and the property
% 'signalPropagation' is set to on, the signal name will be the input block name with
% <>, then the string in <> is used for checking.
% Before check the model, use ctrl+D to update the model.
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% date:         $date$
% version:      $Rev: 14964 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_036_c(system,cmd_s)





























































































































































































































