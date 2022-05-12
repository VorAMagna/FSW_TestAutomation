% cr_warnings = mes_reportNonlinTransitions(cr_warnings,id_nonlin,h_curChart,lh_trans)
% 
% returns warnings for each chart/subchart which contains nonlinear 
% transitions. 
% Reason: Because there are only three points given for each transition, it
% is not possible to determine any crossing or overlapping with other
% stateflow objects for sure.
%
% INPUT:
% cr_warnings: struct,  struct with reviews
% id_nonlin:   matrix,  ids of nonlinear transitions (first column)
%                       difference of slopes (second column)
% h_curChart:  struct,  struct of considered chart/subchart
% lh_trans:    struct,  struct of all transitions in this chart/subchart
%                       (it would be sufficient, if lh_trans contains only 
%                       the nonlinear transitions)   
% tol:         numeric, tolerance to detect diagonal transitions
%
% OUTPUT:
% cr_warnings:  struct,  extended cr_warnings
% 
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:27CEST $
% Version:      $Rev: 5620 $
% ***********************************************************

function cr_warnings = mes_reportNonlinTransitions(cr_warnings,id_nonlin,h_curChart,lh_trans,tol)











































