%% mcheck_us_0032 - mes_us_0032
%
% -------------------------------------------------------------------------
% Author: Erik Hechtl
% Date: September 20th, 2018
%
% Description:
% x-axis values of LUT must be bigger than their preceding ones
%
% Pass-Fail Criteria:
% Checks if property 'Deposit' of LUT is set to 'Strictly Monotone
% Increasing'
% -------------------------------------------------------------------------

%% IMPLEMENTATION
function [result,cr_items,r_stats]=mes_us_0032(system,cmd_s)			% type before the id the keyword mes_
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0032');  					% get defaults from db

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
    cs_blocks = find_system(model_name,...
        'LookUnderMasks', 'all',...
        'FollowLinks','on',...
        'Regexp', 'on', 'MaskType','\S+Look\S+');  % find all Look-Up tables in the model
    
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
    default_item = struct('result','faulty','qualifier','block','linkaction','hilite',...
        'message','The name and constant of this Block is not the same');
    
    for i=1:numel(cs_blocks)
        b = cs_blocks{i};
        bh = get_param(b,'Handle');
        prop_struct = get(bh);
        
        MaskType = [];
        try
            MaskType = prop_struct.MaskType;
        catch
            error('MaskType not found')
        end
        
        if strcmp(MaskType,'TL_Lookup2D')
            LUT = tl_get(bh,'row.variable');
            if ~isempty(LUT)
                LUTind = strfind(LUT,'/');
                LUTName = LUT(LUTind(end)+1:end);
                h_LUT = dsdd('Find','/Pool','ObjectKind','Variable','Name',LUTName);
                Deposit = dsdd('Get',h_LUT,'Deposit');
                if ~strcmp(Deposit,'STRICTLY_MONOTONE_INCREASING')
                    it=mxam_newcritem(default_item,...
                        'message','''Deposit'' property of LUT x-axis is not set to ''Strictly monotone increasing''',...
                        'handle',bh,...
                        'path',mes_cleanpathname(bh));
                    cr_items{end+1} = it; % add new check item to result list
                end
            end
            LUT = tl_get(bh,'col.variable');
            if ~isempty(LUT)
                LUTind = strfind(LUT,'/');
                LUTName = LUT(LUTind(end)+1:end);
                h_LUT = dsdd('Find','/Pool','ObjectKind','Variable','Name',LUTName);
                Deposit = dsdd('Get',h_LUT,'Deposit');
                if ~strcmp(Deposit,'STRICTLY_MONOTONE_INCREASING')
                    it=mxam_newcritem(default_item,...
                        'message','''Deposit'' property of LUT y-axis is not set to ''Strictly monotone increasing''',...
                        'handle',bh,...
                        'path',mes_cleanpathname(bh));
                    cr_items{end+1} = it; % add new check item to result list
                end
            end
            
        elseif strcmp(MaskType,'TL_Lookup1D')
            LUT = tl_get(bh,'input.variable');
            if ~isempty(LUT)
                LUTind = strfind(LUT,'/');
                LUTName = LUT(LUTind(end)+1:end);
                h_LUT = dsdd('Find','/Pool','ObjectKind','Variable','Name',LUTName);
                Deposit = dsdd('Get',h_LUT,'Deposit');
                if ~strcmp(Deposit,'STRICTLY_MONOTONE_INCREASING')
                    it=mxam_newcritem(default_item,...
                        'message','''Deposit'' property of LUT x-axis is not set to ''Strictly monotone increasing''',...
                        'handle',bh,...
                        'path',mes_cleanpathname(bh));
                    cr_items{end+1} = it; % add new check item to result list
                end
            end
        elseif strcmp(MaskType,'TL_PreLookup')
            LUT = tl_get(bh,'input.variable');
            if ~isempty(LUT)
                LUTind = strfind(LUT,'/');
                LUTName = LUT(LUTind(end)+1:end);
                h_LUT = dsdd('Find','/Pool','ObjectKind','Variable','Name',LUTName);
                Deposit = dsdd('Get',h_LUT,'Deposit');
                if ~strcmp(Deposit,'STRICTLY_MONOTONE_INCREASING')
                    it=mxam_newcritem(default_item,...
                        'message','''Deposit'' property of LUT x-axis is not set to ''Strictly monotone increasing''',...
                        'handle',bh,...
                        'path',mes_cleanpathname(bh));
                    cr_items{end+1} = it; % add new check item to result list
                end
            end
        end
        
    end
    
catch % error handling
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