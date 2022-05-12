% MES check: misra_slsf_054_a - Transition labelling
%
% function [result, cr_items] = mes_misra_slsf_054_a(system, cmd_s)
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
% misra_slsf_054_a - Transition labelling
% A. Transition labels must be positioned so there is no ambiguity which
%    transitions they apply to.
%
% PASS CRITERIA:
% ================
% The check analyses the distances between transitions and their corresponding labels.
% The parameter MISRA_SL_SF.misra_slsf_054_a.MaxDistBetweenTransitionAndLabel defines the maximal allowed distance.
% Nonlinear transitions can not be analyzed. 
%  
% Review 1: every nonlinear transition
% Review 2: the distance is greater than the allowed range
% 
% The check result is passed if all failed cases do not apply.
%
% SOLUTION:
% =========
% Place the labels closest to its corresponding transition. 
% 
% NOTE
% ====
% Since there are only 3 Points for transitions, only linear transitions are 
% treated (for each other type, a correct analyse could not be guaranteed). 
% User is informed, if nonlinear transitions are used. 
%
% PARAMETER:
% ==========
% MISRA_SL_SF.misra_slsf_054_a.MaxDistBetweenTransitionAndLabel:
%   DATATYPE: 
%       integer
%   DEFAULT VALUE:
%       10 (unit: pixel)
%   DESCRIPTION:
%       Maximal allowed distance between transitions and its label. At the 
%       same time it is the minimal distance between a transition and the 
%       label of another transition. 
% MISRA_SL_SF.ReportNonlinearTransitionsIndividually
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'no'
%   DESCRIPTION:
%       Can be activated ('yes') to receive a warning for each nonlinear transition.
%       This makes it easier to review the single transitions.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:46CEST $
% Version:      $Rev: 15192 $
% ***********************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_054_a(system, cmd_s)










































