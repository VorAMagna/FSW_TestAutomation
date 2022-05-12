% MES check: mes_misra_slsf_020_abcd - Text Appearance
%
% function [result,cr_items,r_stats]=mes_misra_slsf_020_abcd(system,cmd_s)
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
%              e.g.: '/f:user' %
%
% 
% GUIDELINE: 
% ==========
% Reference:
%   MISRA AC SLSF Modelling design and style guidelines for the 
%   application of simulink and stateflow, MIRA limited, May 2009, 
%   Ver 1.0, www.misra.org.uk
% 
% Guideline Rule ID: 
%   MISRA AC SLSF 020 abcd
%
%
% MES CHECK: 
% ==========
% misra_slsf_020_abcd - Text Appearance
% A model must not use other fonts, than those specified in the Simulink 
% Fonts Defaults. 
% - All blocks that have a visible name should use the predefined block font  
% - All signal labels/lines should use the predefined label font.
% - Comment/annotation text should use the predefined comment font.
%
% MISRA recommends Block font plain 10pt Arial, Label font plain 9pt Arial, 
% Comment font plain 10pt Times New Roman.
%
% PASS/FAIL CRITERIA:
% ===================
% To display text (names, comments, ...) every model element uses default font
% attributes (font name, size, wight and angle) as chosen for a project in the
% Simulink preferences. The attributes are either assigned explicitely (adjusted
% via the Format/Font menue or block parameters to the default values) or
% implicitely (via Block Parameters "FontName" set to "auto", "FontSize" to -1,
% "FontWeight" to "auto" and "FontAngle" to "auto").
%
% SOLUTION:
% ========
% Set font attributes back to default values.
%
% CHECK PARAMETERS:
% =================
% MISRA_SL_SF.BlockFont.Name:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'auto'
%   DESCRIPTION:
%       Font-Name of blocks. Choose 'auto' to inherit model settings.  
% 
% MISRA_SL_SF.BlockFont.Weight:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'auto'
%   DESCRIPTION:
%       Font-Weight of blocks. Choose 'auto' to inherit model settings. 
% 
% MISRA_SL_SF.BlockFont.Angle:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'auto'
%   DESCRIPTION:
%       Font-Angle of blocks. Choose 'auto' to inherit model settings. 
% 
% MISRA_SL_SF.BlockFont.Size:
%   DATATYPE: 
%       integer
%   DEFAULT VALUE:
%       -1
%   DESCRIPTION:
%       Font-Size of blocks. Choose -1 to inherit model settings. 
% 
% MISRA_SL_SF.LineFont.Name:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'auto'
%   DESCRIPTION:
%       Font-Name of lines. Choose 'auto' to inherit model settings.  
% 
% MISRA_SL_SF.LineFont.Weight:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'auto'
%   DESCRIPTION:
%       Font-Weight of lines. Choose 'auto' to inherit model settings.
% 
% MISRA_SL_SF.LineFont.Angle:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'auto'
%   DESCRIPTION:
%       Font-Angle of lines. Choose 'auto' to inherit model settings. 
% 
% MISRA_SL_SF.LineFont.Size:
%   DATATYPE: 
%       integer
%   DEFAULT VALUE:
%       -1
%   DESCRIPTION:
%       Font-Size of lines. Choose -1 to inherit model settings. 
% 
% MISRA_SL_SF.AnnotationFont.Name:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'auto'
%   DESCRIPTION:
%       Font-Name of annotations. Choose 'auto' to inherit model settings.  
% 
% MISRA_SL_SF.AnnotationFont.Weight:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'auto'
%   DESCRIPTION:
%       Font-Weight of annotations. Choose 'auto' to inherit model settings.
% 
% MISRA_SL_SF.AnnotationFont.Angle:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'auto'
%   DESCRIPTION:
%       Font-Angle of annotations. Choose 'auto' to inherit model settings. 
% 
% MISRA_SL_SF.AnnotationFont.Size:
%   DATATYPE: 
%       integer
%   DEFAULT VALUE:
%       -1
%   DESCRIPTION:
%       Font-Size of annotations. Choose -1 to inherit model settings.
%
% NOTE: 
% =====
% It has no effect for the current model, if Simulink default values are
% changed by using the GUI. You need to use the API in this case. 
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% date:         $Date: 2020/07/31 16:04:12CEST $
% version:      $Rev: 6836 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_020_abcd(system,cmd_s,reg, s_regerr) %#ok<INUSD>




















































































































































































































































