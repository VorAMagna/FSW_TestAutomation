%% mcheck_us_0024 - mes_us_0024
%
% -------------------------------------------------------------------------
% Author: Raoul Beermann-Steger
% Date: 12th April, 2016
%
% Adaption:
%   Author: Raoul Beermann-Steger
%   Date: 22th July, 2016
%
% Description:
% Check the names of the blocks and the modules for blanks and special 
% characters.
% -------------------------------------------------------------------------

%% IMPLEMENTATION
% Template for a standard mes check, save in the check directory.
function [result,cr_items,r_stats]=mes_us_0024(system,cmd_s)			% type before the id the keyword mes_
%% STEP 1: Pre-processing: Getting check info (assumes that check description is available)
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0024');  					% get defaults from db

% For MXAM Drive 3.3 required:
reg.license='';
%

% Add custom information to the check info structure																	% add all necessary information here:
reg.version_id = '1.0'; 												% add version id check_infos
reg.filename = mfilename;												% add filename to check_infos

% reg.functionhandle = 0; 												% clear invalid function handle for ModelAdvisor
% r_myscheme.HiliteType='user1';
% r_myscheme.ForegroundColor='blue';
% r_myscheme.BackgroundColor='magenta';
% set_param(0, 'HiliteAncestorsData', r_myscheme);

%% STEP 2: Validate input arguments and initialize variables
 
d_nargin = nargin;
mes_preprocess; 														% check arguments, preset defaults

if done==1
    return
end

try
    %% STEP 3: YOUR CUSTOM CODE PART STARTS HERE...   
    % find the blocks the check should investigate:
    cs_blocks = find_system(model_name, 'LookUnderMasks', 'all',...
                'FollowLinks','on',...
                'Type', 'Block');% find all blocks in the model

    %% STEP 4 : Initialize Progress Bar
    % Init progress bar (for GUI), needs to be done before calling mes_periprocess.
    % Set argument 2 (imax) to 0, if the number of items is not known yet.
    % The progressbar will be updated in mes_periprocess and check_param.
    % init progress bar
    mes_progress('please wait...',length(cs_blocks),mesvar_PBStep,reg.check_id,0);
    
    %% STEP 5: Peri-processing: Apply ignorelist and update statistics. 
    % filter irrelevant blocks, apply ignorelists, update statistics:
    [cs_blocks,r_stats] = mes_periprocess(cs_blocks,r_peri_ops); 

    %% STEP 6 : Check and optionally fix block parameters 
    % define default fields for check item struct, returned by this check
    default_item=struct('result','faulty','qualifier','block','linkaction','hilite',...
                        'message','The name and constant of this Block ist not the same');
                    
	X=[1,1];
	
    for i = 1 : length(cs_blocks) % loop over to-be-checked blocks
        
        findExcemptions = 0;
        b=cs_blocks{i}; % the current block

        b_cancel=mes_progress(b);    % send progress-info to GUI and check for cancel message from GUI
        if b_cancel
            break
        end
        bh=get_param(b,'Handle'); % get block handle
		Name=get_param(bh,'Name'); % get block name
        BlockType = get_param(bh,'BlockType'); % get BlockType
        bhClass = get_param(bh,'MaskValueString'); % get MaskValueString
             
%         % Definition of the excemptions:
%         blockTypeEx = {'SubSystem','UnitDelay','DataTypeConversion','DiscreteIntegrator'};
%         % Check if the block name contains excemptions:
%         for iEx = 1 : length(blockTypeEx)
%             if strcmp(BlockType,blockTypeEx{iEx})
%                 findExcemptions = 1;
%             end
%         end
        
        % Check if the block name contains some of the forbidden elements:
        errorFound = 0;
        if findExcemptions == 0
            % Definition of the elements which shouldn't be in the block name:
            expression = '[!"§$%&/()=?*+#[]{}~-]'; % do not use \ because then it doesn't work
            startIndex = regexpi(Name,expression);
            if isempty(startIndex)==0
                errorFound = 1;
            end
        end
        
%         % Check if the block name contains some of the forbidden elements:
%         errorFound = 0;
%         if findExcemptions == 0
%             for iCh = 1 : length(check)
%                 if strfind(Name,check{iCh})
%                     errorFound = 1;
%                 end
%             end
%         end
        
        if errorFound == 1
            % hilite_system(bh,'user1') highlights the blocks with errors
            
            % build check item structure for current rule violation:
            it=mxam_newcritem(default_item,...
                'message','The name of the block contains special characters or blanks!',...
                'handle',bh,...
                'path',mes_cleanpathname(bh));
            cr_items{end+1} = it; % add new check item to result list
        end
    end


catch %#ok<*CTCH> % error handling
    % If an error occurs during check execution report this in the catch block.
    lem=lasterror;
    mes_progress('/full:'); % clean-up progressbar
    result=['error in ' mfilename ': ',lem.message];
    %% STEP 7: Post-processing: Complete statistics and clean-up
    mes_postprocess;
    return
end

mes_progress('/full:'); % finally, show full progressbar
mes_postprocess; % clean up and report results