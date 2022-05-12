%% Test if a block is a 3rdParty LibBlock
%
% DESCRIPTION:
% ============
% Tests if the current block is a block from a 3rd Party lib, i.e. it has
% a link to a library. The Simulink Lib is ignored
%
% SYNTAX b_res=mxam_is3rdPartyLibBlock(hBlock)
%
% INPUT PARAMETERS:
% =================
% - hBlock:    block handle
%
% RETURN VALUES:
% ==============
% - b_res:    boolean
%               True if the block is lib block
%
% EXAMPLE:
% ========
% b_res=mxam_is3rdPartyLibBlock(hBlock)
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:58CEST $
% Revision:      $Rev: 15479 $
% ***********************************************************

function b_res=mxam_is3rdPartyLibBlock(h_block)
















































