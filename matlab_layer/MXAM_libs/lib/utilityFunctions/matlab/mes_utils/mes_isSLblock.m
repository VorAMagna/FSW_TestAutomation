% tests if block <block> is a Simulink block
%
% SYNTAX:
% ======
%   [b_res,masktypes,blocktypes,maskdescriptions,concatenatedProps]=mes_isSLblock(block)
%   [b_res]=mes_isSLblock(block,concatenatedProps)
%   [b_res]=mes_isSLblock(block,masktypes,blocktypes,maskdescriptions)
%
% INPUT ARGUMENTS:
% =================
% block:          - block handle or block pathstring to be checked
% masktypes: cell array with mask types of all simulink blocks
% blocktypes: cell array with block types of all simulink blocks
% maskdescriptions: cell array with block descriptions of all simulink blocks
% concatenatedProps: cell array with concatenated block properties
%                    (blocktypes,masktypes,maskdescriptions) used to
%                    identify SL blocks
% DESCRIPTION:
% ============
% Notes: - If [masktypes ,blocktypes and maskdescriptions] or their combination 
%          concatenatedProps are provided, the classification is based on 
%          these arguments. If no properties are given, the function will get
%          them from the Simulink Library and return it for re-use.
%          To increase performance, properties can be re-used. In this
%          case, providing concatenadedProps is faster than providing the
%          properties separate.
%       -  mes_isSLBlock(bdroot) will return false, because the block diagram is not a block
%
% RETURN VARIABLES:
% ==================
% b_res:    - true, if h_block is a Simulink block
%             false if h_block is not Simulink block
% masktypes,
% blocktypes,
% maskdescriptions: same meaning as corresponding input parameters
%
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Version:      $Rev: 7301 $
% Date:         $Date:
% ***********************************************************

function [b_res,masktypes,blocktypes,maskdescriptions,concatenatedProps]=mes_isSLblock(block,inarg2,blocktypes,maskdescriptions)








































































































