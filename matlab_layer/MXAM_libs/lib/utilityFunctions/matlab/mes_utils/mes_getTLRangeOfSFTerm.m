% returns value range of the stateflow Term s. 
% If available, the Targetlink description field is used to get 
% type and range of the involved variables
%
% SYNTAX
% ======
% r=getTLRangeOfSFTerm(hChart,s)
%
% INPUT ARGUMENTS
% ===============
% hChart: handle of stateflow chart object
% s: string with expression
%    with fields r1.min : minimum of first operand (double)
% s_childPath: string of a path, it can be the path of the function or
%  state in which the variable resides. Statefolow uses the variable
%  closest to the state or function.
% RETURN VALUE
% ============
% r: structure with range of the expression s
% r.min: minimum of the expression
%            or NaN if range could not be computed
% r.max: maximum of the expression
%            or NaN if range could not be computed
% r.b_overflow: true if the minimum or maximum can't be
%                    represented as a double variable. In this case
%                    r.min or r.max will be saturated to (-) realmax('double')
%
% NOTES
% =====
%  - support for the exponential operator '^' is restricted to non-negative
%      whole-numbered constant exponents, i.e. r2.min = r2.max, with r2.min = {0,1,..}
%      using the operator '^' with other r2-ranges returns
%      r.min=-realmax('double'), r.max=realmax('double'), b_overflow=1
%  - if variables appear repeatedly in the expression s
%    their range linkage is not considered.
%    E.g., the expression 'x*x' is treated as if the two instances
%    of x were different variables with independent varying values.
%    If x is of type int8, the range of 'x*x' is reported to be [-16256..16384] 
%               whereas it actually is [0..16384]
%
% EXAMPLES  
% ========
% >> mes_getTLRangeOfSFTerm(hChart,'a>b')
% ans = 
%     min: 0
%     max: 1
%     b_overflow: 0
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright: Model Engineering Solutions
% Revision:  $Rev: 7191 $
% Date:      $Date: 2020/07/31 16:10:13CEST $
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% See also: mes_combineRanges

function [r,s_err]=mes_getTLRangeOfSFTerm(hChart,s,s_childPath)









































































































































































































































































