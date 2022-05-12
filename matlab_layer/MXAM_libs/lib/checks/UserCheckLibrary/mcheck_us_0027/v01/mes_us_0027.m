%% mcheck_us_0027 - mes_us_0027
%
% -------------------------------------------------------------------------
% Author: Raoul Beermann-Steger
% Date: 12th April, 2016
%
% Adaption:
%   Author: Raoul Beermann-Steger
%   Date: 21th July, 2016
%
% Description:
% Check the names of all blocks with the class Module_Outputs and
% EEPROM_Signals_Flex4 for the right prefix.
% The prefix should be 'V_' or 'EE' for Module_Outputs and 'EE' for EEPROM
% Signals (Flex4) countinued with the name of the module or the name of a
% module in the same source folder. The module name has to be consistent with
% the source folder name.
% Also the identifier of the variable should be $B.
% -------------------------------------------------------------------------

%% IMPLEMENTATION
% Template for a standard mes check, save in the check directory.
function [result,cr_items,r_stats]=mes_us_0027(system,cmd_s)			% type before the id the keyword mes_
%% STEP 1: Pre-processing: Getting check info (assumes that check description is available)
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0027');  					% get defaults from db

% For MXAM Drive 3.3 required:
reg.license='';

% Add custom information to the check info structure																		% add all necessary information here:
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
    
    %----------------------------------------------------------------------
    % Find all models in the main folder of the current model:
    currentMdlDir = get_param(model_name,'filename');
    currentMdlDir = currentMdlDir(1:length(currentMdlDir)-...
        (length([model_name,'.mdl'])+1));
    underDirs = dir(currentMdlDir);
    overDirs = dir([currentMdlDir,'\..']);
    allDirs = [underDirs;overDirs];
    allModels = cell(1,1);
    allModels{1,1} = model_name;
    allModels{2,1} = 'T010ms';
    allModels{3,1} = 'T02ms';
    allModels{4,1} = 'SvcJobC10';
    countModels = length(allModels);
    
    for i=1:length(allDirs)
        mdlCheck = 0;
        dirName = allDirs(i,1).name;
        if length(dirName) > 3
            dirNameEnd = dirName(end-2:end);
        end
        % Check if the found folders contain the regular expression regEnd:
        regEnd = {'C02','C10','V02','V10','D02','D10','S02','S10','O02',...
            'O10','T02','T05','T10','H10','I02','I10','P02','P10','X05'};
        kReg = strfind(dirName,'.');
        if isempty(kReg)
            for i2=1:length(regEnd)
                if strcmp(dirNameEnd,regEnd{i2})
                    mdlCheck = 1;
                    break
                end
            end
        end
        % Add all models which passed the regular expression test to the
        % cell array allModels:
        if mdlCheck == 1 && strcmp(dirName,model_name)==0
            countModels = countModels + 1;
            allModels{countModels,1} = dirName;
        end
    end
    %----------------------------------------------------------------------
    
    % Find the blocks the check should investigate:
    cs_blocks = find_system(model_name,...
        'LookUnderMasks', 'all',...
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
    
    findTypes = {'Inport','Outport'};
    
    for i = 1 : length(cs_blocks) % loop over to-be-checked blocks
        
        b=cs_blocks{i}; % the current block
        
        b_cancel=mes_progress(b);    % send progress-info to GUI and check for cancel message from GUI
        if b_cancel
            break
        end
        
        testname=['MXAM_',mfilename];
        [BlockIsExcluded,blkExcludeFdbk]=isMxamExcludedBlock(testname,cs_blocks{i});
        
        if ~BlockIsExcluded
            bh=get_param(b,'Handle'); % get block handle
            Name=get_param(bh,'Name'); % get block name
            BlockType = get_param(bh,'BlockType'); % get BlockType
            bhClass = get_param(bh,'MaskValueString'); % get MaskValueString
            
            
            foundType = 0;
            for i2 = 1:length(findTypes)
                if strcmp(BlockType,findTypes{i2})
                    foundType = 1;
                end
            end
            
            k1 = strfind(bhClass,'Module_Outputs');
            k2 = strfind(bhClass,'EEPROM_Signals_Flex4');
            models = [];
            
            for n=1:length(allModels)
                models = [models,'|',allModels{n}];
            end
            models(1)='(';
            models(end+1)=')';
            
            NameIsOK = 0;
            errMess = '-';
            
            if foundType == 1 && (isempty(k1)==0 || isempty(k2)==0)
                
                if isempty(k1)==0
                    ind = regexp(Name,['(V_|EE_)?+',models]); % returns the index of first coincidence
                end
                if isempty(k2)==0
                    ind = regexp(Name,['(EE_)?+',models]); % returns the index of first coincidence
                end
                if ~isempty(ind)    % if the first coincidence is at the beginning of module name, the module name is ok
                    NameIsOK = ind == 1;
                end
                
                if ~NameIsOK
                    errMess = sprintf(['For ''',Name,''' one of the following errors occured:\n- The module was not found in the source folder\n- Blockname has the wrong prefix.',blkExcludeFdbk]);
                end
            end
            
            if strcmp(errMess,'-') == 0
                hilite_system(bh,'user1')
                
                %build check item structure for current rule violation:
                it=mxam_newcritem(default_item,...
                    'message',errMess,...
                    'handle',bh,...
                    'path',mes_cleanpathname(bh));
                cr_items{end+1} = it; % add new check item to result list
            end
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
end % end of function