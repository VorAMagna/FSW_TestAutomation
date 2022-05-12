% MES check: misra_tl_4_5 - Avoidance of Rounding Operations
%
% function [result,cr_items,r_stats] = mes_misra_tl_4_5(system, cmd_s)
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
% misra_tl_4_5 - Avoidance of Rounding Operations
%
% Rounding operations within integer calculations via the property 
% "Round Integer Calculation towards ... " should be avoided. 
% If a rounding function is required then the Rounding Function has to be used for that.
%
% Note: 
% -----
% A rounding operation appears if integer data types are specified for
% a block in which floating-point values are used also, or if the results
% of integer operations are not displayable as integer variables (for
% instance divisions).
%
% Example:
% --------
% A rounding operation is performed when the inports of e.g. a Sum-Block are
% non-whole-number floating-point data types (double or single, e.g. "0.3") and the
% outport of the Sum-Block is an integer data type (e.g. int16).
% In this case, the rounding founction should be used instead. More
% precisely, the floating-point arithmetic should be performed first. The
% result of this operation should then be rounded to integer with the
% Rounding function.
%
% (A) Example of improper use of rounding functionality:
%
% Signal_1(double)---|
%                    +---> result(int)
% Signal_2(double)---|
%
% (B) Example of appropriate use of rounding functionality:
%
% Signal_1(double)---|
%                    +---> result(double)-->|floor|-->result_rnd(int)
% Signal_2(double)---|
%
% Remark:
% -------
% The semantics on how the rounding operation is performed is partially 
% intransparent and block-specific in Simulink. 
% TargetLink does not emulate the different rounding methods in integer caluculations.
%
% The following block types for which the rounding method
% "Round Integer Calculation towards ... " can be selected will be checked:
% - Difference
% - Discrete Derivative
% - Discrete Integrator
% - First Order Transfer Fcn
% - Lookup-2D tables
% - Abs
% - Sum
% - Product
% - Bias
% - Math
% - MinMax
% - Switch
%
% PASS/FAIL CRITERIA
% ==================
% If the inports of one of the blocks are floating points data types while the
% outport is an integer data type a fail is given to the respective
% block(s).
%
% ************************************************************************
% copyright:    Model Engineering Solutions
% Date:         $Date: 2019/03/29 12:54:16CET $
% Revision:     $Rev: 6115 $
% ************************************************************************

function [result,cr_items,r_stats] = mes_misra_tl_4_5(system, cmd_s) %#ok<INUSD>










































































































































































































