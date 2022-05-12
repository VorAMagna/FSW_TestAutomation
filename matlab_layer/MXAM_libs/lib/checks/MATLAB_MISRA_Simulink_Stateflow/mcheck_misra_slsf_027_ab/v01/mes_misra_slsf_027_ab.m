% MES check: mes_misra_slsf_027_ab - Signal and bus label usage
%
% function [result,cr_items,r_stats]=mes_misra_slsf_027_ab(system,cmd_s)
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
% mes_misra_slsf_027_ab - Signal and bus label usage
%
% A: All signals and busses that require a label must be labelled
% directly (non-propagated label) at their source (reuseable subsystem
% output boundary is considered a source).
% B: Propagated labels must be used to redisplay the name of a previously
% labelled signal or bus on all subsequent usage of the signal flow.
%
% PASS/FAIL CRITERIA:
% ===================
% If a signal from a source block has a signal name and all signals that
% can inherit this signal name have set the property 'signalPropagation' to
% 'on', this signal will get a pass; if a signal has a name but the
% property 'signalPropagation' is 'on' and all other cases a fail will be
% given. Note: if the signal has a name that is different with its source
% signal, it is regarded as be changed purposely, in this case no error is
% reported.
% e.g:
% Sourceblock--------(s1)-----block1---(ss1)---block2------block3
% No rule violation will be shown for the signal between block1 and block2, 
% because the signal name is regarded to be changed purposely. 
% A rule violation will be reported for the nameless signal between block2
% and block3. The hilited block is always the sourceblock.
% 
% Note: In requirement 027-A, it is not defined which signals require a label.
% In the check, if a signal name appears in the data flow, then this signal is
% considered as a signal requiring a label.
% Reusable subsystem is considered as Linked subsystem (link status ~=
% None), this can be changed by changing the function
% mes_isReuseableSubsystem.
%
% CHECK PARAMETERS:
% =================
% MISRA_SL_SF.misra_slsf_027_ab.BasicMaskedBlocks:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {''}
%   DESCRIPTION:
%       Each entry of list is a masktype and represents a masked basic  
%       block. Signal lines placed in such blocks are not considered by 
%       Guideline. Note: Blocks with empty MaskType will be ignored.
%
% MISRA_SL_SF.misra_slsf_027_ab.LibrariesToCheck: 
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {''}
%   DESCRIPTION:
%       Each entry of this list is a library. Each block of this library is
%       treated as a reuseable Subsystem and therefore as a source
%       If list is empty -> each reuseable subsystem is treated as a source
%       If list has entries -> only subsystems from these libraries are 
%       treated as source. 
%
% SOLUTION:
% =========
% Set the signal property 'signalPropagation' to 'on'.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:18CEST $
% Revision:     $Rev: 6836 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_027_ab(varargin)




































