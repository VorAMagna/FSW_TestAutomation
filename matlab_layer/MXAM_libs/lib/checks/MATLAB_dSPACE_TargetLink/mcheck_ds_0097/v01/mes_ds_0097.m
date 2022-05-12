% MES check: ds_0097 - Data Types for Signal Busses at the TargetLink-Simulink Interface
%
% function [result,cr_items,r_stats] = mes_ds_0097(system, cmd_s)
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
% ds_0097 - Data Types for Signal Busses at the TargetLink-Simulink Interface
%
% Bus signals crossing the border from a TargetLink Subsystem to Simulink
% are always of the double data type during a SiL simulation.
% Hence, if succeeding blocks require other data types, Data Type Conversion
% blocks have to be inserted to perform the required typecast.
%
% Busses leading out of a TargetLink subsystem are supported since
% TargetLink 2.1. However, the TargetLink generated S-function for
% a software-in-the-loop simulation outputs double signals within
% busses exclusively.
%
% PASS/FAIL CRITERIA:
% ==============
% This check searches for all Simulink Outports, which are driven by a bus,
% within the TargetLink top-level subsystem. The latter is the interface to
% Simulink. Note that so-called "pseudo" busses are ignored for this check.
% Such pseudo-busses are improperly used (e.g. fed directly into a block
% without splitting up the bus beforehand).
% For every bus leading out of the TargetLink top-level subsystem which
% does not connected with a data type conversion block but to a sl block
% which requires a data type other than double, a fail will be given.
%
% NOTE:
% =====
% 1.) This check requires a TargetLink installation!
% 2.) Since TargetLink simulates the Simulink Inports at the top-level
%     subsystem with an internal S-Function, the user is directed to an
%     interleaving subsystem, when pressing the Show "button" in the
%     Browser.
% 3.) This check requires the model to be in COMPILE MODE!
% 4.) In tl 2.x, can not build a test case for fail, since if the block
%     that connect with the busoutport has a data type other than double,
%     the model can not be compile, and compile mode is required by this
%     check. In tl3.x, the limition is removed, then a test case can be
%     made.
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:26CEST $
% Revision:     $Rev: 15126 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0097(system, cmd_s) %#ok<INUSD>




























































































































































