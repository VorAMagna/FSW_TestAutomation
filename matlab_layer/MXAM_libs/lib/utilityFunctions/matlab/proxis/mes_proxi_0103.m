%% Initialization parameter
%
% [result, cr_items, r_stats] = mes_proxi_0103(system, cmd_s, reg, s_regerr)
%
% SHORT DESCRIPTION:
% ==================
% Blocks that have an initialization parameter must define explicitly
% the initialization value.
%
% NOTE:
% =====
% Regarding a detailed documentaion of this proxi look into the
% documentation of the check, which calls this proxi.
%
% CALLED BY:
% ==========
% mes_DNDE_AEC_MS_005_01
% mes_misra_slsf_007
%
% Possible blocks with init value are following blocks with masktype or
% blocktyp:
% MaskTypeList = {'TL_DataStoreMemory','Detect Change','Detect Decrease',...
%         'Detect Increase','Detect Fall Negative','Detect Fall Nonpositive',...
%         'Detect Rise Nonnegative','Detect Rise Positive','Difference','Discrete Derivative',...
%         'TL_DiscreteStateSpace','Integer', 'Delay','TL_JKFlipFlop',...
%         'TL_Merge','TL_SRFlipFlop','Tapped Delay Line','First Order Transfer Fcn',...
%         'Transfer Fcn Real Zero'};  %srajput : TL_unitDelay was removed as it is covered in the BlockType list.
%
%     %srajput: List of corresponding property name from which the initial values can be retrieved.
%     MaskBlockInitList = {'InitialValue','vinit','vinit','vinit','vinit','vinit',...
%         'vinit','vinit','ICPrevInput','ICPrevScaledInput','X0',...
%         'vinit','initial_condition','InitialOutput','initial_condition','vinit',...
%         'ICPrevOutput','ICPrevInput'}; %srajput : X0 corresponding to the  TL_unitdelay is removed.
%
%     %srajput : List of block type which can have initial value.
%     BlockTypeList = {'UnitDelay','DiscreteTransferFcn','DiscreteFir','DiscreteFilter',...
%         'DiscreteIntegrator','Memory','RateTransition'};
%
%     % srajput: List of corresponding property name from which the initial values can be retrieved.
%     BlockInitList = {'X0','InitialStates','IC','InitialStates','InitialCondition','X0','X0'};
% % PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:41CEST $
% Revision:     $Rev: 14938 $
% *************************************************************************

function [result, cr_items, r_stats] = mes_proxi_0103(system, cmd_s, reg, s_regerr)
























































































































































































































































