% MES check: mes_sf_002 - Variable Assignments in Transition Segments
%
% function [result,cr_items,r_stats] = mes_sf_002(system, cmd_s)
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
% mes_sf_002 - Within a multi segmented transition path, a variable is only
% to be assigned a value on a transition action or a condition action of the 
% last segment of the transition path. The last segment is the transition 
% whose destination is a state or a junction with no outgoing transitions. 
% %
% Note:
% If behind a segment there is a path to final junction or state without
% condition, then the assignment is allowed in this segment.
%
% PASS/FAIL CRITERIA
% ==================
% The check analyzes each variable assignment in a multi segmented transition path.
% Failed 1: a variable assignment is defined in a condition action of a transition that is not the last of a multi segmented transition path.
% The check result is passed, if all failed cases do not apply. 
%
% TECHNICAL NOTES
% ==================
% Variable assignments made in the intermediate transition segments .
% Note : Assignment operators that are detected by this check are:
% a++
% a--
% a += 5
% a -= 5
% a *= 5
% a /= 5
% a = b
% Added assignment operators on 04/07/2017
% ~a
% !a
% -a
% a := 5
% a |= 5
% a &= 5
% a ^= 5
% ***********************************************************
% Copyright:    Model Engineering Solutions GmbH
% Date:         $Date: 2020/07/31 16:02:56CEST $
% Version:      $Rev: 14944 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_mes_sf_002(system,cmd_s)














































