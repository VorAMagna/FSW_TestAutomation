% MES check: misra_tl_5_8 - Use of the Switch block
%
% function [result,cr_items,r_stats] = mes_misra_tl_6_5(system, cmd_s)
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
%
% MES CHECK:
% ==========
% misra_tl_5_8 - Use of the Switch block
%
% The control input to a Switch block should be a Boolean type and the
% treshold value should be set to 0.5 (or a given value). Block annotation should be used to
% display the treshold value. This rule ensures consistent use of the
% Switch block and clarity of the model in printed form.
%
% Although it would appear that the Boolean control input is compared to a
% floating point value of 0.5, TragetLink will recognize this and optimize
% the generated code to an if ... else purely dependent upon the Boolean
% control input.
%
% PASS/FAIL CRITERIA:
% ===================
% A pass is given to TL_Switch blocks, which treshold is set to 0.5 and the
% threshold.criteria is not 'u2~=0', the control input is a datatype of
% boolean and the block annotation contains the treshold value.
% Otherwise the block get a fail.
%
% CHECK PARAMETERS:
% =================
% MISRA.misra_tl_5_8.threshold:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       '0.5'
%   DESCRIPTION:
%       Value of the threshold of an TL Switch (as string).
% 
% MISRA.misra_tl_5_8.criteria:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'u2>=threshold','u2>threshold'}
%   DESCRIPTION:
%       Allowed settings for option 'threshold.criteria' of a TL Switch. 
% 
% MISRA.misra_tl_5_8.withoutAttributesFormatString:
%   DATATYPE: 
%       boolean
%   DEFAULT VALUE:
%       false (0)
%   DESCRIPTION:
%       If true, the blocks attribute format string must be used to display
%       the threshold of the TL Switch. 
% 
% ************************************************************************
% copyright:    Model Engineering Solutions
% Date:         $Date: 2019/03/29 12:54:17CET $
% Revision:     $Rev: 6830 $
% ************************************************************************

function [result,cr_items,r_stats] = mes_misra_tl_5_8(system, cmd_s)





























































