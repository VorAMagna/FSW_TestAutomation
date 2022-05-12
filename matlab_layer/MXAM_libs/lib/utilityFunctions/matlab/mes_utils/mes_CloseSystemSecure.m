% Try to close an open model/system by checking first if really open
%
% This function checks, if the model/system with the given name
% is open. Only then a close_system is tried. 
% The model is not saved automatically.
% This approach avoids warning messages, when the system to be closed 
% is not open (sometimes easier to handle in programs, when the user 
% already closed a system).
%
% Syntax: mes_CloseSystemSecure(ModelName)
%
% Input:
%   ModelName     - String containing name of the system to close
%
% Output:
%   none
%
% See also: mes_OpenSystemSecure

function mes_CloseSystemSecure(ModelName)
































