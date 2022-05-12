%% mcheck_us_0033 - mes_us_0033
%
% -------------------------------------------------------------------------
% Author: Erik Hechtl
% Date: 10th October 2018
%
% Description:
% Autodoc blocks are used to add code comments.
% Empty Autodoc blocks don't make sense, on the other hand a subsystem with
% a large number of blocks should have an Autodoc block.
%
% Pass-Fail Criteria:
% - The text in an Autodoc block consists of less than 3 words.
% - A system with more than 25 blocks does not have an Autodoc block.
% -------------------------------------------------------------------------

function[result,cr_items,r_stats]=mes_us_0033(system,cmd_s)			% type before the id the keyword mes_
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0033');  					% get defaults from db

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
mes_preprocess; 														% check arguments, preset defaults
if done==1
    return
end

try
    %% STEP 3: YOUR CUSTOM CODE PART STARTS HERE...
    % Find the blocks the check should investigate:
    
    cs_blocks = find_system(model_name, 'LookUnderMasks', 'all',...
        'FollowLinks','on');
    
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
    % define default fields for check item struct, returned by this check
    default_item=struct('result','faulty','qualifier','block','linkaction','hilite',...
        'message','The name and constant of this Block is not the same');
    
    % For old (yellow) AUTODOC-blocks (MATLAB 2010b and older versions)
    cs_blocks1 = find_system(model_name, 'LookUnderMasks', 'all',...
        'FollowLinks','on',...
        'MaskType', 'TLSAMPLES_AUTODOC_CUSTOMIZATION');
    % For new (green) AUTODOC-blocks (MATLAB 2015b and newer versions)
    cs_blocks2 = find_system(model_name, 'LookUnderMasks', 'all',...
        'FollowLinks','on',...
        'MaskType','TL_Autodoc');
    cs_blocks_auto = [cs_blocks1;cs_blocks2];
    blocks_autodoc = cell(size(cs_blocks_auto));
    for i = 1 : length(cs_blocks_auto) % loop over to-be-checked Autodoc blocks
        b=cs_blocks_auto{i}; % the current block
        bh=get_param(b,'Handle'); % get block handle
        Name = get_param(bh,'Name');
        bhClass = get_param(bh,'MaskValueString');
        block_prop = get(bh);
        text = tl_get(bh,'autodoc.text');
        if isempty(text)
            text_struct = eval(block_prop.MaskValues{1});
            if ischar(text_struct.text)
                text = text_struct.text;
            elseif iscell(text_struct.text)
                el = numel(text_struct.text);
                text = text_struct.text{1};
                if el > 1
                    for k=2:el
                        text = [text,' ',text_struct.text{k}];
                    end
                end
            end
        end
        if iscell(text)
            text = text{1};
        end
        % Separation between words can be done by a normal space ' ',
        % or by a new line (saved the char variable as a mat-file)
        % Two new lines in sequence must count as a single separation
        load('newline.mat')
        n_spaces = numel(strfind(text,' '));
        line_ind = strfind(text,newline);
        linedist = diff(line_ind);
        n_ones = numel(linedist(linedist==1));
        n_lines = numel(line_ind) - n_ones;
        
        if n_spaces < 2 && n_lines < 2
            disp('Description in the Autodoc block is too short!')
            disp(cs_blocks_auto{i})
            it=mxam_newcritem(default_item,...
                'message','Description in the Autodoc block is too short!',...
                'handle',bh,...
                'path',mes_cleanpathname(bh));
            cr_items{end+1} = it; % add new check item to result list
        end
        ind = regexp(cs_blocks_auto{i},'/|\');
        blocks_autodoc{i} = cs_blocks_auto{i}(1:ind(end)-1);
    end
    
    n_blocks = zeros(length(cs_blocks),1);
    autodoc_needed = zeros(size(n_blocks));
    autodoc_ok = 0;
    % Loop over all the blocks in the system
    for i = 1 : length(cs_blocks)
        b = cs_blocks{i}; % the current block
        bh1 = get_param(b,'Handle'); % get block handle
        % Find the number of blocks in the subsystem
        % Don't look into subsystems of the subsystem
        n_blocks(i) = numel(find_system(b,'SearchDepth',1,'FollowLinks','on'));
        
        % For big subsystems we need an Autodoc block
        if n_blocks(i) > 25 % This number can be changed eventually
            for j = 1 : length(blocks_autodoc)
                if strcmp(b,blocks_autodoc{j})
                    autodoc_ok = 1;
                end
            end
            if ~autodoc_ok
                disp('Autodoc Block must be added to the subsystem!')
                disp(cs_blocks{i})
                
                it=mxam_newcritem(default_item,...
                    'message','Autodoc Block must be added to the subsystem!',...
                    'handle',bh1,...
                    'path',mes_cleanpathname(bh1));
                cr_items{end+1} = it; % add new check item to result list
            end
            autodoc_ok = 0;
        end
    end
    autodoc_needed(n_blocks > 15) = 1;
    autodoc_needed = logical(autodoc_needed);
    blocks_autodoc_needed = cs_blocks(autodoc_needed);
    
catch lem % error handling
    mes_progress('/full:'); % clean-up progressbar
    result=['error in ' mfilename ': ',lem.message];
    
    %% STEP 7: Post-processing: Complete statistics and clean-up
    mes_postprocess;
    return
end

mes_progress('/full:'); % finally, show full progressbar
mes_postprocess; % clean up and report results
end % end of function


