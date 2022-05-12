% MES check: mes_ds_0103 - Use of Data Types for Math Blocks
% 
% function [result,cr_items,r_stats] = mes_ds_0103(system, cmd_s)
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
% ds_0103 - Use of Data Types for Math Blocks
%
% For TargetLink versions prior to TargetLink 2.1, fixed-point code
% settings for the mod and rem functions of the Math block have to be
% specified in the form of power-of-tow scaling without offset for the
% input signal and power-of two scaling for the ooutput signal. The
% Arbitary Scaling option is not permitted for the above functions for
% TargetLink versions prior to 2.1. Since TargetLink 2.1, arbitrary scaling
% is supported but the offsets of input and output must be set to zero.
% 
% PASS/FAIL CRITERIA:
% ===================
% In TL prior to version 2.1:
% If the input signal of a Math block with mod and rem functions has a 
% fixed-point data type and the offset is not 0 and the LSB is not a power of two
% or the output has a fixed point data type and its offset is not 0 or the 
% LSB is not a power of two, a fail will be given. Otherwise, the block will
% get a pass.
%
% In TL of version 2.1 or later:
% If the input signal of a Math block with mod and rem functions has a fixed-point
% data type and the offset is not 0, or the output has a fixed point data
% type and the offset is not 0, a fail will be given. Otherwise, the block will
% get a pass.
%
% Rational
% The combinations of the above functions and data types are not supported by TargetLink.
% 
% FIX ACTION:
% ===========
% no fix action
%
% ************************************************************************
% copyright:    Model Engineering Solutions
% Date:         $Date: 2012-02-03 10:10:30
% Revision:     $Rev: 6115 $
% ************************************************************************

function [result,cr_items,r_stats]= mes_ds_0103(varargin) %#ok<INUSD>













































