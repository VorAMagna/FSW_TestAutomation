%% mcheck_us_0015 - mes_us_0015
%
% -------------------------------------------------------------------------
% Author: Uemit Yasar
% Date: 23rd March, 2015
%
% Adaption:
%   Author: Raoul Beermann-Steger
%   Date: 22th July, 2016
%
% Description:
% Checks the name and variable of L_ Block.
%
% Pass-Fail Criteria:
% The name and variable of L_ Block is not the same.
% -------------------------------------------------------------------------

%% IMPLEMENTATION
function [result,cr_items,r_stats]=mes_us_0015(system,cmd_s)			% type before the id the keyword mes_
%% STEP 1: Pre-processing: Getting check info (assumes that check description is available)
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0015'); 						% get defaults from db

% For MXAM Drive 3.3 required:
reg.license='';
%

% Add custom information to the check info structure:
reg.version_id = '1.0'; 												% add version id check_infos
reg.filename = mfilename; 												% add filename to check_infos

% reg.functionhandle = 0; 												% clear invalid function handle for ModelAdvisor
% r_myscheme.HiliteType='user1';
% r_myscheme.ForegroundColor='blue';
% r_myscheme.BackgroundColor='magenta';
% set_param(0, 'HiliteAncestorsData', r_myscheme)

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
        'BlockType', 'Lookup');
    
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
        'message','The name and variable of this Block ist not the same');
    
    X=[];
    for i = 1 : length(cs_blocks) % loop over to-be-checked blocks
        
        b=cs_blocks{i}; % the current block
        
        b_cancel=mes_progress(b);    % send progress-info to GUI and check for cancel message from GUI
        if b_cancel
            break
        end
        %
        bh = get_param(b,'Handle'); % get block handle
        Name = get_param(bh,'Name');
        if(strncmp(Name,'L_',2))										% Check name of the block if it starts with L_ begin the check
            Table = get_param(bh,'Table');								% check parameter of the block
            Axis = get_param(bh,'InputValues');
            ind = strfind(Axis,'/');
            underlinex = strfind(Axis,'_x');
            underliney = strfind(Axis,'_y');
            
            if(isempty(ind)&&(isequal(underlinex,X)||isequal(underliney,X)))
                NewAxis=Axis;
            elseif(isempty(ind)&&isequal(underlinex,X))
                endpos = underliney(end)-1;
                NewAxis = Axis(1:endpos);
            elseif(isempty(ind)&&isequal(underliney,X))
                endpos = underlinex(end)-1;
                NewAxis = Axis(1:endpos);
            elseif(isequal(underlinex,X)&&isequal(underliney,X))
                startpos = ind(end)+1;
                NewAxis = Axis(startpos:(end-2));
            elseif(isequal(underlinex,X))
                startpos = ind(end)+1;
                endpos = underliney(end)-1;
                NewAxis = Axis(startpos:endpos);
            else
                startpos=ind(end)+1;
                endpos=underlinex(end)-1;
                NewAxis=Axis(startpos:endpos);
            end
            
            
            Tind=strfind(Table,'/');
            Tunderlinex=strfind(Table,'_x');
            Tunderliney=strfind(Table,'_y');
            
            if(isempty(Tind)&&(isequal(Tunderlinex,X)||isequal(Tunderliney,X)))
                NewTable=Table;
            elseif(isempty(ind))&&isequal(Tunderlinex,X)
                Tendpos=Tunderliney(end)-1
                NewTable=Table(1:endpos);
            elseif(isempty(ind))&&isequal(Tunderliney,X)
                Tendpos=Tunderlinex(end)-1
                NewTable=Table(1:endpos);
            elseif(isequal(Tunderlinex,X)&&isequal(Tunderliney,X))
                Tstartpos=Tind(end)+1;
                NewTable=Table(startpos:(end-2));
            elseif(isequal(Tunderlinex,X))
                startpos=Tind(end)+1;
                endpos=Tunderliney(end)-1;
                NewTable=Table(startpos:endpos);
            else
                startpos=Tind(end)+1;
                endpos=Tunderlinex(end)-1;
                NewTable=Table(startpos:endpos);
            end
            
            nameEnd = '0';
            A = 1;
            B = 1;
            % Check if the length of NewTable and NewAxis is the same.
            % Then it will be check if the length of Name is bigger than
            % NewTable and if the end of the Name is saved to the variable
            % nameEnd. Also Name is overwritten with only the first part of
            % itself.
            if length(NewTable) == length(NewAxis)
                if length(NewTable) < length(Name)
                    nameEnd = Name(length(NewTable)+1:end);
                    Name = Name(1:length(Name));
                end
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
            
            % Compare the different strings:
            A1=strcmp(NewTable,Name);
            A2 = str2double(nameEnd);
            B1=strcmp(NewAxis,Name);
            
            if(isempty(A1)||isnan(A2))
                A=0;
            end
            if(isempty(B1))
                B=0;
            end
            
            if (A==0||B==0)
                % hilite_system(bh,'user1') highlights the blocks with errors
                
                % build check item structure for current rule violation: (predefined start)
                it=mxam_newcritem(default_item,...
                    'message','Name and variable are not the same',...
                    'handle',bh,...
                    'path',mes_cleanpathname(bh));
                cr_items{end+1} = it; % add new check item to result list (predefined end)
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