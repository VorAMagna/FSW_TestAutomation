%% [bIsBus,busStruct] = mes_block_has_businport(hBlock,portIndex,portType,bs)
%
% DESCRIPTION:
% ============
% Checks if block has a bus inport.
%
% Test if the block has bus in the given porttype and port index. If only
% block handle is given, then test all ports of the block, if one of them
% has bus, then return true.
%
% SYNTAX [bIsBus,busStruct] = mes_block_has_businport(hBlock,portIndex,portType,bs)
%
% INPUT PARAMETERS:
% =================
% - hBlock:    block handle
% - portIndex: one-base index of inport or outport
% - portTyoe:  type of port,Inport or Outport
% - bs:        struct as returned by tl_check_system. Fields that are used
%              here are:
%              .hAllBlocks               handles of all blocks in the model
%              .compiledBlockDataTypes   compiled port widths of all blocks
%              .compiledBlockDimensions  compiled port dimensions of all blocks
% - b_tryCompile: if true, try to compile the model
% - b_resetCompileFlag: if true, reset the model compilable flag to
%               unknown, this is used internally.
% RETURN VALUES:
% ==============
% - bIsBus:     boolean
%               True if input signal is a bus, false otherwise
% - busStruct:  struct
%               Simulink bus struct
% - s_warning:  string
%               Returns warning message of id Simulink:SL_BusSelDupMuxSigNames
%
% EXAMPLE:
% ========
% [bIsBus,busStruct] = mes_block_has_businport(hBlock);
% return: bIsBus = true, if any ports of hBlock has bus, otherwise,
%         bIsBus = false, busStruct = null;
%
% [bIsBus,busStruct] = mes_block_has_businport(hBlock,1);
% return: bIsBus = true, if block is inport and the outport 1 has bus or block is not
%         inport and inport 1 has bus, otherwise,
%         bIsBus = false; busStruct = the
%         struct of the bus if there is any.
%
% [bIsBus,busStruct] = mes_block_has_businport(hBlock,1,'Inport');
% return: bIsBus = true, if the inport with port number 1 of block has bus,
%         otherwise,
%         bIsBus = false; busStruct = the struct of the bus if there is any.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:02CEST $
% Revision:      $Rev: 15479 $
% ***********************************************************

function [bIsBus,busStruct,s_warning,b_modelIsNotCompilable] = mes_block_has_businport(hBlock,portIndex,s_portType,bs,b_tryCompile,b_resetCompileFlag)



































































































































































































































































































































































































































































































































