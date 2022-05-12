% MES check: tl_pr20080215_03 - Interface variable of incremental subsystem
% may be eleminated in surrounding system.
%
% function [result,cr_items,r_stats] = mes_tl_pr20080215_03(system, cmd_s)
%
% RETURN PARAMETERS:
% ==================
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
%
% INPUT PARAMETERS:
% =================
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>, for details See also mes_jc_0061
%
% MES CHECK:
% ==========
% tl_pr20080215_03- An interface variable of a subsystem where incremental
% code generation is activated may be removed by optimization in the
% surrounding context. This may occur if the interface variable is not a
% function parameter and is not used outside the incremental subsystem.
% In this case wrong data is written to the Data Dictionary.
%
% Fix: none
% Workaround:
% There are different workarounds possible:
% 1) Use code variants:
% - non-ERASABLE variable classes for all potential interface variables
% when generating the surrounding system,
% - ordinary variable classes when generating the incremental subsystem
% 2) Make all potential interface variables non?ERASABLE
% 3) Use Optimization Level 0
%
% PASS/FAIL CRITERIA:
% ================
% in a subsystem where incremental code generation is activated, if the
% variable class of a TL port(TL outport, TL bus outport)
% is not non-Erasable (e.g. default, or 'erasable' is on in the property
% Optimization of a class) and not a function parameter class(scope of
% class is one of 'ref_param','value_param' and 'fcn_return'), system will
% get a FAIL. If the TL port is connected directly or indirectly with a
% terminator, an additional info will be given.
%
% FIX ACTION:
% ===========
% NONE, must be manually corrected
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% version:      $Rev: 6115 $
%               $Date: 2020/07/31 16:05:41CEST $
% ***********************************************************

function [result,cr_items,r_stats] = mes_tl_pr20080215_03(system, cmd_s) %#ok<INUSD>







































































































































































































































































































































































































































































