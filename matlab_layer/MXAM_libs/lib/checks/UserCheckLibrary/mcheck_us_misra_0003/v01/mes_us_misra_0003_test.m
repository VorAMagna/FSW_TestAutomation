%% mcheck_us_misra_0003 - mes_us_misra_0003
%
% -------------------------------------------------------------------------
% Author: Raoul Beermann-Steger
% Date: 22nd May 2019
%
% Description:    
% The output class of every LUT shall be set to the non optimizable 
% variable class NOPT_LOCAL.
%
% MES CHECK: 
% ==========
% misra_tl_7_4:	Avoidance of function calls in logical expressions
% [TL_RULE_FUNCTION_CALL_LOGICAL_EXPRESSION] 
%
% PASS/FAIL CRITERIA
% ==================
% The output class of every LUT shall be set to the non optimizable 
% variable class NOPT_LOCAL.
%
% FIX ACTION:
% ================ 
% Set the output class of every LUT to the non optimizable variable class
% NOPT_LOCAL. 
% -------------------------------------------------------------------------
model_name = bdroot;

% function[result,cr_items,r_stats]=mes_us_misra_0002(system,cmd_s)			% type before the id the keyword mes_
% [reg,s_regerr]=mxam_getCheckInfoFromDB('us_misra_0002');  					% get defaults from db

% For MXAM Drive 3.3 required:
reg.license='';
%

% Add custom information to the check info structure:
reg.version_id = '1.0'; 												% add version id check_infos
reg.filename = mfilename;												% add filename to check_infos

% reg.functionhandle = 0; 												% clear invalid function handle for ModelAdvisor
% r_myscheme.HiliteType='user1';
% r_myscheme.ForegroundColor='blue';
% r_myscheme.BackgroundColor='magenta';
% set_param(0, 'HiliteAncestorsData', r_myscheme);

%% STEP 2: Validate input arguments and initialize variables
%  
d_nargin = nargin;
mes_preprocess; 														% check arguments, preset defaults
% if done==1
%     return
% end
% 
% try
    %% STEP 3: YOUR CUSTOM CODE PART STARTS HERE...
    % Find the blocks the check should investigate:
    luts1D = find_system(model_name,'LookUnderMasks','all','FollowLinks','on',...
    'MaskType','TL_Lookup1D');
    luts2D = find_system(model_name,'LookUnderMasks','all','FollowLinks','on',...
    'MaskType','TL_Lookup2D');
    cs_blocks = [luts1D;luts2D];
%     %% STEP 4 : Initialize Progress Bar
%     % Init progress bar (for GUI), needs to be done before calling mes_periprocess.
%     % Set argument 2 (imax) to 0, if the number of items is not known yet.
%     % The progressbar will be updated in mes_periprocess and check_param.
%     % init progress bar
%     mes_progress('please wait...',length(cs_blocks),mesvar_PBStep,reg.check_id,0); % init progress bar
%     
%     %% STEP 5: Peri-processing: Apply ignorelist and update statistics.
%     % filter irrelevant blocks, apply ignorelists, update statistics:
%     [cs_blocks,r_stats] = mes_periprocess(cs_blocks,r_peri_ops);
%     
%     %% STEP 6: Check and optionally fix block parameters
%     % define default fields for check item struct, returned by this check
%     % define default fields for check item struct, returned by this check
%     default_item=struct('result','faulty','qualifier','block','linkaction','hilite',...
%         'message','The output class of the LUT is not NOPT_LOCAL.');
    
    for i1 = 1 : length(cs_blocks)
        bh = get_param(cs_blocks{i1},'handle');
        bName = get(bh,'Name');
        maskValStr = get(bh,'MaskValueString');

        output.class = tl_get(bh,'output.class');

        if ~strcmp(output.class,'NOPT_LOCAL')
            disp(['Error: the output class of the LUT ',bName,...
                ' is not NOPT_LOCAL!']);
        end
    end

    
%     
% catch lem % error handling
%     mes_progress('/full:'); % clean-up progressbar
%     result=['error in ' mfilename ': ',lem.message];
%     
%     %% STEP 7: Post-processing: Complete statistics and clean-up
%     mes_postprocess;
%     return
% end

% mes_progress('/full:'); % finally, show full progressbar
% mes_postprocess; % clean up and report results
% end % end of function