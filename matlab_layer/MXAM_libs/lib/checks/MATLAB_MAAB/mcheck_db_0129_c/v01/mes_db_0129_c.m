%% Stateflow transition appearance: Associated labels
%
% [result,cr_items,r_stats] = mes_db_0129_c(system, cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistic s on the check result
% for details use 'open mes_check_info'
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>,
% for details use 'open mes_check_info'
%
% REFERENCED GUIDELINE:
% =====================
% Control Algorithm Modeling Using Matlab,Simulink, and Stateflow
% Version 3.0
% MathWorks Automotive Advisory Board (MAAB)
% Guideline Rule ID: db_0129 (8.1.2.)
%
% DESCRIPTION:
% ============
% Transition labels can be visually associated to the corresponding 
% transition.
%
% PASS/FAIL CRITERIA:
% ===================
% A transitions receives a fail, if its label is too far away (maximal 
% distance is given by parameter db_0129_c.MaxDistBetweenTransitionAndLabel)
%
% SOLUTION:
% =========
% Redraw the transitions in failed charts such that they do not cross any
% stateflow object. 
%
% FIX OPERATION:
% ==============
% No automatic fix available.
%
% CHECK PARAMETERS:
% =================
% MAAB.db_0129_c.MaxDistBetweenTransitionAndLabel: 
%   DATATYPE: 
%       integer
%   DEFAULT VALUE:
%       10 (Unit is pixel)
%   DESCRIPTION:
%       Maximal allowed distance between transitions and its label. At the 
%       same time it is the minimal distance between a transition and the 
%       label of another transition. 
%
% NOTE:
% =====
% - Since the distance between transition and parallel edges of the virtual
%   box around the transition label is computed, it is possible, that a
%   label with lot of characters receives a fail. Reason is, that the
%   parallel edges are too far away, even if some characters of the label
%   are close to the transition (might even cross). 
% 
% - Since there are only 3 Points for transitions, only linear transitions are 
%   treated (for each other type, a correct analyse could not be guaranteed). 
%   User is informed, if nonlinear transitions are used. 
% 
% - It is only possible to compute a distance between horizontal or
%   vertical transitions and their labels. Therefore, diagonal signal would
%   always receive a fail. So they are ignored by this check. Im
%   combination with the note above that results in: Only horizontal and
%   vertical signal lines are checked. Diagonal signal lines will receive a
%   warning. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:21CEST $
% Revision:     $Rev: 6829 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_db_0129_c(system, cmd_s)











































