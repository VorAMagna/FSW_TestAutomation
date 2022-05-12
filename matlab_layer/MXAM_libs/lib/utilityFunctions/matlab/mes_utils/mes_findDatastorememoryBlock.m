% Finds the corresponding data store memory of a data store read or write
% block, also for TL data store blocks.
%
% SYNTAX
% ======    
% hDatastoreM=mes_findDatastorememoryBlock(hBlock)
%
% DESCRIPTION:
% ============
% This function uses the rule of Simulink to search the corresponding data
% store memory block of a data store read or write block. The data store
% memory block that has shortest distance to the data store read(write)
% block with the same data store name will be returned. If the given block
% is a TargetLink block, the corresponding TL block is searched.
%
% INPUT PARAMETERS:
% =================
% - hBlock:        path or handle of the given data store read(write) block
%
% RETURN VALUES:
% ==============
% - hDatastoreM        the corresponding data store memeory block, or -1 if
%                      not found.
% 
% EXAMPLES:
% =========
% No example is necessary.
%
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:04CEST $
% Revision:   $Rev: 3136 $
% ****************************************************************

function hDatastoreM=mes_findDatastorememoryBlock(hBlock)


































































































