%Obsolete: use mes_findSrcBlock
%finds the source block of <inport> of <block>
% SYNTAX
% ======
% [h_srcblock,i_srcportno,output_signame,cs_passedsubsys,last_src,s_message] =
%         mes_find_srcblock(block, inport, s_lookundermasks,signalname,
%                           i_demuxoutportno,stop_blocktype,
%                           b_dispTLmessOnUnconnectedBlocks)
%
% DESCRIPTION:
% ============
% This function returns the source block to which 
% inport no. <inport> of <block> is connected.
% The source signal will be tracked until one of the following
% blocks is found:
%  - merge block
%  - TL inport block
%  - any block generating a new signal, (e.g. a logical
%      or arithmetic block, a state chart, etc.)
%  - ground block,
%  - unconnected inports or bus selectors or demux blocks
%    note: for these unconnected blocks,
%        h_srcblock will be set to -1 and
%        the block handle will be returned in last_srcblock
%        except for root level inports.
%  - a block of type <stop_blocktype>
%  - a bus creator or mux block which created the tracked signal
%    note: signals
%
% INPUT PARAMETERS:
% =================
% - block:         path or handle of the selected block
% - inport:        id of the tracked inport, can be an
%                  inport number or one of the following
%                  identifier strings: {'Enable','Trigger',
%                  'State','Ifaction'}, 
%                  default = 1
% - s_lookundermasks:  (optional) s. find_system ('on', 'off')
%                    default-value: 'off'
% - signalname:     (optional) string or cell array, if searching an
%                     element of a bus, the name of the element, default:
%                     empty (e.g search the bus, for internal use. In case
%                     a TL bus inport is the found source, the return
%                     variable  output_signame will have the components of
%                     the signal name, then it can be transfered to this
%                     function to search the source of this signal)
%                     e.g: 'signal1', {'signal1','signal2'},see
%                     output_signame.
% - i_demuxoutportno: (optional) outport number of the demux. If given,
%                    than the source signal can be traced through
%                    a mux - demux configuration.
%                    If, e.g., this parameter is 3, then the 3rd input
%                    of the mux is the src block (for internal use only)
%                    Currently only works, if all demux outports are scalar
% - stop_blocktype:  (optional) type of the block that, if such a block is
%                    found, is returned as source block
% - b_dispTLmessOnUnconnectedBlocks (optional): if true, 
%                    and if an unconncected inport was found, then a targetlink
%                    message is created and the TL message browser is opened
%                    if false, no message is shown
%                    default: mesvar_DebugInfo
%
% RETURN VALUES:
% ==============
% - h_srcblock:       > 0 : handle of the found sourceblock
%                   -1  : 'block' is not connected or src can not be found
% - i_srcportno:    the port number of the outport of the sourceblock, 
%                   zero-based, or -1, if not available
% - output_signame: cell array, if source block is a TL bus, this is the name
%                   of the signal,otherwise, it is empty. E.g:
%                   {'signal1','signal2'},  means the name of the output
%                   signal is 'signal1.signal2'.
% - cs_passedsubsys:  the subsystems that the source signal pass through
% - last_src:       the last source block during the search process
%                   for example an unconnected inport
% - s_message: string, reserved (currently not used)
% - i_demuxportno: outport number of the demuxport, if the traced
%                  signal is muxed.
%                  otherwise -1.
% 
% EXAMPLES:
% =========
%  srcblock = mes_find_srcblock(gcb, 1, 'on');
%  srcblock = mes_find_srcblock(gcb, 1);
%  srcblock = mes_find_srcblock(gcb);
%  [src,pNr,signalnames]=mes_find_srcblock(gcb,1);
%  if the src is a tl bus inport, and signanames is not empty, use the
%  following to search the source of the signal:
%  [nsrc,pNr,nSignalnames]=mes_find_srcblock(src,1,signanames);
% See also: mes_getMuxBusStruc
%
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:06CEST $
% Revision:   $Rev: 1616 $
% ****************************************************************

function [h_srcblock,i_srcportno,output_signame,cs_passedsubsys,last_src,s_message,i_demuxoutportno] ...
         = mes_find_srcblock(block, inport, s_lookundermasks,signalname,...
                             i_demuxoutportno,stop_blocktype,...
                             b_dispTLmessOnUnconnectedBlocks)






















































































































































