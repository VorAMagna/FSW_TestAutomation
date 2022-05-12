% MES check: misra_slsf_050_b - Stateflow window and text appearance
%
% function [result, cr_items] = mes_misra_slsf_050_b(system, cmd_s)
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
%   MISRA AC SLSF Modelling design and style guidelines for the 
%   application of simulink and stateflow, MIRA limited, May 2009, 
%   Ver 1.0, www.misra.org.uk
% 
% Guideline Rule ID: 
%   MISRA AC SLSF 050 A
%
% DESCRIPTION:
% ==========
% misra_slsf_050_b - All Stateflow text should use the Arial font.
%
% PASS/FAIL CRITERIA:
% ===================
% The check analyzes the font size of every text element in a Stateflow chart according to the font size given in the check parameter MISRA_SL_SF.misra_slsf_050_b.FontSize. Here, the check analyzes the font size defined as a global chart property and as a local property of a label or transition.
% 
% Global chart property:
% 
%     Failed1: The font size of transition labels differs from the value defined in the check parameter.
%     Failed2: The font size of state labels differs from the value defined in the check parameter. 
% 
% Local property:
% 
%     Failed3: The font size of a transition label differs from the value defined in the check parameter.
%     Failed4: The font size of a state label differs from the value defined in the check parameter.
%     Failed5: The font size of an annotation differs from the value defined in the check parameter. 
% 
% The check result is passed if all failed cases do not apply. 
% %
% SOLUTION:
% =========
% Set the font size as a global chart property of transition labels and state labels to the value of the check parameter MISRA_SL_SF.misra_slsf_050_b.FontSize (R2011b: Edit -> Style, R2013b: File -> Stateflow Preferences -> Style).
% Additionally, change the font size for each state label, transition label and annotation (note) individually or use the repair action provided by the check. 
% FIX OPERATION:
% ==============
% The repair action sets the global chart property font size of state labels and transition labels to the value of the check parameter MISRA_SL_SF.misra_slsf_050_b.FontSize. Furthermore, the font size of each state label, transition label and annotation (note) is set to the parameter value individually. 
% CHECK PARAMETERS:
% =================
% MISRA_SL_SF.misra_slsf_050_b.FontSize
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date: $Date: 2020/07/31 16:04:41CEST $
% Version: $Rev: 15479 $
% ***********************************************************

function [result, cr_items, r_stats] = mes_misra_slsf_050_b(system,cmd_s)





































