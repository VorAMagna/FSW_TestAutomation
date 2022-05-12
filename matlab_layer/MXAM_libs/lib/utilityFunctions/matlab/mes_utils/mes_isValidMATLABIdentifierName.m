% function b_res=mes_isValidMATLABIdentifierName(s)
% checks if string s is a valid name for a MATLAB identifier
% input argument 
%  s: tested string          
% return variable:
%  b_res: boolean, true (1), if string is valid
%                  false (0), if string is not valid   
% criteria:
% string is not empty
% first char is [a..z,A..Z]
% all following chars are [a..z,A..Z,0..9,_]
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date: $Date: 2020/07/31 16:10:20CEST $
% Version: $Rev: 633 $
% Author: Jörg Sangals (joerg.sangals@model-engineers.com)

function b_res=mes_isValidMATLABIdentifierName(s)
































