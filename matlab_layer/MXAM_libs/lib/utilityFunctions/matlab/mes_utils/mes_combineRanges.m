% function r_range = mes_combineRanges(r_range1,s_operation,r_range2)
%
% DESCRIPTION:
% ============
% Computes the range of an arithmetic binary operation.
%
% INPUT PARAMETERS:
% =================
% - r_range1:    structure with numeric range of first operand
%                r_range1.min : minimum of first operand (double)
%                r_range1.max : maximium of first operand (double)
%                r_range1.b_overflow: optional overflow flag of first operand
%                                     default: false
% - s_operation: string with operator: {'+','-','*','/','^'}
% - r_range2:    structure with numeric range of second operand
%                r_range2.min : minimum of second operand (double)
%                r_range2.max : maximium of second operand (double)
%                r_range2.b_overflow: optional overflow flag of second operand
%                                     default: false
%
% RETURN VALUES:
% ==============
% - r_range: structure with range of the expression 'operand1 s_operation operand2'
%            r_range.min: minimum of the expression 'operand1 s_operation operand2'
%                         or NaN if operand s_operation is not supported
%            r_range.max: maximum of the expression 'operand1 s_operation operand2'
%                         or NaN if operand s_operation is not supported
%            r_range.b_overflow: true if
%                                a) the combined minimum or maximum can't be
%                                   represented as a double variable. In this case
%                                   r_range.min or r_range.max will be saturated to
%                                   (-) realmax('double')
%                             or b) if r_range1.b_overflow or r_range2.b_overflow is true
%
% NOTES:
% ======
%  - Support for the exponential operator '^' is restricted to non-negative
%    whole-numbered constant exponents, i.e. r_range2.min = r_range2.max, with r_range2.min = {0,1,..}
%    using the operator '^' with other r_range2-ranges returns
%    r.min = -realmax('double'), r.max = realmax('double'), b_overflow = 1.
%  - It is assumed that the values of the operands vary independently,
%    e.g. if operands 1 and 2 refer to the same variable (e.g. in 'x+x')
%    the result of mes_combineRanges(min(x),max(x),'+',min(x),max(x))
%    would be wrong because the function does not know that the ranges of
%    the left-hand and right-hand operands are linked.
%  - The min, max and overflow-flag of either operand may also be specified
%    directly by calling mes_combineRanges(min1,max1{,overflow1},s_operation,min2,max2{,overflo w2}).
%
% EXAMPLES:
% =========
%  a.min=1; a.max=10;
%  b.min=2; b.max=20;
%  mes_combineRanges(a,'-',b)
%  ans =
%    min: -19
%    max: 8
%    b_overflow: 0
%
%  mes_combineRanges(-1,2,'^',2,2)
%  ans =
%    min: 0
%    max: 4
%    b_overflow: 0
%
%  mes_combineRanges(0,realmax,'+',0,eps(realmax))
%  ans =
%    min: 0
%    max: 1.7977e+308
%    b_overflow: 1
%
%
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:03CEST $
% Revision:   $Rev: 5420 $
% ****************************************************************

function [r_range]=mes_combineRanges(varargin)










































































































































































































































































































































































