% ch_objects=mes_findStateflowObjectsInChart(h_curChart,s_path,ch_objects,cs_identifier,b_returnObjInSubchart)
% 
% returns cell array of structs, where each struct contains stateflow
% elemts in chart/subchart h_curChart
%
% INPUT:
% h_curChart:    struct,  struct of considered chart/subchart
% s_path:        string,  path of current chart/subchart
% ch_objects:    cell array of structs, contains structs of stateflow
%                         elements which should be sampled.
% cs_identifier: cell array of strings, contains identifiers corresponding
%                         to elements in ch_objects
% b_returnObjInSubchart(option), default is false, if true, return also the
%                objects in subchart states
% OUTPUT:
% ch_objects:   cell array of structs,  each struct contains all elements
%                         of one specified stateflow objects in 
%                         chart/subchart h_curChart
%
% EXAMPLE:
% ch_objects=mes_findStateflowObjectsInChart(h_curChart,s_path,{[],[]},{'Transition','State');
% Then: 
% ch_objects{1}
% ans=
%       Stateflow.Transition n-by-1
%
% ch_objects{2}
% ans
%       Stateflow.State m-by-1
%
% returns all Transitions and States in chart h_curChart, but not in any 
% subchart, which is in h_curChart. If b_returnObjInSubchart is true, also
% reutrn objs in subchart states.
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
% Version:      $Rev: 7374 $
% ***********************************************************

function ch_objects=mes_findStateflowObjectsInChart(h_curChart,s_path,ch_objects,cs_identifier,varargin)













































