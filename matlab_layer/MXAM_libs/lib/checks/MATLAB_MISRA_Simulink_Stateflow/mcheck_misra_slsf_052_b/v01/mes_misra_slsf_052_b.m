% MES check: misra_slsf_052_b - State Labelling - State Name and Data Items
%
% function [result,cr_items,r_stats]=mes_misra_slsf_052_b(system,cmd_s)
%
% GUIDELINE:
% ==========
% Reference:
%   MISRA AC SLSF Modelling design and style guidelines for the
%   application of simulink and stateflow, MIRA limited, May 2009,
%   Ver 1.0, www.misra.org.uk
%
% Guideline Rule ID:
%   MISRA AC SLSF 052
%
% Scope of implementation:
%   section B - Within a chart, a state must not be given the same name as
%   a data item.
%
% MES CHECK:
% ==========
% misra_slsf_052_b - State Labelling - State Name and Data Items
%
% Within a chart, a state must not be given the same name as a data item.
%
% Rationale:
% All objects should be uniquely named to avoid misinterpretation.
%
% PASS/FAIL CRITERIA:
% ===================
% The chart analyzes each Stateflow Chart.
% Failed: If a state name is the same as the name of a Stateflow data item (including events).
% The check result is passed if the failed case does not apply. 
%
% CHECK PARAMETERS:
% =================
%
% *************************************************************************
% Date:         $Date: 2020/07/31 16:04:43CEST $
% Revision:     $Rev: 6836 $
% *************************************************************************
% Test model and specification are in misra_slsf_052_b.mdl
% *************************************************************************
% author: Yongke Yu (yongke.yu@model-engineers.com)
% $Id: mes_misra_slsf_052_b.m 1.1 2020/07/31 16:04:43CEST Vojnic-Hajduk, Vladimir (vladvojn) Exp  $
% -------------------------------------------------------------------------
% revision history:
% 2017/01/13: created based on mes_misra_slsf_038_b
% -------------------------------------------------------------------------

function [result,cr_items,r_stats]=mes_misra_slsf_052_b(system,cmd_s) %#ok<INUSD>





















































































































