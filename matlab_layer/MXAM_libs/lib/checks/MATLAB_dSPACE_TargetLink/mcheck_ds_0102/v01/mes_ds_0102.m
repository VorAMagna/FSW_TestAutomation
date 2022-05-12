% MES check: ds_test_0102 - Use of Data Types for Trigonometric Blocks
%
% function [result,cr_items,r_stats] = mes_ds_0102(system, cmd_s)
%
% RETURN VARIABLES:
% =================
% result: string with a short
% description of the check result
%           'failed' | 'passed' | 'fixed' | 'Error <error message>' |
%           'fixed/failed'
% cr_items:  cell array with structs on the found rule deviation
%              fields common to all item:
%                .qualifier: describes item type
%                ('block','tl-block','signal','sf-chart') .result:
%                'faulty', 'fixed' 'fix failed' .linkaction: hyperref
%                string linking to the faulty/fixed items
% r_stats: struct with statistic s on the check result
%          checkeditems.count ignoreditems.count fixeditems.count
% See also mxam_cmdkeyset (displays available keywords), mxam_add2cmdstr
%
% INPUT ARGUMENTS:
% ================
%   system: specifies the model/system/block to be searched by the check
%           format: full path name or handle or a list of full path names
%           or handles (arrays and 2d arrays are not supported)
%   cmd_s: command string to specify nonstandard calling options
%          may contain any number of key/value pairs according to following
%          syntax: '/<key>:(!)<val>(!) (/<key>:(!)<val>(!)) (...)' <key>:
%          command option key word (see below) <val>: value of the
%          associated key
%                 if <val> contains whitespaces, slashes or other keywords,
%                 it must be enclosed in exclamation marks, e.g.
%                 '/ignorelist:!c:\Program Files\register.igl!' val can
%                 also be empty if the key simply sets a flag, whereas the
%                 colon must be present , e.g. '/register:'
%
%         supported key words
%
%         key             val           meaning/example
%
%         /register       :(empty)      if set, performs a register-call,
%                                       i.e. only returns check infos, but
%                                       does not perform the check
%         /ignorelist     :!<path>!     list containing blocks/subsystem
%                                       that are ignored by the check e.g.
%                                       /ignorelist:!c:\myignorelist.igl!
%         /fixmode        :user         shows a dialog where the user can
%                                       decide, if and how the found
%                                       deviations are fixed.
%                         :automatic    fixes automatically all found rule
%                                       deviations, given the check
%                                       supports a fix action
%                         :interactive  shows a dialog which enables the
%                                       user to view the found rule
%                                       deviations (items) one by one and
%                                       decide for each item if a fix
%                                       should be made or not.
%        /followlinks    :on            find_system option: do follow
%        library links
%                        :off           find_system option: do not follow
%                        library links
%        /lookundermasks :none          find_system option : dont look
%        under masks
%                        :graphical          : Masks with no workspace and
%                        no dialog :functional         : Masks with no
%                        dialog :all
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
% ds_0102 - Use of Data Types for Trigonometric Blocks.
%
% The data types used for the hyperbolic functions sinh, cosh, tanh, asinh,
% acosh, atanh within a Trigonometric Function block must all be
% floating-point. For the atan2 function, the use of 32-bit integer input
% signals and output signals of unsigned integer type is not permitted.
%
% PASS/FAIL CRITERIA: 
% =================== 
% 
% If the input and output signal of trigonometeric function block with
% function sinh cosh tanh asinh acosh atanh has floating point data type
% and for atan2 function, no 32bit integer input signal and no unsigned
% integer output signal, then this block gets a pass,otherwise, a fail is
% given.
%
% RATIONALE:
% ========== 
% The combinations of the above functions and data types are not supported 
% by TargetLink for code generation
%
% SCOPE:
% ======
% - The rule is only relevant to the development of controllers,
%   but does not apply to the design of plant models, for instance.
% - TargetLink code generation
%
% GUIDELINE REFERENCE:
% ====================
% dSPACE Modeling Guidelines for MATLAB/Simulink/Stateflow and TargetLink,
% version 3.0, chapter 8.8
% 
% ************************************************************************
% copyright:    Model Engineering Solutions 
% Date:         $Date: 2020/07/31 16:05:27CEST $
% Revision:     $Rev:$
% ************************************************************************

function [result,cr_items,r_stats]= mes_ds_0102(system,cmd_s) %#ok<INUSD>




















































































































































































































































