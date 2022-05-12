%function lr_relops=mes_getSFRelOps(s_expr,relation_ops)
%finds relational operations in the string s_expr that include the
%operators included in relation_ops
%input argument s_expr: string with expression(s)
%return value:
%lr_relops: list of structs with relational operations.
%the struct has the following string fields:
%lr_relops(i).left_part: left part of the ith relational operation
%lr_relops(i).left_part_type: type of left part
%lr_relops(i).left_part_err: error message if left part could not be parsed
%                            or empty if no error occured
%lr_relops(i).op: operator
%lr_relops(i).right_part:right part
%lr_relops(i).right_part_type: type of right part
%lr_relops(i).right_part_err: error message if part could not be parsed
%                             or empty if no error occured
% default recognized relational operations: {'~=','==','<=','>=','>','<'},
% can be given by parameter relation_ops.
% Note: relational operations: 'eq','ne','lt','gt','le','ge', '!=' are not valid in
%      Stateflow, so they are not considered.
%
%Version: $Rev: 6311 $%
%Date: $Date: 2020/07/31 16:10:12CEST $%
%Author: yongke.yu@model-engineers.com

function lr_relops=mes_getSFRelOps(s_expr,relation_ops,h_chart)



















































































