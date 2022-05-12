% MES check: ds_0087 - Simulink signal line appearence
%
% function [result,cr_items,r_stats]=mes_ds_0087(system,cmd_s)
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
% ds_0087 - Simulink signal line appearence
%
% Check if the signal lines:
%  - are drawn vertically or horizontally.
%  - are drawn with right angles.
%  - not cross each other.
%  - are not drawn one upon the other.
%  - are drawn with enough space between for a optical separation.
%  - do not cross any system, module, cluster or basic blocks.
%  - do not cross any signal labels or label instances. 
%  If signal lines are branched, the mark point of the branching point is
%  situated on the branching point, and should not split into more than two
%  sub-lines at a single branching point.
%  The Following case is also allowed:
%             -----------------
%            |
%--------------------------
%    |
%     ---------------------------
% PASS/FAIL CRITERIA:
% ===================
% The check computes the geometric relationship between all the lines and 
% between lines and blocks, if the distance of two lines is greater than
% 10, and all the lines do not cross eachother, and no line crosses blocks,
% at a single branching point not more than two sub lines are splitted, and
% no overlap between the lines of one branch, and all lines are drawn
% vertically or horizontally,then the model passes this check. If not, the
% model receives a fail and the links to the lines with errors are given.
% The user can click on the link and view the highlighted lines.
%
% Note:
% The lables of the line are not checked.
% This feature will be covered in the next version.
% Subsystems with link to library are not checked.
% The model must be compiled before it is checked.
%
%
% ******************************************************************
% Copyright:  Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:24CEST $
% Revision:     $Rev: 6115 $
% ******************************************************************

function [result,cr_items,r_stats]=mes_ds_0087(varargin)















































