%% mcheck_us_0026 - mes_us_0026
%
% -------------------------------------------------------------------------
% Author: Raoul Beermann-Steger
% Date: 12th April, 2016
%
% Adaption:
%   Author: Raoul Beermann-Steger
%   Date: 6th February, 2018
%
% Description:
% Check the names of all blocks with the class DISP for the right prefix.
% The prefix should be 'W_' countinued with the name of the module
% or the name of a module in the same source folder.
% Also the identifier of the variable should be $B.
% -------------------------------------------------------------------------

%% IMPLEMENTATION
% Template for a standard mes check, save in the check directory.
function [result,cr_items,r_stats]=mes_us_0026(system,cmd_s)			% type before the id the keyword mes_
%% STEP 1: Pre-processing: Getting check info (assumes that check description is available)
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0026');  					% get defaults from db

% For MXAM Drive 3.3 required:
reg.license='';
%

% Add custom information to the check info structure																			% add all necessary information here:
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
    countModels = 1;
    
    for i=1:length(allDirs)
        mdlCheck = 0;
        dirName = allDirs(i,1).name;
        if length(dirName) > 3
            dirNameEnd = dirName(end-2:end);
        end
        % Check if the found folders contain the regular expression regEnd:
        regEnd = {'C02','C10','V02','V10','D02','D10','S02','S10','O02',...
            'O10','T02','T10','H10','I02','I10','P02','P10'};
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
        'LookUnderMasks', lookundermasks,... %'all'
        'FollowLinks',followlinks,... %'on'
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
    
    for i = 1 : length(cs_blocks) % loop over to-be-checked blocks
        b=cs_blocks{i}; % the current block
        
        b_cancel=mes_progress(b);    % send progress-info to GUI and check for cancel message from GUI
        if b_cancel
            break
        end
        bh=get_param(b,'Handle'); % get block handle
        bName=get_param(bh,'Name'); % get block name
        bType = get_param(bh,'BlockType'); % get block type
        bClass = get_param(bh,'MaskValueString'); % get MaskValueString
        
        % Definition of the regular start expressions:
        regStart = {'W_';'W_EE_'};
        % Check if the class is DISP:
        k1 = regexp(bClass,'[^\w]DISP[^\w]','once');
        % Check if the output name is defined right:
        k2 = strfind(bClass,'$B');
        % Check if the block type is a port:
        k3 = strfind(bType,'port');
        
        % Definition of the search indexes (indices):
        kStart = [];
        kFin = [];
        kModName = [];
        
        if ~isempty(k1) && isempty(k3)
            for i2 = 1:length(regStart)
                if (length(bName) > length(regStart{i2}))
                    kStartTry = strfind(bName(1:length(regStart{i2})),regStart{i2});
                    if ~isempty(kStartTry)
                        kStart = kStartTry;
                        iReq = i2;
                    end
                end
            end
            if ~isempty(kStart)
                for i3 = 1:length(allModels)
                    findTxt = [regStart{iReq},allModels{i3,1}];
                    if length(findTxt) < length(bName)
                        kFin = strfind(bName(1:length(findTxt)),findTxt);
                    end
                    if  ~isempty(kFin)
                        break
                    end
                end
            end
            for i3 = 1:length(allModels)
                kModName = strfind(bName,allModels{i3,1});
                if  ~isempty(kModName)
                    break
                end
            end
            
            % Definition of the error messages:
            errMessPrefix = ['The name of the ',bName,' has not the right',...
                ' prefix.'];
            errMessRightPref = 'DISPs should have the prefix "W_".';
            errMessRightName = 'The identifier of the variable is not $B.';
			errMess = '-';
            
            checkForModName = 1;
            if isempty(kFin)
                if ~isempty(kStart) && isempty(kFin) 
                    % regStart expression is correct
                    % Get the prefix between the first two underscores:
                    kUn = strfind(bName,'_');
                    moduleNotF = '';
                    if isempty(kUn)==0 && length(kUn) >= 2
                        moduleNotF = bName(kUn(1)+1:kUn(2)-1);
                    end
                    if (length(moduleNotF) > 3) || (~isempty(kStart) && isempty(kModName))
                        errMess = [errMessPrefix,' No module name or a',...
                            ' false module name was found.'];
                        checkForModName = 0;
                    else
                        errMess = [errMessPrefix,' The part "',moduleNotF,...
                            '" between the',' first two underscores is too much.'];
                    end
                else
                    % regStart expression is not correct:
                    errMess = [errMessPrefix,' ',errMessRightPref];
                end
                if isempty(kModName) && checkForModName == 1
                    % No module name was found in the block name:
                    errMess = [errMess,' Furthermore, no module name or a',...
                        ' false module name was found.']; %#ok<*AGROW>
                end
                if isempty(k2)
                    % Identifier is false:
                    errMess = [errMess,' ',errMessRightName];
                end
            else
                if isempty(k2)
                    errMess = errMessRightName;
                end
            end
            if strcmp(errMess,'-') == 0
                % hilite_system(bh,'user1')
                
                % build check item structure for current rule violation:
                it=mxam_newcritem(default_item,...
                    'message',errMess,...
                    'handle',bh,...
                    'path',mes_cleanpathname(bh));
                cr_items{end+1} = it; % add new check item to result list
            end
        end
    end
catch lem
    % If an error occurs during check execution report this in the catch block.
    mes_progress('/full:'); % clean-up progressbar
    result=['error in ' mfilename ': ',lem.message];
    %% STEP 7: Post-processing: Complete statistics and clean-up
    mes_postprocess;
    return
end

mes_progress('/full:'); % finally, show full progressbar
mes_postprocess; % clean up and report results
end % end of function