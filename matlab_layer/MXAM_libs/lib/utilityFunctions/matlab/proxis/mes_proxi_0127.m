% Variable Assignments in Transition Segments
%
% function [result,cr_items,r_stats] = mes_proxi_0127(system, cmd_s)
%
% SHORT DESCRIPTION:
% ==================
% Within a multi segmented transition path, a variable is only to be
% assigned a value on a transition action or a condition action of the last
% segment of the transition path. The last segment is the transition whose
% destination is a state or a junction with no outgoing transitions.
% 
% Note:
% If behind a segment there is a path to final junction or state without
% condition, then the assignment is allowed in this segment.
%
% PASS CRITERIA
% ==================
% The check inspects each variable assignment in a multi segmented transition path.
% 
%     Passed1: a variable assignment is defined in a transition action.
%     Passed2: a variable assignment is defined in the condition action of the last transition in the transition path. 
% 
% The check issues a failed if none of the passed cases apply. 
%
% FAIL CRITERIA
% ==================
% Variable assignments made in the intermediate transition segments .
% Note : Assignment operators that are detected by this check are:
% a++
% a--
% a += 5
% a -= 5
% a *= 5
% a /= 5
% a = b;
% Added assignment operators on 04/07/2017
% ~a
% !a
% -a
% a := 5
% a |= 5
% a &= 5
% a ^= 5
% CALLED BY:
% ==========
% mes_sf_002,
% mes_mc_0006
% ***********************************************************
% Copyright:    Model Engineering Solutions GmbH
% Date:         $Date: 2020/07/31 16:10:46CEST $
% Version:      $Rev: 14944 $
% ***********************************************************

function [result,cr_items,r_stats]=mes_proxi_0127(system,cmd_s,reg,s_regerr)




































































































































































































































































































































