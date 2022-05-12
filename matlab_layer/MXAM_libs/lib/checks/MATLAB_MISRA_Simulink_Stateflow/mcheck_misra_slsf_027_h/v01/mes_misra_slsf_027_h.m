% MES check: std_sc005 - Signal and bus label usage
%
% function [result,cr_items,r_stats]=mes_misra_slsf_027_fg(system,cmd_s)
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
% mes_misra_slsf_027_h - Signal and bus label usage
%
% H: All signals and busses that will be visualized must be labelled.
%
%
% PASS/FAIL CRITERIA:
% ===================
% If all signals connected with scope xy graph and all signals that will be
% shown in floating scope block have name, then this model gets a pass,
% otherwise, a fail will be given.
%
% Note: signals that will be visualized are here defined as all signals
% that are connected with scope, xy-graph block or selected by the signal
% selector of a floating scope block.
%
% CHECK PARAMETERS:
% =================
% MISRA_SL_SF.BasicMaskedBlocks:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {''}
%   DESCRIPTION:
%       Each entry of list is a masktype and represents a masked basic  
%       block. Signal lines placed in such blocks are not considered by 
%       Guideline. Note: Blocks with empty MaskType will be ignored.
% 
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:19CEST $
% Revision:     $Rev: 6836 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_027_h(system,cmd_s) %#ok<INUSD>

































































































































































































