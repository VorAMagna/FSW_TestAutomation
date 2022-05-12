%% mcheck_us_0031 - mes_us_0031
%
% -------------------------------------------------------------------------
% Author: Erik Hechtl
% Date: 27.02.2018
%
% Description:
% Checks the status of the linked requirements.
%
% Pass-Fail Criteria:
% No PTC document found for the model.
% -------------------------------------------------------------------------

%% IMPLEMENTATION
function [result,cr_items,r_stats]=mes_us_0031(system,cmd_s)			% type before the id the keyword mes_
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0031');  					% get defaults from db

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
    cs_blocks = [];
    
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
        'message','No PTC document found for this model. Requirement links are missing.');
    
    modelH=get_param(model_name,'Handle');
    
    returnCode = isMdlRequirementDocSynchronized(model_name);
    
    if (returnCode == 2)
        it=mxam_newcritem(default_item,...
            'message','No PTC document found for this model',...
            'handle',modelH,...
            'path',model_name);
        cr_items{end+1} = it; % add new check item to result list
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
end


