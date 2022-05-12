% remaps numeric values of struct r_in
% if a value is between 1..length(mappingtable)
% it is changed to mappingtable(value)
% if element of r_in is itself a struct, the function 
% will recursively remap this sub struct
% special case:  if r_in is numeric, the remapping is applied
%                to this number.
% searches struct r_s1 for values equal to val
% and replaces these values with the values of the corresponding
% fields of r_s2
% works also for nested strucs (here, the function is called recursively)
% r_out: type : same as r_in
%        values: copy of r_in, except for all numeric elements
%                which are >0 and <= lengtb(mapping). These are
%                replaced by mapping(r_in.<element>)
%
% - used by mes_preprocess
% revision history:
% 2009/09/14: created by jsa

function r_out=mes_remapstruct(r_in,mapping)




































