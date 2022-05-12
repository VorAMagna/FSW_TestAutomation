% MES check: misra_slsf_038_c - Operators in state machines
% Part C) Library functions must not be used.
%
% function [result,cr_items,r_stats]=mes_misra_slsf_038_c(system,cmd_s)
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
% MES CHECK:
% ==========
% misra_slsf_038_c - Operators in state machines
% Part C: Library functions must not be used.
%
% Rationale:
% 1) Generally, Simulink should be preferred for modelling complex data
%   transformations, because it is easier to specify the code generation
%   details and debug calculations.However, this needs to be balanced with
%   the overhead of triggering an external process to perform the calculation.
%   Hence simple mathematical operations may be performed directly in Stateflow.
% 2) Compliance with Misra AC GMG 012
%
% PASS/FAIL CRITERIA:
% ===================
% If in a chart no following C library function are used, a pass will be
% given, otherwise a fail will be given.
%
% abs acos asin atan atan2 ceil cos cosh exp fabs floor fmod labs ldexp log
% log10 pow rand sin sinh sqrt tan tanh min max
%
% The list of not-allowed C functions is defined by parameter:
% MISRA_SL_SF.checkSLSF038.ProhibitedCLibFunctions.
% 
% CHECK PARAMETERS:
% =================
% MISRA_SL_SF.checkSLSF038.ProhibitedCLibFunctions:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'abs' 'acos' 'asin' ...
%        'atan' 'atan2' 'ceil'...
%        'cos' 'cosh' 'exp' ...
%        'fabs' 'floor' 'fmod'...
%        'labs' 'ldexp' 'log'...
%        'log10' 'pow' 'rand'...
%        'sin' 'sinh' 'sqrt' ...
%        'tan' 'tanh' 'min' 'max'}
%   DESCRIPTION:
%       Each entry in ProhibitedCLibFunctions is a forbidden function for
%       Stateflow. 
%
% *************************************************************************
% Date:         $Date: 2020/07/31 16:04:29CEST $
% Revision:     $Rev: 6836 $
% *************************************************************************
% Test model and specification are in misra_slsf_038_c.mdl
% *************************************************************************
% author: Yongke Yu (yongke.yu@model-engineers.com)
% $Id: mes_misra_slsf_038_c.m 1.1 2020/07/31 16:04:29CEST Vojnic-Hajduk, Vladimir (vladvojn) Exp  $
% -------------------------------------------------------------------------
% revision history:
% 2011/04/19: created based on mes_misra_slsf_038_b
% -------------------------------------------------------------------------

function [result,cr_items,r_stats]=mes_misra_slsf_038_c(system,cmd_s) %#ok<INUSD>











































































































































































































































