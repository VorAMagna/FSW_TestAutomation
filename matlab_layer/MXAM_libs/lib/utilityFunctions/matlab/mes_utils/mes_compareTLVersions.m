%% compares used TL version with a list of TL versions
%
% [cr_warnings, cr_notes, b_postprocess] = mes_compareTLVersions(cr_warnings,cr_notes,s_curr_TLVersion,cs_concernedTLVersions)
%
% This function is calles by the TL_KnownProblems checks. It checks, if the
% used TL version applies to the corresponding TL error. 
%
% NOTE: 
% I a path is used, s_curr_TLVersion is something like 3.1p10. In this
% case, 'p10' is cutted an only the version '3.1' is compared with the
% list. 
%
% INPUT:
% cr_warnings, cr_notes:    structs, struct to samle error messages
% s_curr_TLVersion:         string, used TL version
% cs_concernedTLVersions    cell array of strings, array of TL versions
%
% OUTPUT:
% cr_warnings, cr_notes:    structs, struct to samle error messages
% b_postprocess:            boolean, default false. If TL version was
%                           found, but version is not a member of list, 
%                           b_postprocess is set to 'true' and the
%                           corresponding check will execute
%                           mes_postprocess and finish the check. 
%
% *************************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:04CEST $
% Version:    $Rev: 4708 $
% *************************************************************************

function [cr_warnings, cr_notes, b_postprocess] = mes_compareTLVersions(cr_warnings,cr_notes,s_curr_TLVersion,cs_concernedTLVersions)











































