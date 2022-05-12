%function b_tlblock=mes_is_slblock_in_tlblock(h_block)
%
% RETURN PARAMETERS:
% ==================
% b_tlblock    - true -> h_block is SL-Block in a TL-Block
%                false -> h_block is an independent SL-Block
%
% INPUT PARAMETERS:
% =================
% h_block    - handle of the block, which should be checked
%
% Description:
% ============
% Checks, if the given block is located in the top level of 
% a TargetLink-Block. (When using the option followlinks=on, find_system also
% finds sl-blocks inside the tl-blocks. This behavior is not desired.)
%
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:21CEST $
% Version:      $Rev: 633 $
% ***********************************************************

function b_sl_in_tlblock=mes_is_slblock_in_tlblock(h_block)








































