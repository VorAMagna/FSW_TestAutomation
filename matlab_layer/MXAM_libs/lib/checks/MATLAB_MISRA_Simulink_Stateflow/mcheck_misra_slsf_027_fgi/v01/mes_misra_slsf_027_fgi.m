% MES check: mes_misra_slsf_027_fgi - Signal and bus label usage - Specific
% blocks
%
% function [result,cr_items,r_stats]=mes_misra_slsf_027_fgi(system,cmd_s)
%
% RETURN PARAMETERS:
% ==================
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistic s on the check result
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
% mes_misra_slsf_027_fgi - Signal and bus label usage
%
% F: 
% - All signals and busses that originating from the following blocks
%   must be labelled: Constant, From, Subsystem, Stateflow Chart, Demux,
%   Selector.
% 
% G:
% All signals and busses connected to the following destination blocks
% must be labelled: Bus Creator, Goto, Mux, Subsystem, Stareflow Chart.
% 
% I: 
% Signal labels or propagated labels must be applied to busses as
% follows:
% - the bus itself
% - all sub-busses within the bus
% - all signals in the bus
%
% Note: Signals originating from and connected to Subsystems are checked in
% check 027_cd, and signals inside reuseable Subsystems are checked in
% 027_e, so that such signals will not be checked here.
% For Requirement I, can check the input and output signals of all bus
% creator blocks, the input signals of bus creator block is required to be
% checked in requirement G, then for I, only check the output signal of bus
% creator block, this can be done by adding bus creator block in
% requirement F.
%
% PASS/FAIL CRITERIA:
% ===================
% If signals originating from Constant, From, Stateflow Chart, Bus Creator, 
% Demux and Selector are labelled, and all signals connected to Bus Creator, 
% Goto, Mux and Stateflow Chart are labelled and all of them are outside a 
% reusable subsystem, then the model will get a pass.
% Otherwise, a fail will be given.
%
% SOLUTION:
% =========
% Add label to the mentioned signal or bus.
%
% PARAMETER:
% ==========
% MISRA_SL_SF.misra_slsf_027_fgi.BasicMaskedBlocks:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {''}
%   DESCRIPTION:
%       Each entry of list is a masktype and represents a masked basic  
%       block. Signal lines placed in such blocks are not considered by
%       Guideline. Note: Blocks with empty MaskType will be ignored.
%
% MISRA_SL_SF.misra_slsf_027_fgi.checkedBlocktype:
%   DATATYPE: 
%       cellstring
%   DEFAULT VALUE:
%       {'Constant','From','SubSystem','Demux','Selector','BusCreator',
%        'Goto','SubSystem','Mux'}
%   DESCRIPTION:
%       Signals originating from blocks, with these blocktypes must be 
%       labelled. 
%
% MISRA_SL_SF.misra_slsf_027_fgi.checkedSignaltype:
%   DATATYPE: 
%       string (contains a matrix)
%   DEFAULT VALUE:
%       '[1,1,1,1,1,0,0,0,0]'
%   DESCRIPTION:
%       Define the type of signal of the specified blocks which is  to be 
%       checked. If entry is 1, the output signal of the corresponding 
%       block will be checked, if ==0, the input signal will be checked
%       NOTE: Length of this parameter and length of 'checkedBlocks' must be
%       equal.
% 
% MISRA_SL_SF.misra_slsf_027_fgi.CheckContentOfLibraries:
%   DATATYPE: 
%       string (contains a matrix)
%   DEFAULT VALUE:
%       'off'
%   DESCRIPTION:
%       If 'off', content of library blocks will not be checked. 
%       If 'on', content of library blocks will be checked. Other values 
%       are not allowed.
%       Note: For this check, global parameter 'followlinks' will be 
%       ignored. The setting of this local parameter will be considered 
%       instead. Reason: For this check, it is not recommended to check the 
%       contents of libraries.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:04:19CEST $
% Revision:     $Rev: 6836 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_misra_slsf_027_fgi(system,cmd_s) %#ok<INUSD>







































































































































































































































