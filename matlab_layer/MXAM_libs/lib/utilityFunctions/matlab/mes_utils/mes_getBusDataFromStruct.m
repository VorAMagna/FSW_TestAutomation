% [dInfo,errmsg] = mes_getBusDataFromStruct(dInfo, hBlock/ID)
% Description: 
% To get the bus structure from TargetLink block, handle of the block should given as input. 
% To get the bus structure of a Chart object, ID of the chart object of a TargetLink block should be given as Input.
%
% Input:
% dInfo: Structure as defined by the utils 'mes_getOutputDataInfo' or 'mes_getOutputdataInfoOfTLBlock'. 
%        Refer help of these util functions to know the structure.
% hBlock: handle of the block, from which the bus structure has to be extracted.
% ID: Object ID of a Stateflow variable of a chart.
%
% Output:
% dInfo: Input structure is returned with updated fields 'dInfo.busdata', 'dInfo.isbus' and 'dInfo.basetype'
% errmsg: Messages which says, what went wrong and why could not the bus structure be extracted from the block
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright: Model Engineering Solutions
% Version:   $Rev:  $
% Date:      $Date: 2020/07/31 16:10:09CEST $
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [dInfo,errmsg] = mes_getBusDataFromStruct(dInfo, hBlock)












































