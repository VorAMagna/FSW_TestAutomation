% [b_domatch,s_info,r_diff]=mes_compare(v1,v2,cs_fields,b_ignorecase,s_diffmessage)
%
% DESCRIPTION:
% ============
% compares two variables, 
% supported types: numbers, logicals, chars, cells, structs, function handles
%                  any other classes that can be compared with == operator
% returns true, if v1 and v2 are of identical class, dimension, and value
% returns false, if v1 and v2 are different or have an unsupported class
%
% ARGUMENTS:
% ==========
% r1,r2: structs to be compared, 
% cs_fields: cell array of strings with toplevel struct field names which shall be compared
%            note: other fields are ignored and not returned in r_diff
%            default: empty (compare all fields in r1 and r2)
%            note2: nested fields (e.g. 'fieldx.nestedfieldy') are not supported
% b_ignorecase (default=false): if true, string match is case-insensitive
%              if true, and r1 and r2 are nonempty and matching, then the
%              value of r1 is returned
% s_diffmessage (default: '(different content)' ): message to be returned in case of
%       different values
% b_returnbothvariants: if true, differing nonempty value will be returned in
%                       r_diff.(fieldname) as a cell with two elements
%                       if false (default), r_diff.(fieldname) is set to s_diffmessage 
%
% RETURN VARIABLES:
% =================
% b_domatch: true, if v1 and v2 are equal
%            false, if v1 and v2 differ or have an unsupported class
% s_info: string, contains message on reason for classification, 
%         is empty, if v1 and v2 are equal 
% r_diff: struct with the elements that differ, according to the following rules:
%    - if a field exists only in v1 or in v2, the existing value is written to r_diff.<fieldname>
%    - if a field exists in both v1 and v2 then
%       - if the field values are different and non-empty in both v1 and v2, then
%           if b_returnbothvariants is true
%              r_diff.<fieldname> is set to argument s_diffmessage if
%           else r_diff.<fieldname> is set to a cell{2} with both variants 
%       - if the field is empty in v1 or in v2, the nonempty value is written to r_diff.<fieldname>
%       - if the field is empty in both v1 and v2, '' is written to r_diff.<fieldname>
%    - if a field given in argument cs_fields exists neither in v1 or in v2, it is not
%        written to r_diff
%    note: if v1 and v2 are identical, r_diff does contain no fields
%
% EXAMPLE:
% % ========
% r1=struct();
% r2=struct();
% r1.i=1;
% r1.s='x';
% r1.cs={'x','y'};
% r2=r1;
% r2.s='';
% 
% >> [isequal,s_info,r_diff]=mes_compare(r1,r2);
% isequal = 
%      0
% s_info = 
% different structs
% r_diff = 
%    s: 'x'
%
%
% used by: mes_periprocess
% uses: mes_shortErrorLocationString
% 
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:03CEST $
% Revision:   $Rev: 4293 $
% ****************************************************************
% ---------------------------------------------------------------
% Author: Jörg Sangals (joerg.sangals@model-engineers.com, jsa)
% $Id: mes_compare.m 1.1 2020/07/31 16:10:03CEST Vojnic-Hajduk, Vladimir (vladvojn) Exp  $
% ---------------------------------------------------------------
%
% REVISION HISTORY:
% =================
% TODO:    remove local funcs from mr1155,mr1158
% 2012/11/21 (jsa): redmine #RM2975- process returns subinfo of recursive call
%            - enhanced help on cs_fields constraints
% 2012/02/01 (jsa): added_ option to return both variants in r_diff
% 2011/11/14: added: also compares function handles
% 2011/10/24: created by jsa based on checks mr1155 / mr1158.m

function [b_domatch,s_info,r_diff]=mes_compare(v1,v2,cs_fields,b_ignorecase,s_diffmessage,b_returnbothvariants)
















































































































































































































































