% MES check: misra_tl_5_7 - Use of Data Types for Multiport Switch Block
%
% function [result,cr_items,r_stats] = mes_misra_tl_5_7(system, cmd_s)
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
% r_stats: struct with statistics on the check result
%          checkeditems.count
%          ignoreditems.count
%          fixeditems.count
% See also mxam_cmdkeyset (displays available keywords), mxam_add2cmdstr
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
% misra_tl_5_7: The first input (control port) of the Multiport Switch block
% should be driven by a signal with an unsigned integer data type.
%
% The following unsigned data types are allowed:
% - uint8
% - uint16
% - uint32
% - all unsigned fixed-point data types (e.g. "ufix(x)", "uint(x)" )
%
% The input signal of the control port has to be non-negative and is cast
% to an integer number by Simulink during the simulation.
%
% NOTE: for this check, the model needs to be in compile mode.
%
% PASS/FAIL CRITERIA
% ==================
% The check analyzes the control inport of each Multiport Switch block in the model
% 
%     Failed 1: The data type of the control inport signal is neither an integer (uint8, uint16, or uint32) nor another unsigned fixed-point data type.
%     Review 2: The data type of the control input is an enumeration type.
% 
% The check result is passed if all failed and review cases do not apply.
% 
% CHECK PARAMETERS:
% =================
% MISRA.check57.trustUserSpecifiedRange:
%   DATATYPE: 
%       boolean
%   DEFAULT VALUE:
%       false (0)
%   DESCRIPTION:
%       if true, user-defined ranges (Targetlink: output.min, output.max, 
%       Stateflow: sf.min, sf.max) are used to get the lower and upper
%       limit of the data range.
%       If false, the actual value of a variable is used and set to lower 
%       and upper limit of data range. User-defined min and max values are 
%       ignored.
%
% ************************************************************************
% copyright:    Model Engineering Solutions
% Date:         $Date: 2019/03/29 12:48:34CET $
% Revision:     $Rev: 6830 $
% ************************************************************************

function [result,cr_items,r_stats]=mes_misra_tl_5_7(varargin) %#ok<INUSD>
































