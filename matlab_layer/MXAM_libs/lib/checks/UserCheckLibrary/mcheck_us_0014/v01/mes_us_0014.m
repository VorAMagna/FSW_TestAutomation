%% mcheck_us_0014 - mes_us_0014
%
% -------------------------------------------------------------------------
% Author: Uemit Yasar
% Date: 23rd March, 2015
%
% Adaption:
%   Author: Raoul Beermann-Steger
%   Date: 25th November, 2016
%
% Description:
% Checks the name and constant of P_ and C_ Block.
%
% Pass-Fail Criteria:
% The name and constant of P_ and C_ Block is not the same.
% -------------------------------------------------------------------------

%% IMPLEMENTATION
function [result,cr_items,r_stats]=mes_us_0014(system,cmd_s)			% type before the id the keyword mes_
%% STEP 1: Pre-processing: Getting check info (assumes that check description is available)
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0014');  					% get defaults from db

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
        'LookUnderMasks',lookundermasks,... %'all'
        'FollowLinks',followlinks,... %'on'
        'BlockType', 'Constant');
    
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
    
    % Define the variable where the names of the blocks which need a
    % exception are saved:
    checkName{1} = 'C_INPUTC10_VERSION_MJ';
    checkName{2} = 'C_INPUTC10_VERSION_MI';
    checkName{3} = 'C_INPUTC10_VERSION_BF';
    checkName{4} = 'C_INPUTC10_PF_VERSION_CC_MJ';
    checkName{5} = 'C_INPUTC10_PF_VERSION_CC_MI';
    checkName{6} = 'C_INPUTC10_PF_VERSION_CC_BF';
    
    for i = 1 : length(cs_blocks) % loop over to-be-checked blocks
        
        b=cs_blocks{i}; % the current block
        
        b_cancel=mes_progress(b);    % send progress-info to GUI and check for cancel message from GUI
        if b_cancel
            break
        end
        bh=get_param(b,'Handle'); % get block handle
        Name=get_param(bh,'Name'); % get block name
        exceptionFound = 0;
        if(strncmp(Name,'C_',2)||strncmp(Name,'P_',2))					% Check name of the block if it starts with C_ or P_ begin the check
            bhClass = get_param(bh,'MaskValueString'); % get MaskValueString
            
            % Check if block's class is MACRO:
            indClass=strfind(bhClass,'MACRO'); % Find the index of the string 'MACRO'
            if isempty(indClass)==0    %strcmp(bhClass,'MACRO')
                for iCheck = 1:1:length(checkName)
                    % Check if the block's name is in the exception list:
                    if strcmp(checkName{iCheck},Name)
                        exceptionFound = 1;
                        %save('C:\Sandbox\Product_Platform\SW\Development\CC\tools\ModelExaminer\MXRay_MXAM_Toolchain\MXAMLibraries\UserCheckLibrary\mcheck_us_0014\v01test','bhClass');
                    end
                end
            end
            
            % When no exception is found, the check will continue, else
            % the next element will be checked:
            if exceptionFound == 0
                Constant=get_param(bh,'value');								% check parameter of the block
                ind=strfind(Constant,'/');
                if(isempty(ind))
                    NewConstant=Constant;
                else
                    startpos=ind(end)+1;
                    NewConstant=Constant(startpos:(end-2));
                end
                
                % Check if the constant is a number. And if it is a number
                % than the check if the name and constant are the same,
                % won't be done.
                numCon = str2num(NewConstant); %#ok<*ST2NM>
                if isempty(numCon)
                    nameEnd = '0';
                    A = 1;
                    
                    if length(NewConstant) < length(Name)
                        nameEnd = Name(length(NewConstant)+1:end);
                        Name = Name(1:length(Name));
                    end
                    
                    % Check if the symbol '_' is in the variable nameEnd. If it is
                    % so then the nameEnd is overwritten with only the text after
                    % the underscore.
                    k = strfind(nameEnd,'_');
                    if isempty(k) == 0
                        if k < length(nameEnd)
                            nameEnd = nameEnd(k+1:end);
                        end
                    end
                    
                    % Comparision of the constant and the name of the
                    % block:
                    A1=strcmp(NewConstant,Name);
                    % Convert the string nameEnd to a double value:
                    A2 = str2double(nameEnd);
                    
                    if(isempty(A1)||isnan(A2))
                        A=0;
                    end
                    
                    
                    if (A==0)
                        % hilite_system(bh,'user1') highlights the blocks
                        % with errors
                        
                        % build check item structure for current rule
                        % violation:
                        it=mxam_newcritem(default_item,...
                            'message','Name and constant are not the same',...
                            'handle',bh,...
                            'path',mes_cleanpathname(bh));
                        cr_items{end+1} = it; % add new check item to result list
                    end
                end
            end
        end
    end
    
    
catch lem
    mes_progress('/full:'); % clean-up progressbar
    result=['error in ' mfilename ': ',lem.message];
    
    %% STEP 7: Post-processing: Complete statistics and clean-up
    mes_postprocess;
    return
end

mes_progress('/full:'); % finally, show full progressbar
mes_postprocess; % clean up and report results
end % end of function