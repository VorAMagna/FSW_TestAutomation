%% Gets the infos of output variable of TL block and stateflow chart or
% outports of subsystems having a TL block as source.
%
% SYNTAX:
% =======
%[dInfo,errmsg]=mes_getOutputDataInfoOfTLblock(hBlock,signalname,i_outportNo);
%
% DESCRIPTION:
% ============
% Gets data type, scaling, data range,variable class and allowed range
% of the output <i_outportNo> of hBlock, which can be a TL block, a stateflow
% chart or a subsystem. If hblock is a subsystem, and
%   a) if the outport block with the given outport number <outportNo> is a TL
%      block, this block will be analyzed.
%   b) if the outport is not a TL port, then mes_findSrcBlock will be used
%      to find its source, which will be analyzed.
%
% If the TL block has the property 'inheritscaling' selected, then the
% source of this block will be searched until the data info is explicitely
% given.
%
% If hBlock is TL bus port, <signalname> must be given to select a signal
% from the bus. If <signalname> is not given, the data infos of all
% signals in the bus will be returned in the field busdata
%
% If hBlock is a TL_DataStoreRead block, then the data type
% of the corresponding TL_DataStoreWrite will be returned.
%
% If the block is a chart or a TL_DFlipFlop, TL_DLatch, TL_SRFlipFlop, or
% TL_JKFlipFlop block, then the outportNo specifies the outport of interest
% If no outportNo is given, the data info of the first outport is returned
%
% If the block is a TL_PreProcessorIf block, the data type is bool,
% other properties are empty.
%
% Refer to doc of TL:TargetLink Production Code Generation Guide > Preparing
% Blocks for Simulation and Code Generation > Inheriting Signal Properties
%
% INPUT ARGUMENTS:
% ================
% -  hBlock          (double) (no default value)
%                    Handle of the block whose output variable info will be retrieved.
% -  signalname      (string) If the block is tl bus port, this argument is used to
%                    identify which signal will be retrieved
%                    NOTE: This parameter is also used in subsequent
%                    calls to mes_findSrcBlock!
% -  i_outportNo     (integer, default=1) If the block is a chart or TL_DFlipFlop
%                    TL_DLatch TL_SRFlipFlop TL_JKFlipFlop
%                    TL_ReceiverComSpec TL_SenderComSpecthis, is used to
%                    define which outport will be retrieved
% - li_muxvecind     if the signal is a vector, this is the index of
%                    signals to be retrieved. E.g[2 3 4]
% -  checkedBlocks   vector of block handles, for internal use only
%                    to stop recursive search in case of a signal loop.
%
%
% RETURN VALUES:
% ==============
% - dInfo           struct of the output data type
%    .actSource     the action source block from which the dInfo is
%                   obtained, it is useful if property of block is
%                   inherited.
%    .actPort       outport number of the actual source (1 based)
%    .datatype      data type of the output variable of the retrieved block
%    .basetype      base data type of the output variable of the retrieved block
%    .range         range of the data type
%    .allowedrange  min and max of the block
%    .lsb           lsb of the output variable
%    .offset        offset of the output variable
%    .class         output vatiable class
%    .errmsg
%    .isbus         if the block is TL bus port, and no signal name is
%                   given, then this is true
%    .isvector      if the signal is not a bus but a vector (length(lsb)>1)
%    .isScalingInvariant if Outport of chart or outport block of a
%                   TL_function subsystem is configured to be scaling
%                   invariant, this will be true. In this case, the scaling
%                   info in this return struct is not correct, they are
%                   depended on the inports in the same chart or same
%                   TL_function subsystem.
%    .busdata       if isbus is true, this has the info of all the bus
%                   signals
%    .busdata(i).actSource same as above
%    .busdata(i).actPort   same as above
%    .busdata(i).datatype data type of every bus signal
%    .busdata(i).basetype base data type of every bus signal
%    .busdata(i).range
%    .busdata(i).allowedrange
%    .busdata(i).lsb
%    .busdata(i).offset
%    .busdata(i).class
%    .busdata(i).isbus
%    .busdata(i).errmsg error message for this signal
% - errmsg          whole error message if error occurs.
%
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:12CEST $
% Revision:   $Rev: 15396 $
% ****************************************************************

function [dInfo,errmsg,checkedBlocks]=mes_getOutputDataInfoOfTLblock(hBlock,signalname,li_muxvecind,i_outportNo,checkedBlocks)






















































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































