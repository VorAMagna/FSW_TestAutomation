%% mcheck_us_0036 - mes_us_0036
%
% -------------------------------------------------------------------------
% Author: Erik Hechtl
% Date: 24th October 2018
%
% Description:
% Checks all product blocks, if a division by zero can be excluded.
%
% Pass-Fail Criteria:
% - previous block has a limit that does not include 0
% - previous block is a max block that functionally excludes 0 as divisor
% - "protect against division through 0" option is enabled.
% -------------------------------------------------------------------------

function[result,cr_items,r_stats]=mes_us_0036(system,cmd_s)			% type before the id the keyword mes_
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0036');  					% get defaults from db

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
        'FollowLinks','on','BlockType','Product');
    
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
    
    for i = 1:length(cs_blocks)
        
        b = cs_blocks{i}; % the current block
        bh = get_param(b,'Handle'); % get block handle
        Name = get_param(bh,'Name');
        Port_Struct = get(bh,'PortConnectivity');
        MaskValues = get(bh,'MaskValues');
        
        b_cancel=mes_progress(b);    % send progress-info to GUI and check for cancel message from GUI
        if b_cancel
            break
        end
        
        ph = Port_Struct(2).SrcBlock;
        outmin = tl_get(ph,'output.min');
        outmax = tl_get(ph,'output.max');
        
        BlockType = get_param(ph,'BlockType');
        
        BlockIsOK = 0;
        
        inputs = get(bh,'Inputs');
        k = strfind(inputs,'/');
        if ~isnan(str2double(inputs)) || isempty(k)
            BlockIsOK = 1;
        end
        
        if ~isempty(strfind(MaskValues{1},'exceptionhandling'',0'))
            % not protected against division by zero (checkbox not ticked)
            if strcmp(BlockType,'Constant')
                if isnan(str2double(tl_get(ph,'output.value'))) % str2doulbe delivers NaN if argument is not numeric
                    % this is a constant block with a constant defined that
                    % is not calibratable, here the protection against
                    % div/0 is not needed
                    BlockIsOK = 1;
                end
            end
            if ~strcmp(BlockType,'MinMax')
                % previous Block is not a MinMax Block
                
                % check if output of previous block (divisor input) can become zero
                if ~isempty(outmin) && ~isnan(outmin)
                    if outmin > 0
                        BlockIsOK = 1;
                    end
                end
                if ~isempty(outmax) && ~isnan(outmax)
                    if outmax < 0
                        BlockIsOK = 1;
                    end
                end
            else
                BlockIsOK = 1;
            end
        else
            BlockIsOK = 1;
        end
        
        if ~BlockIsOK
            it=mxam_newcritem(default_item,...
                'message','For this block a division by zero cannot be excluded! Please protect the block against zero-division.',...
                'handle',bh,...
                'path',mes_cleanpathname(bh));
            cr_items{end+1} = it; % add new check item to result list
        end
    end
    
        
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
    
