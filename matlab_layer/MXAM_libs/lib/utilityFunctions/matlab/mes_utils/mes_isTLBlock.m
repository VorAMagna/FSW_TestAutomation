% checks if block <h_block> is a TargetLink block or not
%
% SYNTAX:
% ======
%   [b_res,s_err]=mes_isTLBlock(h_block,b_dispErrMsg)
%
% INPUT ARGUMENT:
% =================
% h_block    - handle of the block, which should be checked
% b_dispErrMsg boolean, default=false, 
%              if true, error messages are displayed on the Matlab console
%              if the return variable s_err is not assigned
%              if false, error messages are not shown on the console.
%
% RETURN VARIABLES:
% ==================
% b_res    - true, if h_block is a Targetlink Block
%            false if h_block is a Simulink block or
%                     TargetLink  is not installed
% s_err   - (string) with error message or empty if no error occured
%
%
%
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Version:      $Rev: 3136 $
% Date:         $Date:
% ***********************************************************

function [b_res,s_err]=mes_isTLBlock(h_block,b_dispErrMsg,varargin)

























































































