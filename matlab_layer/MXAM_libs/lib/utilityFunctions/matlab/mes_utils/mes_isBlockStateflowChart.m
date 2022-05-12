% Check if the given block is a stateflow chart
%
% SYNTAX
% ======
% b_res = mes_isBlockStateflowChart(block)
%
% DESCRIPTION:
% ============
% This function returns true if the given block is a chart otherwise,
% return false.
% In matlab before ver 2012b, the stateflow chart block has masktype
% 'Stateflow', but after that this masktype is removed, so that this
% function is necessary
%
% INPUT PARAMETERS:
% =================
% - block:         path or handle of the selected block
% RETURN VALUES:
% ==============
% - r_res        true if block is a chart, otherwise, false
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:17CEST $
% Revision:   $Rev: 15479 $
% ****************************************************************

function b_res = mes_isBlockStateflowChart(h_block)

















































