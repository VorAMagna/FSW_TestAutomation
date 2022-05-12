% MES check: tl_pr20070704_01 - Wrong code is generated for a Targetlink Rate Limiter
% block if the product of slew rate scaling and sample time is whole-numbered
%
% function [result,cr_items,r_stats] = mes_tl_pr20070704_01(system, cmd_s)
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
% tl_pr20070704_01 - Wrong code is generated for a TargetLink Rate Limiter block if the
% product of slew rate scaling and sample time is whole-numbered
%
% If a non-default variable class is selected for the slew rates of a Rate Limiter block,
% a scaling has to be given for them. The generated code produces wrong results,
% if the term ((slew rate lsb * sample time) / output lsb) is whole-numbered
%
% Example:
% Slew rate has arbitrary scaling = 100,
% Sample time = 0.01. and output lsb of the rate limiter =1
% calculate k with :
%    k =slew rate lsb *sample_time/output_lsb
%    k = 100*0.01/1=1 is whole-numbered -> fail
%
% APPLIES TO
% all tl_rate limiter blocks with a non-default variable class
%
% PASS/FAIL CRITERIA:
% ================
% blocks fail if round(sample_time*LSB/output_lsb) == sample_time*LSB/output_lsb
%
% FIX ACTION:
% ===========
% none, it is suggested to sightly change the values for sample_time or
%
% ****************************************************************
% Copyright: Model Engineering Solutions
% Date:      $Date: 2020/07/31 16:05:39CEST $
% Revision:  $Rev: 6115 $
% Author:    Jörg Sangals (joerg.sangals@model-engineers.com, jsa)
% ****************************************************************

function [result,cr_items,r_stats] = mes_tl_pr20070704_01(system, cmd_s) %#ok<INUSD>



























































































































































































