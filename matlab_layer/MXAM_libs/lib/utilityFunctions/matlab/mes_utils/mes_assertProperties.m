% checks input and throws error if input does not meet specification
%
% This function checks the input against your specification and throws an error if the input  
% does not meet the specification. Helps you to write cleaner and smaller code by age the 
% checking of the input.
%
% Syntax checkedValue = mes_assertProperties( input2Validate, defaultValue, varargin)
%
% Input:
%  input2Validate : [Variable of any Type, string if Keyword Exist is used] the input which should 
%                    be validated
%  varargin:        [ KeyWords or KeyValuePairs] see mes_verifyInput Input varargin for all Options
%                    Option 'Exist':   if Option Exist is given the input2Validate needs to be a 
%                    string which is then evaluated in the caller Workspace, if it exists, the 
%                    Variable is used for further inputchecking.
%  Output:  
%     none
%
%  Example:
%  %check input which is not present in Workspace
%  mes_assertProperties( 'input', 'cell','Exist')
%  ??? Error using ==> mes_assertProperties at 16
%   For Option Exist: couldn't find 'input' in caller Workspace.
%
%  %check input which is present in Workspace
%  input = 3;
%  checkedInput = mes_getVerifiedInput( 'input', 'num','Exist')
%
%  %check input 3
%  input = 3;
%  checkedInput = mes_getVerifiedInput( input, 'num')
%
%  See also: mes_verifyInput, mes_getVerifiedInput

function mes_assertProperties( input2Validate, varargin)
























































