% Validate number of input arguments.
% narginchk(LOW,HIGH) throws an error if nargin is less than LOW or
% greater than HIGH.
%
% This function replaces MATLAB's built-in narginchk, because narginchk is
% available only from R2011b onwards, but we also need it on earlier releases.
% We do not want to use the earlier nargchk, because it provokes a deprecation
% warning each time used on newer releases.

function mes_narginchk(nmin, nmax)







































