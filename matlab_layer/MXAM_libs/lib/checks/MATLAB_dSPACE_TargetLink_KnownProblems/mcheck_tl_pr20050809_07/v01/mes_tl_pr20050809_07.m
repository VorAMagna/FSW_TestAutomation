% MES check: tl_pr20050809_07 - Nonpersistent variable in multirate
% production code block
% 
% function [result,cr_items,r_stats] = mes_tl_pr20050809_07(system, cmd_s)
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
% tl_pr20050809_07 - Nonpersistent variable in multirate production code
%
% You may specify a local variable although a persistent (i.e. at least static local) variable is required.
% TargetLink does not detect this situation and incorrect production code is generated. This error may
% occur if all of the following conditions are fulfilled:
% - RTOS code generation is activated
% - all systems inputs and outputs are mapped to FCN_ARG and FCN_REF_ARG variable classes via
% template
% - at least two subsystem are directly executed by the same task (e.g. by assigning the task via a
% Task block)
% - one of the systems is a direct or indirect child system of the other
% - the input/output of one of the systems has a variable class which has the 'ArgClass' property set
% to a variable class with scope local and no Static storage.
% The variable generated due the 'ArgClass' property must be in some cases at
% least static local to obtain correct production code.
%
% PASS/FAIL CRITERIA:
% ================
% The check fails when all the following conditions are fulfilled:
% - Req_0001	Check	TL Version	Check wird nur ausgeführt, wenn die verwendete TL Version eine der folgenden ist:
%   '2.1','2.1.5','2.1.6','2.2','2.2.1','2.3','3.0','3.1','3.2','3.3',,'3.4','3.5','4.0'
% - Cond_0001:	TL Main Dialog	"RTOS code generation" (rtos.enablemultirate)
%  (TL Main Dialog/RTOS/Enable multirate code generation)"	activated
% - Cond_0002:	ALLE TL_Inport, TL_Outport:	var class = default
%  (ist gemappt auf ein  DD VariableClassTemplate mit folgenden Eigenschaften: 
%   FilterVariableClassSpec = 'SLGlobal' ||'SLGlobalInit'   ||'SLFcnInput' || 'SLFcnOutput'
%   SettinigsVariableClass = 'FCN_ARG' oder 'FCN_REF_ARG' bzw class mit
%   Scope 'value_param' oder _ref_param')
% - Cond_0003:	Subsysteme (Path des Blocks) verwenden die gleiche Task
%   über einen Task Block
% - Cond_0004: Subsysteme, die die gleiche Task verwenden sind direkt oder indirekt
%   ineinander verschachtelt
% - TL Inports und Outports der Subsysteme aus Cond_0004: Variable Class des variable class
%   Templates definiert eine ArgClass mit local scope und not static storage
%
% FIX ACTION:
% ===========
% NOT AVAILABLE YET.
%
% ***********************************************************
% copyright:    Model Engineering Solutions
% version:      $Id: mes_tl_pr20050809_07.m 1.1 2020/07/31 16:05:37CEST Vojnic-Hajduk, Vladimir (vladvojn) Exp  $
% ***********************************************************

function [result,cr_items,r_stats] = mes_tl_pr20050809_07(system, cmd_s) %#ok<INUSD>




















































































































































































































































































































































