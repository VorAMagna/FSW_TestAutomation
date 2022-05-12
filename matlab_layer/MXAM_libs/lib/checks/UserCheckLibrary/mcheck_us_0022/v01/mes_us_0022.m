%% mcheck_us_0022 - mes_us_0022
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
% Checks the name and constant of interrunnables.
%
% Pass-Fail Criteria:
% The name and constant of interrunnable, sender-receiver Block is not the
% same. 
% -------------------------------------------------------------------------

%% IMPLEMENTATION
function [result,cr_items,r_stats]=mes_us_0022(system,cmd_s)			% type before the id the keyword mes_
%% STEP 1: Pre-processing: Getting check info (assumes that check description is available)
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0022');  					% get defaults from db

% For MXAM Drive 3.3 required:
reg.license='';
%

% Add custom information to the check info structure:																		% add all necessary information here:
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
    csInports = find_system(model_name,...
                'LookUnderMasks',lookundermasks,... %'all'
                'FollowLinks',followlinks,... %'on'
				'MaskType', 'TL_Inport');	
    csOutports = find_system(model_name,...
                'LookUnderMasks',lookundermasks,... %'all'
                'FollowLinks',followlinks,... %'on'
				'MaskType', 'TL_Outport');	
    cs_blocks = [csInports;csOutports];
   
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
                        'message','The name and constant of this Block is not the same');			
	
    for i = 1 : length(cs_blocks) % loop over to-be-checked blocks

        b=cs_blocks{i}; % the current block

        b_cancel=mes_progress(b);    % send progress-info to GUI and check for cancel message from GUI
        if b_cancel
            break
        end
		
        crc=0;
        X=[1,1];
        bh=get_param(b,'Handle'); 	% get block handle
%____________________________________________________________ start of own function
        leer='';
        Name=get_param(bh,'Name');
        if~(strncmp(Name,'V_',2)||strncmp(Name,'SWC_',4))
            ergI=tl_get(bh,'autosar.interrunnablevariable');
            erg=tl_get(bh,'autosar.dataelement');
            if tl_get(bh,'autosar.kind')== 3&&tl_get(bh,'autosar.useautosarcommunication')==1
                Constant=get_param(bh,'data');								% check parameter of the block
                StringV=strfind(Constant,'variable');
                comma=strfind(Constant,'''');
                startpos=StringV+11;
                for u=1:length(comma)
                    if comma(u)>startpos
                        endpos=comma(u)-1;
                        break;
                    end
                end
                Variable=Constant(startpos:endpos);
                if(strncmp(Variable,'',length(Variable)))
                    crc=1;
                end
                if (crc==0)
                    ind=strfind(Variable,'/');
                    underline=strfind(Variable,'_');
                    if(isempty(ind)&&isequal(size(underline),X))
                        NewConstant=Variable;
                    elseif(isempty(ind))
                        endpos=underline(end)-1;
                        NewConstant=Variable(1:endpos);
                    elseif(isequal(size(underline),X))
                        startpos=ind(end)+1;
                        NewConstant=Variable(startpos:end);
                    else
                        startpos=ind(end)+1;
                        NewConstant=Variable(startpos:end);
                    end
                end
                if ~strcmp(Name,NewConstant)
					% hilite_system(bh,'user1')
                    % build check item structure for current rule violation:
                    it=mxam_newcritem(default_item,...
                                      'message',['Name ',Name,' and variable ',NewConstant,' of the interrunnable are not the same'],...
                                      'handle',bh,...
                                      'path',mes_cleanpathname(bh));
                    cr_items{end+1} = it; % add new check item to result list
                end
            end
            if tl_get(bh,'autosar.kind')== 2&&tl_get(bh,'autosar.useautosarcommunication')==1
                if ~strcmp(Name,tl_get(bh,'autosar.dataelement'))
					% hilite_system(bh,'user1') highlights the blocks with
					% errors 
                    
                    % build check item structure for current rule
                    % violation: 
                    it=mxam_newcritem(default_item,...
                                      'message',['Name ',Name,' and variable ',tl_get(bh,'autosar.dataelement'),' of the sender-receiver are not the same'],...
                                      'handle',bh,...
                                      'path',mes_cleanpathname(bh));
                    cr_items{end+1} = it; % add new check item to result list
                end
            end
        end
%_______________________________________________________________end of own function
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