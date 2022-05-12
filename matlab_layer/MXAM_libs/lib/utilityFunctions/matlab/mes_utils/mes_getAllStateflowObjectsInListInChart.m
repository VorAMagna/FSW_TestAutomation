% Function to get all Stateflow objects of a chart
% 
% This function provides the data structure of a the current chart in two
% ways:
% 1. A struct, which represents the flat structure of the chart and contains 
%    lists, one list for every type of object in the chart (i.e state, 
%    transition, junction, box etc). These lists contain several properties 
%    of the objects and also a path, where the object can be found in the 
%    hierarchical list (see 2.). For detailed structure see OUTPUT.
% 2. A struct, which represents the hierarchical structure of the chart,
%    the type (state, transition etc.) and a listindex, is a unique identifier
%    such that the object can be found in the flat structure (see 1.). For
%    detailed structure see OUTPUT.
% 
% 
% [chart,chart_struct] = mes_getAllStateflowObjectsInListInChart(h_curChart)	
% 
% OUTPUT:
% =======
% chart - struct with one list for each type of objects in current chart
%         with the following structure
%         .Id      
%         .handle
%         .decomposition 
%         .box 
%             .id
%             .name
%             .handle
%             .path
%             .level
%                 .boxLevel
%                 .stateLevel
%                 .subchartlevel
%         .transition 
%             .id
%             .handle
%             .transitionLabel
%                 .condition
%                 .conditionAction
%                 .transitionAction
%                 .comment
%             .source
%                 .id
%                 .handle
%                 .type(state, junction, empty)
%             .destination
%                 .id
%                 .handle
%                 .type(state, junction)
%             .executionOrder
%             .path
%             .level
%                 .boxLevel
%                 .stateLevel
%                 .subchartlevel
%         .defaultTransition
%             .id
%             .handle
%             .destination
%                 .id
%                 .handle
%                 .type(state,junction)
%             .transitionLabel
%                 .condition
%                 .conditionAction
%                 .transitionAction
%                 .comment
%             .executionOrder
%             .path
%             .level
%                 .boxLevel
%                 .stateLevel
%                 .subchartlevel
%         .state 
%             .id
%             .name
%             .handle
%             .decomposition
%             .position
%             .isSubchart
%             .stateLabel
%                 .duringAction
%                 .entryAction
%                 .onEvent
%                 .exitAction
%                 .bindAction
%             .sourcedTransition
%                 .id
%                 .handle
%                 .transitionLabel
%                 .executionOrder
%             .sinkedTransition 
%                 .id
%                 .handle
%                 .transitionLabel
%                 .executionOrder
%             .path
%             .level
%                 .boxLevel
%                 .stateLevel
%                 .subchartlevel
%         .junction
%             .id
%             .type
%             .handle
%             .position
%                 .center
%                 .radius
%             .sourcedTransition
%                 .id
%                 .handle
%                 .transitionLabel
%                 .executionOrder
%             .sinkedTransition
%                 .id
%                 .handle
%                 .transitionLabel
%                 .executionOrder
%             .path
%             .level
%                 .boxLevel
%                 .stateLevel
%                 .subchartlevel
%         .truthTable
%             .id
%             .name
%             .path
%             .level
%                 .boxLevel
%                 .stateLevel
%                 .subchartlevel
%         .mlFunc
%             .id
%             .name
%             .path
%             .level
%                 .boxLevel
%                 .stateLevel
%                 .subchartlevel
%         .sfFunc
%             .id
%             .name
%             .path
%             .level
%                 .boxLevel
%                 .stateLevel
%                 .subchartlevel
%         .slFunc
%             .name
%             .path
%             .level
%                 .boxLevel
%                 .stateLevel
%                 .subchartlevel
%         .note
%             .id
%             .text
%             .path
%             .level
%                 .boxLevel
%                 .stateLevel
%                 .subchartlevel
%
% chart_struct - struct with hierarchical structure of the current chart
%         .id
%         .handle
%         .elements (struct)
%
%         elements is a struct of all objects which are contained in the 
%         current level:
%         .box
%             .id
%             .type
%             .handle
%             .listindex
%             .elements
%         .transition
%             .id
%             .type
%             .handle
%             .listindex
%         .defaultTransition
%             .id
%             .type
%             .handle
%             .listindex
%         .state
%             .id
%             .type
%             .handle
%             .listindex
%             .elements    
%         .truthTable
%             .id
%             .type
%             .handle
%             .listindex
%             .elements
%         .mlFunc
%             .id
%             .type
%             .handle
%             .listindex
%             .elements
%         .sfFunc
%             .id
%             .type
%             .handle
%             .listindex
%             .elements
%         .slFunc
%             .handle
%             .type
%             .name
%             .listindex
%             .elements
%         .note
%             .id
%             .type
%             .handle
%             .listindex
%
% INPUT:
% ======
% h_curChart - struct with considered chart/subchart
% Use h_curChart = mes_getCharts(gcs)
%
% EXAMPLE:
% ========
% >> [chart,chart_struct]=mes_getAllStateflowObjectsInListInChart(a);
% chart = 
% 
%                    id: 18
%                handle: [1x1 Stateflow.Chart]
%         decomposition: 'EXCLUSIVE_OR'
%                  path: 'chart_struct'
%                 level: [1x1 struct]
%                   box: [1x2 struct]
%            transition: [1x15 struct]
%     defaultTransition: [1x3 struct]
%                 state: [1x6 struct]
%              junction: [1x11 struct]
%            truthTable: [1x1 struct]
%                mlFunc: [1x1 struct]
%                slFunc: [1x1 struct]
%                sfFunc: [1x1 struct]
%                  note: [1x2 struct]
% 
% 
% >> chart_struct = 
% 
%           id: 18
%     elements: [1x1 struct]
% 
% >> chart.box(1)
% 
% ans = 
% 
%         id: 26
%       name: 'BOX'
%     handle: [1x1 Stateflow.Box]
%       path: 'chart_struct.elements.box(1)'
%      level: [1x1 struct]
%
% >> chart_struct.elements
% 
% ans = 
% 
%                   box: [1x1 struct]
%            transition: [1x7 struct]
%     defaultTransition: [1x3 struct]
%                 state: [1x2 struct]
%            truthTable: [1x1 struct]
%                mlFunc: [1x1 struct]
%                sfFunc: [1x1 struct]
%                slFunc: [1x1 struct]
%                  note: [1x1 struct]
% 
% See also: mes_getCharts
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:07CEST $
% Version:      $Rev: 15130 $
% ***********************************************************

function [chart,chart_struct]=mes_getAllStateflowObjectsInListInChart(h_curChart)












































































































































































































































































































































































































































































































































