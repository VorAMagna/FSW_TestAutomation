% returns the range of the output signal in the given outport of the demux
% block
%
% SYNTAX:
% =======
% [index_range,errmsg]=mes_getDemuxOutportIndex(length_in,opspec,outpoNo)
%
% DESCRIPTION:
% ============
% 
% INPUT ARGUMENTS:
% ================
% - length_in : integer
%               length of the input signal of the demux block
% - opspec :    integer vector or scalar, no default
%               value of output specification (as shown in dialog..)
%
% - outpoNo : integer
%             outport number 
%
%
% RETURN VALUES:
% ==============
% index_range:  array with two element, are the start and end index of the
% given port.
% EXAMPLE(S):
% ===========
%
% >> 
%
%
% See also: mes_getMuxDemuxBusStruct
%
% *************************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:10CEST $
% Version:    $Rev: 1156 $
% *************************************************************************
%
%% Private Doc
% -------------------------------------------------------------
% Author: Yongke Yu  (yongke.yu@model-engineers.com, jsa)
% $Id: mes_getDemuxOutportIndex.m 1.1 2020/07/31 16:10:10CEST Vojnic-Hajduk, Vladimir (vladvojn) Exp  $
% -------------------------------------------------------------------------
%
% MES-TAGS: (newest on top)
% =========
%
% -------------------------------------------------------------------------
% Used by: mes_findScrBlock
%
% -------------------------------------------------------------------------
% TODOS:
% -------------------------------------------------------------------------
% REVISION HISTORY: (newest on top)
% =================
% 2010/10/20: set default value for length_in (0)
% 2010-07-02: correct the error of the return value in case the input
% length equals the opspec, the return value should have 2 elements.
% 2010-02/12 (jsa): moved from mes_checks/SDT to mes_utils
%                   added: docu, help
% 2010-01-xx (yyu): created

function [index_range,errmsg]=mes_getDemuxOutportIndex(length_in,opspec,outpoNo)
















































































