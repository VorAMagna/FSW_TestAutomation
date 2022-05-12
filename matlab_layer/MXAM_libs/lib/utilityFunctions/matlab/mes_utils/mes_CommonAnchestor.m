% function h_system = mes_CommonAnchestor(lh_blocks)
%
% DESCRIPTION:
% ============
% Returns handle of lowest level system which is a common anchestor of 
% all blocks in lh_blocks or empty, if lh_blocks have no commn anchestor
% (e.g. are from different models or are no valid block handles).
%
% INPUT PARAMETERS:
% =================
% - lh_blocks: list of block handles
%
% RETURN VALUES:
% ==============
% - h_system: handle of anchestor system
%
% EXAMPLE:
% ========
% lh_blocks=[handle1, handle2];
% mes_CommonAnchestor(lh_blocks)
% ans = 
%   14.010
% 
% ****************************************************************
% Copyright:  Model Engineering Solutions, 2008
% Date:       $Date: 2020/07/31 16:10:00CEST $
% Revision:   $Rev: 633 $
% ****************************************************************

function h_system = mes_CommonAnchestor(lh_blocks)

































































