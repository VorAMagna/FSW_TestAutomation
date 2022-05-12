% ch_objects=mes_findStateflowObjectsInChartInCurPath(h_curChart,ch_objects,cs_identifier,b_extractBoxContent)
% 
% returns cell array of structs, where each struct contains stateflow
% elemts in the given path of chart h_curChart 
%
% INPUT:
% h_curChart:    struct,  struct of considered chart/subchart
% s_path:        string,  path of current chart/subchart
% ch_objects:    cell array of structs, contains structs of stateflow
%                         elements which should be sampled.
% cs_identifier: cell array of strings, contains identifiers corresponding
%                         to elements in ch_objects
% b_extractBoxContent: boolean, if true, the contents of a box will be
% returned as objects in h_curChart
% b_findObjsInDeeperPath:boolean, if true, all objects under the current
% path will be returned.
% OUTPUT:
% ch_objects:   cell array of structs,  each struct contains all elements
%                         of one specified stateflow objects in 
%                         chart/subchart h_curChart
%
% EXAMPLE:
% ch_objects=mes_findStateflowObjectsInChart(h_curChart,{[],[]},{'Transition','State');
% Then: 
% ch_objects{1}
% ans=
%       Stateflow.Transition n-by-1
%
% ch_objects{2}
% ans
%       Stateflow.State m-by-1
%
% returns all Transitions and States in chart h_curChart at the given path. 
%
% NOTE:
% It is not necessary to start with an empty cell array of structs.
% It is possible to extend existing structs with this function by using it
% as an input, i.e. 
% ch_objects=mes_findStateflowObjectsInChart(h_curChart,s_path,{lh_trans},{'Transition');
% adds each transition in chart h_curChart to the struct lh_trans.
%
% 
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:05CEST $
% Version:      $Rev: 14843 $
% ***********************************************************

function ch_objects=mes_findStateflowObjectsInChartInCurPath(h_curChart,ch_objects,cs_identifier,b_extractBoxContent,b_findObjsInDeeperPath)



















































