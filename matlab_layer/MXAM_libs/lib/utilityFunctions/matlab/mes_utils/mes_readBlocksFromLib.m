% Return the block type and masktype of all blocks of all the given libs
%
% SYNTAX:
% =======
% function res = mes_readBlocksFromLib(cs_libNames)
%
% INPUT ARGUMENTS:
% ================
% cs_libNames:  cell array 
%               Name of libs
% b_closLib:    boolean (default = true)
%               If true, the lib which is not opened befor the calling of 
%               this function will be loaded in the process and be closed 
%               after the process, if false, the loaded libs will not be 
%               closed. 
% 
% d_searchDepth: define the search depth, default is 0 for all depth.
%
% b_uniqueBlockMasktype: if true, the block and mask type of a block will
% be formed in a format as 'blocktype:<blocktype> masktype:<masktype>' and
% be uniqued and then saved in res, default is false.
% RETURN VALUES:
% ==============
% The returned variable res is a cell array with the same dimension as
% 'cs_libNames', every element of res is then a cell array with two elements
% coresponding to block type and masktype
% Ex: cs_libNames={'lib1','lib2'}
% res{1}={{'blocktype1' 'masktype1'};
%         {'blocktype2' 'masktype2'};
%         ...;
%        }
% res{2}={{'blocktype1' 'masktype1'};
%         {'blocktype2' 'masktype2'};
%         ...;
%        }
% if b_uniqueBlockMasktype is true
% res{1}={'blocktype:blocktype1 masktype:masktype1',
%         'blocktype:blocktype2 masktype:masktype2',
%         ...
%        }
% res{2}={'blocktype:blocktype1 masktype:masktype1',
%         'blocktype:blocktype2 masktype:masktype2',
%         ...
%        }
% if the second return variable exists, it is then the unique mask type of
% every Lib.
% masktype{1}={'masktype1','masktype2',...};
% masktype{2}={'masktype1','masktype2',...};
% Note: if one or more block has no masktype, then one of the item in return value
% masktype will be empty, such as:  masktype{1}={'','masktype2',...}
% 
% EXAMPLE(S):
% ===========
% res = mes_readBlocksFromLib({'lib1','c:\\lib2'})
% [res,masktype]=mes_readBlocksFromLib({'lib1','c:\\lib2'},false,0,true);
% 
% Result of following calling is shown below (only part of the return value
% is shown)
% res=mes_readBlocksFromLib('tllib',1,1);
% res = 
%     {1x58 cell}
% 
% res{1}{1}
% ans = 
% 
%     'Inport'    'TL_Inport'
% 
% res{1}{2}
% ans = 
% 
%     'Inport'    'TL_BusInport'
%  ...
%
% Result of following calling is shown below (only part of the return value
% is shown)
% [res,masktype]=mes_readBlocksFromLib({'simulink_extras','tllib'},false,0,1);
% res{1}'
% ans = 
% 
%     'Blocktype:Bias Masktype:'
%     'Blocktype:CombinatorialLogic Masktype:'
%     'Blocktype:Constant Masktype:'
%     'Blocktype:DataTypeConversion Masktype:'
%     'Blocktype:Demux Masktype:'
%  ...
% res{2}'
% ans = 
% 
%     'Blocktype:Abs Masktype:TL_Abs'
%     'Blocktype:Assignment Masktype:TL_Assignment'
%     'Blocktype:CombinatorialLogic Masktype:'
%     'Blocktype:Constant Masktype:'
%     ...
% masktype{1}'
% ans = 
% 
%     ''
%     'Auto Correlator'
%     'Averaging Power Spectral Density'
%     'Averaging Spectrum Analyzer'
%     'Cart2Polar'
%     ...
% masktype{2}'
% ans = 
% 
%     ''
%     'MIL Subsystem'
%     'TL_AUTOSAR_BLOCKS'
%     'TL_Abs'
%     'TL_AddFile'
%     'TL_Assignment'
%     'TL_BusInport'  
%     ...
% *************************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:25CEST $
% Revision:   $Rev: 7191 $
% *************************************************************************

function varargout = mes_readBlocksFromLib(cs_libNames,b_closeLib,d_searchDepth,b_uniqueBlockMasktype)
















































































































