% MES check: mes_sfcolor_001 - Darstellungsoptionen in Stateflow
%
% function [result,cr_items,r_stats] = mes_mes_sfcolor_001(system, cmd_s)
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
% mes_sfcolor_001 - Darstellungsoptionen in Stateflow
%
% Für Stateflow-Charts sind folgende Darstellungsoptionen zu verwenden:
%==================================================================
%                Option                                   | Farbe
%------------------------------------------------------------------
%  o Hintergrundfarbe(ChartColor)                         | weiss  
%
%  o Vordergrundfarbe bei States(StateColor)              | schwarz
%
%  o Textfarbe bei State Labels(StateLabelColor)          | schwarz
%
%  o Vordergrundfarbe bei Junction(JunctionColor)         | braun
%
%  o Vordergrundfarbe bei Transition(TransitionColor)     | blau
%
%  o Textfarbe bei Transition Labels(TransitionLabelColor)| blau 
%
%  o Fontname bei State und Transition Labels             | Arial
%
%  o Fontsize bei State und Transition Labels             | 12
%  
%  o Angle für fontname und fontsize                      | NORMAL    
%===================================================================
%
% CHECK PARAMETERS:
% =================
% MES.mes_sfcolor_001.SF.ChartColor:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'white'
%   DESCRIPTION:
%       Background-Color of Stateflow Charts
% 
% MES.mes_sfcolor_001.SF.JunctionColor:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'brown'
%   DESCRIPTION:
%       Color of Stateflow Junctions
%
% MES.mes_sfcolor_001.SF.StateColor:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'black'
%   DESCRIPTION:
%       Color of Stateflow States
%
% MES.mes_sfcolor_001.SF.StateFontWeight:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'normal'
%   DESCRIPTION:
%       Font-Weight of Stateflow states
%
% MES.mes_sfcolor_001.SF.StateFontAngle:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'normal'
%   DESCRIPTION:
%       Font-Angle of Stateflow states
%
% MES.mes_sfcolor_001.SF.StateFontName:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'Arial'
%   DESCRIPTION:
%       Font-Name of Stateflow states
%
% MES.mes_sfcolor_001.SF.StateFontSize:
%   DATATYPE: 
%       integer
%   DEFAULT VALUE:
%       12
%   DESCRIPTION:
%       Font-Size of Stateflow states
% 
% MES.mes_sfcolor_001.SF.StateLabelColor:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'black'
%   DESCRIPTION:
%       Label color of Stateflow states
%
% MES.mes_sfcolor_001.SF.TransitionColor:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'blue'
%   DESCRIPTION:
%       Color of Stateflow transitions
%
% MES.mes_sfcolor_001.SF.TransitionFontWeight:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'normal'
%   DESCRIPTION:
%       Font-Weight of Stateflow transitions
%
% MES.mes_sfcolor_001.SF.TransitionFontAngle:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'normal'
%   DESCRIPTION:
%       Font-Angle of Stateflow transitions
%
% MES.mes_sfcolor_001.SF.TransitionFontName:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'Arial'
%   DESCRIPTION:
%       Font-Name of Stateflow transitions
%
% MES.mes_sfcolor_001.SF.TransitionFontSize:
%   DATATYPE: 
%       integer
%   DEFAULT VALUE:
%       12
%   DESCRIPTION:
%       Font-Size of Stateflow transitions
% 
% MES.mes_sfcolor_001.SF.TransitionLabelColor:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%       'blue'
%   DESCRIPTION:
%       Label-Color of Stateflow transitions
% 
% PASS CRITERIA:
% ==============
% passed ist gegeben für alle Charts, die oben genannten
% Darstellungsoptionen erfüllen.
%
% FAIL CRITERIA:
% ================
% failed ist gegeben für alle Charts, die oben genannten
% Darstellungsoptionen nicht erfüllen.
%
% FIX ACTION:
% Die falschen Darstellungsoptionen werden auf die richtigen gesetzt 
% 
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Version:      $Rev: 15479 $
% Date:         $Date: 2020/07/31 16:03:53CEST $
% ***********************************************************

function [result,cr_items,r_stats] = mes_mes_sfcolor_001(system, cmd_s) %#ok<INUSD>












































