% MES check: misra_slsf_038_a - Operators in state machines- Only simple
% mathematical operations are permitted in Stateflow.
%
% function [result,cr_items,r_stats]=mes_misra_slsf_038_a(system,cmd_s)
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
%   MISRA AC SLSF 038 
%
% Scope of implementation:
%   section A - Only simple mathematical operations are permitted in
%   Stateflow.
%
% MES CHECK:
% ==========
% misra_slsf_038_a - Operators in state machines
%
% Only simple mathematical operations are permitted in Stateflow.
% - each individual action should not contain more than one type of
%   operator(i.e. only addition or only subtraction, etc.).
% - a condition should only contain logical and relational operators and
%   one 'simple' operator (*,+,-).
%
% Rationale:
% Generally Simulink should be preferred for modelling complex data
% transformations, because it is easier to specify the code generation
% details and debug calculations. However, this needs to be balanced with
% the overhead of triggering an external process to perform the
% calculation. Hence simple mathematical operations may be performed
% directly in Stateflow.
%
% PASS/FAIL CRITERIA:
% ===================
% A pass is given if 
% - each action has not more than one type of operator
% - each condition has only logical and relational operators and 'simple' 
%   operator '*','+', '-' (might be used several times). 
% 
%
% Operator classes
% bit: << >>
% Logic: ~ & && | || !
% Relational: < <= == >= > ~= !=
% Add: + ++
% Sub: - --
% Mul: * ^ (^ is used as xor in c, but here is exp)
% Div: / \ %%
% Ignore: =
%
% CHECK PARAMETERS:
% =================
% MISRA_SL_SF.OperatorClasses.Bit:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'<<','>>'}
%   DESCRIPTION:
%       List of operators, that are treated as an indicator for bit-class
% 
% MISRA_SL_SF.OperatorClasses.Logic:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'~','&','&&','|','||','!'}
%   DESCRIPTION:
%       List of operators, that are treated as an indicator for logic-class
% 
% MISRA_SL_SF.OperatorClasses.Rel:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'<','<=','==','>=','>','~=','!='}
%   DESCRIPTION:
%       List of operators, that are treated as an indicator for 
%       relational-class
% 
% MISRA_SL_SF.OperatorClasses.Add:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'+','++'}
%   DESCRIPTION:
%       List of operators, that are treated as an indicator for a sum
%       operation
% 
% MISRA_SL_SF.OperatorClasses.Sub:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'-','--'}
%   DESCRIPTION:
%       List of operators, that are treated as an indicator for a subtract
%       operation
%
% MISRA_SL_SF.OperatorClasses.Mul:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'*','^'}
%   DESCRIPTION:
%       List of operators, that are treated as an indicator for a
%       mulitplication operation
%
% MISRA_SL_SF.OperatorClasses.Div:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'/','\','%%'}
%   DESCRIPTION:
%       List of operators, that are treated as an indicator for a
%       division operation
%
% MISRA_SL_SF.OperatorClasses.Ignore:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'='}
%   DESCRIPTION:
%       List of operators, that will be ignored. 
%
% *************************************************************************
% Date:         $Date: 2020/07/31 16:04:28CEST $
% Revision:     $Rev: 15098 $
% *************************************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_038_a(system,cmd_s) %#ok<INUSD>









































































































































































































































































