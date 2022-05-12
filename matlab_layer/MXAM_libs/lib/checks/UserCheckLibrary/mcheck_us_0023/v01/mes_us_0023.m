%% mcheck_us_0023 - mes_us_0023
%
% -------------------------------------------------------------------------
% Author: Raoul Beermann-Steger
% Date: 25th September, 2015
%
% Adaption:
%   Author: Raoul Beermann-Steger
%   Date: 6th February, 2018
%
% Description:
% Checks the use of "Mergeable Disp".
% When the checked block is not a inport or a outport then it is not
% allowed to use "Mergeable Disp".
% -------------------------------------------------------------------------

function [result,cr_items,r_stats]=mes_us_0023(system,cmd_s)			% type before the id the keyword mes_
%% STEP 1: Pre-processing: Getting check info (assumes that check description is available)
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0023');  					% get defaults from db

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
 
d_nargin = nargin;
mes_preprocess;
 
d_nargin = nargin;
mes_preprocess; 														% check arguments, preset defaults
if done==1
    return
end

try
    %% STEP 3: YOUR CUSTOM CODE PART STARTS HERE...
    
    % Find the blocks the check should investigate:
    cs_blocks = find_system(model_name,...
        'LookUnderMasks',lookundermasks,... %'all'
        'FollowLinks',followlinks,... %'on'
        'Type', 'Block');% find all blocks in the model
    
    
    
    %% STEP 4 : Initialize Progress Bar
    % Init progress bar (for GUI), needs to be done before calling mes_periprocess.
    % Set argument 2 (imax) to 0, if the number of items is not known yet.
    % The progressbar will be updated in mes_periprocess and check_param.
    % init progress bar
    mes_progress('please wait...',length(cs_blocks),mesvar_PBStep,reg.check_id,0); % init progress bar
    
    %% STEP 5: Peri-processing: Apply ignorelist and update statistics.
    % filter irrelevant blocks, apply ignorelists, update statistics:
    [cs_blocks,r_stats] = mes_periprocess(cs_blocks,r_peri_ops);
    
    %% STEP 6: Check and optionally fix block parameters
    % define default fields for check item struct, returned by this check
    default_item=struct('result','faulty','qualifier','block','linkaction','hilite',...
        'message','The name and constant of this Block ist not the same');
    
    X=[1,1];
    
    for i = 1 : length(cs_blocks) % loop over to-be-checked blocks
        
        b=cs_blocks{i}; % the current block
        
        b_cancel=mes_progress(b);    % send progress-info to GUI and check for cancel message from GUI
        if b_cancel
            break
        end
        bh=get_param(b,'Handle'); % get block handle
        % bName=get_param(bh,'Name'); % get block name
        bType = get_param(bh,'BlockType'); % get BlockType
        bClass = get_param(bh,'MaskValueString'); % get MaskValueString
        
        % Check if block's class is MERGEABLE_DISP:
        indClass=strfind(bClass,'MERGEABLE_DISP'); % Find the index of the string 'MACRO'
        if (isempty(indClass)==0 && (strcmp(bType,'Inport')==0 &&...
                strcmp(bType,'Outport')==0))
            
            % hilite_system(bh,'user1') highlights the blocks with errors
            
            % build check item structure for current rule violation:
            it=mxam_newcritem(default_item,...
                'message','MERGEABLE_DISP was used in a different block then a Inport or Outport.',...
                'handle',bh,...
                'path',mes_cleanpathname(bh));
            cr_items{end+1} = it; % add new check item to result list
        end
    end
    
    
catch %#ok<*CTCH> % error handling
    lem=lasterror;
    mes_progress('/full:'); % clean-up progressbar
    result=['error in ' mfilename ': ',lem.message];
    %% STEP 7: Post-processing: Complete statistics and clean-up
    mes_postprocess;
    return
end

mes_progress('/full:'); % finally, show full progressbar
mes_postprocess; % clean up and report results
end % end of function