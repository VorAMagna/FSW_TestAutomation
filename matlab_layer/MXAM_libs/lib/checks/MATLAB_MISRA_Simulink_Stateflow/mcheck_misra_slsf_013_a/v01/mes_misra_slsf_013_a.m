% misra_slsf_013_a - Use of Multiport Switch Block A) Number of switch inputs
% function [result,cr_items,r_stats]=mes_misra_slsf_013_a(system,cmd_s)
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
% mes_misra_slsf_013_a - Use of Multiport Switch Block
%
% There must be at least two switched inputs into the "multiport switch"
% block.
%
% RATIONALE:
% ========== 
% Together with MISRA AC SLSF 013C the A, B part of the guideline ensures 
% correct behaviour of the "multiport switch" block and the model under all 
% circumstances; i.e. no negative or non integer numbers, as the "multiport 
% switch" block does not support a default path. 
% 
% PASS/FAIL CRITERIA:
% ===================
% Number of switched inputs is at least 2.
%
% SOLUTION:
% =========
% Use the multiport switch only if there are at least two alternative input
% signals to switch.
%
% CHECK PARAMETERS:
% =================
% MISRA_SL_SF.misra_slsf_013_a.MinimumInputNumberOfMultiport:
%   DATATYPE: 
%       integer
%   DEFAULT VALUE:
%       2
%   DESCRIPTION:
%       Multiport Switches must have at least 'MinimumInputNumberOfMultiport'
%       inputs.  
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:05CEST $
% Revision:     $Rev: 6836 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_013_a(varargin)

































