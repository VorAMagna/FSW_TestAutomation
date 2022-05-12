%% mcheck_us_0019 - mes_us_0019
%
% -------------------------------------------------------------------------
% Author: Uemit Yasar
% Date: 23rd March, 2015
%
% Adaption:
%   Author: Raoul Beermann-Steger
%   Date: 12th April, 2017
%
% Description:
% Checks the name and variable of targetlink outport
%
% Pass-Fail Criteria:
% Name and variable of targetlink outport are not identical.
% -------------------------------------------------------------------------

function[result,cr_items,r_stats]=mes_us_0019(system,cmd_s)			% type before the id the keyword mes_
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0019');  					% get defaults from db

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
        'FollowLinks','on',...
        'MaskType', 'TL_Outport');
    
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
    
    for i = 1 : length(cs_blocks) % loop over to-be-checked blocks
        
        b=cs_blocks{i}; % the current block
        
        b_cancel=mes_progress(b);    % send progress-info to GUI and check for cancel message from GUI
        if b_cancel
            break
        end
        
        bh=get_param(b,'Handle'); % get block handle
        Name = get_param(bh,'Name');
        bhClass = get_param(bh,'MaskValueString');
        
        %extract the variable of the block data
        MaskValueStringCellArray = eval(bhClass);
        MaskValueStringStruct = cell2struct({MaskValueStringCellArray{2},MaskValueStringCellArray{4}},{MaskValueStringCellArray{1},MaskValueStringCellArray{3}},2);
        split = regexp(MaskValueStringStruct.output(2),'\/','split');
        Variable = split{1,1}{end};
        
        if isempty(strfind(cs_blocks{i},'DynamicLUT'))
            if isempty(Variable)
                it=mxam_newcritem(default_item,...
                    'message','No Variable set',...
                    'handle',bh,...
                    'path',mes_cleanpathname(bh));
                cr_items{end+1} = it; % add new check item to result list
                
            else
                A = strfind(Name,Variable);
                if isempty(A)
                    A=0;
                end
                if (A==0)
                    hilite_system(bh,'user1')
                    %build check item structure for current rule violation:
                    it=mxam_newcritem(default_item,...
                        'message','Name and Variable are not the same',...
                        'handle',bh,...
                        'path',mes_cleanpathname(bh));
                    cr_items{end+1} = it; % add new check item to result list
                    
                end
            end
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