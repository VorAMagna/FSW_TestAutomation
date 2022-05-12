% [lh_charts, lr_charts] = mes_getCharts(system,b_searchLinkChart,s_lookundermask,s_followlinks,b_SystemIsBlock,b_uniqueLib)
% [lr_charts] = mes_getCharts(lr_charts_in)
%
% DESCRIPTION:
% ============
% Finds charts of the given system and in linked libraries.
% Gets the object handles of all the charts residing in the given model or
% subsystem and optionally includes the charts that are linked to librarys
% (here, the returned objects of these charts point to their libraries, not
% to the instances in current system). If more than one instances of a library
% chart exist in the model, only one is returned. This function will load 
% a library if needed.
%
% INPUT ARGUMENTS:
% ================
% - system:            the name string or handle of the model or subsystem, in which the
%                      charts are to be searched
% - b_searchLinkChart: (boolean,default=false) if true, charts 
%                      that are linked to a library will be searched, too.
% - s_lookundermask:   (string) parameter passed to function find_system, 
%                      see find_system for details. If b_searchLinkChart is true, 
%                      the default value is 'all'. If b_searchLinkChart is false, this
%                      parameter is ignored.
% - s_followlinks:     (string) parameter passed to function find_system, 
%                      see find_system for details. If b_searchLinkChart is true, 
%                      the default value is 'on'. If b_searchLinkChart is false, this
%                      parameter is ignored.
% - b_SystemIsBlock:   (boolean, default= false) if true and if the system argument is
%                       a chart block, than the sf obj of this block is returned
% - b_uniqueLib:       (boolean,default=true) if true and if more than one chart block in <system>
%                      refers to the same lib block, then only one lib chart is returned,
%                      otherwise, all charts with localPath will be
%                      returned                      
% - lr_charts_in       array of struct with fields .ChartObject, .localPath
%                      If the function is called with this argument only, 
%                      any duplicate charts referring to the same chart object (in a lib)
%                      will be removed from the returned variable lr_charts_out
%
% RETURN VALUES:
% ==============
% - lh_charts: n x 1 array of stateflow chart object handles
% - lr_charts: 1 x n struct array with fields:
%                  .ChartObject: stateflow chart object handle
%                  .localPath: the chart block path in the current model.
% EXAMPLES:
% =========
% lh_charts = mes_getCharts(gcs);
%   get charts of current subsystem without linked charts
%
% [lh_charts,lr_charts] = mes_getCharts(gcs,true); 
%   get all charts of current subsystem, include charts with active link
%   and charts residing in a block that is linked to library.
%   This is same as call by mes_getCharts(gcs,true,'all','on').
%
% [lh_charts,lr_charts] = mes_getCharts(gcs,true,'all','off');
%   get all charts of current subsystem, include charts with active link, 
%   but do not include charts residing in a block that is linked to library.
%
% [lh_charts,lr_charts] = mes_getCharts(gcs,true,'none','on');
%   get all charts of current subsystem, include charts with active link and
%   charts residing in a non-masked block and charts which are linked to a library.
%
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:09CEST $
% Revision:   $Rev: 7255 $
% ****************************************************************

function [lh_charts, lr_charts]= mes_getCharts(system,b_searchLinkChart,s_lookundermask,s_followlinks,b_SystemIsBlock,b_uniqueLib)






































































































































































































































