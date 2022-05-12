% function s_completedOrphans = mes_completeOrphans(s_toComplete,s_char)
% 
% DESCRIPTION:
% ============
% Completes unpaired ("orphan") occurencies of char s_char in s_toComplete,
% so that any run of character s_char in s_completedOrphans is expanded 
% to have an even length.
%
% INPUT PARAMETERS:
% =================
% - s_toComplete: string in which the orphans will be completed
% - s_char:       char which represents an orphan
%
% RETURN VALUES:
% ==============
% - s_completedOrphans: string in which the orphans are completed
%
% EXAMPLE:
% ========
% s_char='.';
% s_toComplete = 'a.b..s_char...d..'
% mes_completeOrphans(s_toComplete,s_char)
% ans = 
%   'a..b..s_char....d..'
%
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:04CEST $
% Revision:   $Rev: 5615 $
% ****************************************************************

function s_completedOrphans = mes_completeOrphans(s_toComplete,s_char)








































































