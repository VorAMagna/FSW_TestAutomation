%% mcheck_us_36 - mes_us_0037
%
% -------------------------------------------------------------------------
% Author: Erik Hechtl
% Date: 24th October 2018
%
% Description:
%
% (1) The character encoding property of the simulink model defines
% which ASCII file standard is used to save the models.
% In the past we had problems caused by the requirement links
% from PTC. PTC uses as standard character encoding UTF-8 whereas
% Simulink uses Windows 1252 as standard. Through the requirement
% link tool strings from PTC are imported to the models and saved there.
% UTF-8 has a bigger set of characters like arrows, dots... which
% cannot be represented by windows-1252. This caused that after the
% sync of the requirements the models could not be opened with
% Matlab-Simulink any longer. Using the same character set is essential
% for both tools therefore.
%
% (2) Check the opened model for user defined cyclomatic complexity blocks
% and export their data into the file "UDCycComp.mat"

% Pass-Fail Criteria:
% SavedCharacterEncoding is not equal to UTF-8
% -------------------------------------------------------------------------


function[result,cr_items,r_stats]=mes_us_0037(system,cmd_s)			% type before the id the keyword mes_
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0037');  					% get defaults from db

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
    cs_blocks = model_name;
    
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
    
    
    get_mxray_meeting_limit_for_all(r_peri_ops, ...
        model_name,...
        {...
        'CyclomaticComplexityLimit',...
        'MxrayComplexityLimit',...
        'LevelLimit'
        },...
        'MXRAYLimitExceptions.mat') 
    
    %     mxray_cell = [];
    %
    %     cs_blocks_cyc = find_system(model_name,'LookUnderMasks', 'all',...
    %         'FollowLinks','on','MaskType','CyclomaticComplexity');
    %
    %     CycCompLim = zeros(length(cs_blocks_cyc),1);
    %     CycMeetingID = CycCompLim;
    %
    %     if ~isempty(cs_blocks_cyc)
    %         for k = 1:length(cs_blocks_cyc)
    %             bh = get_param(cs_blocks_cyc{k},'Handle');
    %             CycCompLim(k) = str2double(get(bh,'CyclomaticComplexityLimit'));
    %             CycMeetingID(k) = str2double(get(bh,'CyclomaticMeetingID'));
    %         end
    %     end
    %     mxray_cell = cell(1,3);
    %     mxray_cell{1} = cs_blocks_cyc;
    %     mxray_cell{2} = CycCompLim;
    %     mxray_cell{3} = CycMeetingID;
    %
    %     path = r_peri_ops.s_modelfilename;
    %     ind = regexp(path,'/|\');
    %     path = path(1:ind(end-1)-1);
    %     FileName = [path,'/UDCycComp.mat'];
    %     load(FileName);
    %
    %     for k = 1:length(UDCycComp)
    %         if strcmp(UDCycComp{k,1}{1},model_name)
    %             UDCycComp{k,2} = mxray_cell;
    %         end
    %     end
    %     save(FileName,'UDCycComp');
    %
    %
    %
    %
    %     bh = get_param(model_name,'handle');
    %     SCE = get(bh,'SavedCharacterEncoding');
    %
    %     if ~strcmp(SCE,'UTF-8')
    %         it=mxam_newcritem(default_item,...
    %             'message','Character encoding is not equal to UTF-8',...
    %             'handle',bh,...
    %             'path',mes_cleanpathname(bh));
    %         cr_items{end+1} = it; % add new check item to result list
    %     end
    %
    
    
    
catch lem % error handling
    mes_progress('/full:'); % clean-up progressbar
    result=['error in ' mfilename ': ',lem.message];
    
    %% STEP 7: Post-processing: Complete statistics and clean-up
    mes_postprocess;
    return
end

mes_progress('/full:'); % finally, show full progressbar
mes_postprocess; % clean up and report results
end % end of test_case

%% File exclusive functions
function get_mxray_meeting_limit_for_all(r_peri_ops, ...
    model_name, metric_names, load_save_filename)
% :param r_peri_ops: MXAM_Program, specific process data
% :param model_name: the name (not the path) of the model currently being searched
% :param metric_names: the variable names inside of the block (cell array)
% :param load_save_filename: the name of the file where the data should be
% loaded from and saved to.
% .. note:: Compatibility with the older user defined CycComp meeting block
% exists

mxray_metrics_limit_struct = struct;

% gets the path
path = r_peri_ops.s_modelfilename;
ind = regexp(path,'/|\');
path = path(1:ind(end-1)-1);



% if a previous file does exist, it will be modified, and saved
if exist(fullfile(path, load_save_filename), 'file') == 2
    load(fullfile(path, load_save_filename))
else
    % if it doesn't exist a new empty one will be created
    save(fullfile(path, load_save_filename), 'mxray_metrics_limit_struct')
end

% loop through all the metrics
for index = 1:numel(metric_names)
    % if the fieldname doesn't exist in our fieldnames, a new empty array
    % will be created
    if ~ismember( metric_names{index}, fieldnames(mxray_metrics_limit_struct))
        mxray_metrics_limit_struct.(metric_names{index}) = {};
    end
    
    
    [output_iter, is_compatibility] = get_mxray_meeting_limit(r_peri_ops,...
        model_name,...
        metric_names{index},...
        load_save_filename,...
        mxray_metrics_limit_struct.(metric_names{index}));
    
    % checks error, if there is an error with the output (indicated by a 0
    % num)
    % this one will be skipped
    
    if isa(output_iter, 'cell')
        if (is_compatibility && strcmp(metric_names{index}, 'CyclomaticComplexityLimit'))...
                || (~is_compatibility)
            mxray_metrics_limit_struct.(metric_names{index}) = output_iter;
        else 
            % pass ... mxray_metrics_limit_struct.(metric_names{index}) = {};
        end
    end
end

% saves the endresults in the matfile
save(fullfile(path, load_save_filename), 'mxray_metrics_limit_struct')

end
function [findings, is_compatibility] = get_mxray_meeting_limit(r_peri_ops,model_name, metric_name,...
    load_save_filename, previous_findings)
% searches for mxray meeting blocks and fetches their parameters
% :param r_peri_ops: MXAM_Program, specific process data
% :param model_name: the name (not the path) of the model currently being searched
% :param metric_name: the variable name inside of the block
% :param load_save_filename: the name of the file where the data should be
% :param previous_findings: the findings of the previous checks, if
% available
% loaded from and saved to.
% :return findings: an array with the names of the models and the findings
% .. note:: Compatibility with the older user defined CycComp meeting block
% exists marked with the comment COMPATIBILITY are the codeblocks which
% realize compatibility with the previous system
% :return is_compatibility: flag which tells if the function did a
% backwards compatibility adjustment

is_compatibility = false; %default value 
if nargin < 5
    previous_findings = {};
end
if isempty(previous_findings)
    
end

cs_blocks_cyc = find_system(model_name, 'LookUnderMasks', 'all',...
    'FollowLinks', 'on', 'MaskType', 'MXRAYLimits');

% COMPATABILITY
if isempty(cs_blocks_cyc)
    is_compatibility = true;
    cs_blocks_cyc = find_system(model_name, 'LookUnderMasks', 'all',...
        'FollowLinks', 'on', 'MaskType', 'CyclomaticComplexity');
end


% defining the size of the output arrays
metric_limit = zeros(length(cs_blocks_cyc),1);
metric_limit_meeting_id = metric_limit;

% if not empty, meaning there are blocks which should be analyzed
if ~isempty(cs_blocks_cyc)
    for k = 1:length(cs_blocks_cyc)
        bh = get_param(cs_blocks_cyc{k},'Handle');
        
        % if true, do compatibility
        if nnz(ismember(fieldnames(get(bh)), 'CyclomaticMeetingID'))
            
            % COMPATIBILITY with older system
            metric_limit(k) = str2double(get(bh,'CyclomaticComplexityLimit'));
            metric_limit_meeting_id(k) = str2double(get(bh,'CyclomaticMeetingID'));
            % else, do standard (new system)
        else
            % fetches the new limit given in the block
            try
                metric_limit(k) = str2double(get(bh, metric_name));
            catch
                findings = 0;
                return
            end
            % fetches the meeting ID in the block
            metric_limit_meeting_id(k) = str2double(get(bh,'MeetingID'));
        end
        
    end
end



mxray_cell = cell(1,3);
mxray_cell{1} = cs_blocks_cyc;
mxray_cell{2} = metric_limit;
mxray_cell{3} = metric_limit_meeting_id;

path = r_peri_ops.s_modelfilename;
ind = regexp(path,'/|\');
path = path(1:ind(end-1)-1);

% checks to see if the the newer system is used or if the older doesn't
% exist
if exist(fullfile(path, load_save_filename) , 'file') == 2 ...
        || ~(exist(fullfile(path, 'UDCycComp.mat') , 'file'))
    
    % app.Index = find(strcmp(app.ConfigStruct.Name, value));
    
    % if there isint an entry for the model, a new one will be appended
    % at the end
    if isempty(find(strcmp(previous_findings, model_name)));
        % taking the height of the array
        [y, ~] = size(previous_findings);
        % appending the new entry to the end
        previous_findings{y + 1, 1} = model_name;
        previous_findings{y + 1, 2} = mxray_cell;
    else
        % finding the index of the already existing entry
        y = find(strcmp(previous_findings, model_name));
        % changing the entry
        previous_findings{y, 1} = model_name;
        previous_findings{y, 2} = mxray_cell;
    end
    findings = previous_findings;
    
    % COMPATIBILITY deal with the old system
elseif exist(fullfile(path, 'UDCycComp.mat') , 'file')
    FileName = [path,'/UDCycComp.mat'];
    load(FileName);
    
    for k = 1:length(UDCycComp)
        if strcmp(UDCycComp{k,1}{1}, model_name)
            UDCycComp{k,2} = mxray_cell;
        end
    end
    % taking the height of the array
    [y, ~] = size(UDCycComp);
    
    % fixing the previous array format, where nested arrays existed
    for index = 1:y
        UDCycComp{index, 1} = UDCycComp{index, 1}{1};
    end
    findings = UDCycComp;
end


end