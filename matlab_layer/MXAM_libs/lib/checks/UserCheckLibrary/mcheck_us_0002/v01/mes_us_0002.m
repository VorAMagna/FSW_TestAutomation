%% mcheck_us_0002 - mes_us_0002
%
% -------------------------------------------------------------------------
% Author: Uemit Yasar
% Date: 23rd March, 2015
%
% Adaption:
%   Author: Raoul Beermann-Steger
%   Date: 22th July, 2016
%
% Description:
% Checks the output block background color.
%
% Pass-Fail Criteria:
% Output block background color has to be light blue. 
% -------------------------------------------------------------------------

%% IMPLEMENTATION
function [result,cr_items,r_stats] = mes_us_0002(system,cmd_s)	% type before the id the keyword mes_
%% STEP 1: Pre-processing: Getting check info (assumes that check description is available)
% getting checkinfo from Database (assumes that check is registered in the DB)
[reg,s_regerr] = mxam_getCheckInfoFromDB('us_0002');% <-- ENTER YOUR CHECK-ID HERE !

% For MXAM Drive 3.3 required:
reg.license='';
%

% Add custom information to the check info structure:	
reg.fixable='yes'; % include only if your check supports a fix action
reg.version_id = '1.1'; % some version info, reserved to be included in the check report 
reg.filename = mfilename; % add the actual filenmae to the check info structure

% r_cp_ops.HiliteType='user1';
% r_cp_ops.ForegroundColor='blue';
% r_cp_ops.BackgroundColor='magenta';
% set_param(0, 'HiliteAncestorsData', r_cp_ops)

% -------------------------------------------------------------------------
% include this line if your check uses a TargetLink method (tl_find,
% check_param with tl-option set)
% reg.tl_required='yes'; 
% -------------------------------------------------------------------------

%% STEP 2: Validate input arguments and initialize variables

 
d_nargin = nargin;
mes_preprocess; % sets done=1 when immediate return is required 

if done == 1 % ,mes_preprocess detected reason for not executing the check?
  return % then return here
end

try
   %% STEP 3: YOUR CUSTOM CODE PART STARTS HERE...
   % Find the blocks the check should investigate:
   cs_blocks = find_system(model_name, ...
                        'FollowLinks',followlinks,... %'on'
                        'BlockType', 'Outport');  % <-----   SET YOUR SEARCH CRITERIA HERE !!!
    
    %% STEP 4 : Initialize Progress Bar
    % Init progress bar (for GUI), needs to be done before calling mes_periprocess.
    % Set argument 2 (imax) to 0, if the number of items is not known yet.
    % The progressbar will be updated in mes_periprocess and check_param.
    % init progress bar
    mes_progress('please wait...',length(cs_blocks),mesvar_PBStep,reg.check_id,0);
    % ------------------------------------------------------------
    %% STEP 5: Peri-processing: Apply ignorelist and update statistics. 
    % filter irrelevant blocks, apply ignorelists, update statistics:
    [cs_blocks,r_stats] = mes_periprocess(cs_blocks,r_peri_ops); 
    
    %% STEP 6: Check and optionally fix block parameters 
    % define default fields for check item struct, returned by this check
    %--------------
    % This should be inactivated, so that the repair function is only
    % started if user click on the repair function:
	% r_cp_ops.b_confirmfix = true;
    %--------------
	r_cp_ops.b_resethilite = true;
	r_cp_ops.s_hilitestyle ='user1';
	r_cp_ops.b_hiliteancestors = false;
    r_cp_ops.s_qualifier = 'block'; % needed to determine link actions
	
	% Check your parameter here:
    [fixlog,cr_items] = check_param(cs_blocks,'BackGroundColor','lightBlue','Background color',r_cp_ops); 
catch
    % IF AN ERROR OCCURS DURING CHECK EXECUTION REPORT THIS IN THE CATCH
    % BRANCH
    le = lasterror;
    result = ['Error in ' reg.filename ': ', mes_shortErrorLocationString(le,true)]; % return error message
   
    %% STEP 7: Post-processing: Complete statistics and clean-up
    mes_postprocess; % but do postprocessing before returning
    return  
end

mes_progress('/full:'); % finally, show full progressbar
mes_postprocess; % clean up and report results
end % end of function
