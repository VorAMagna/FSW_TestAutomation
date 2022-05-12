%% mcheck_us_0010 - mes_us_0010
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
% Checks the class of TL_Inport/TL_Outport.
%
% Pass-Fail Criteria:
% Class of TL_Inport/TL_Outport have to FCN_ARG/FCN_REF_ARG.
% -------------------------------------------------------------------------

%% IMPLEMENTATION
function [result,cr_items,r_stats]=mes_us_0010(system,cmd_s)			% type before the id the keyword mes_
%% STEP 1: Pre-processing: Getting check info (assumes that check description is available)
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0010');  					% get defaults from db

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
    cs_blocks = find_system(model_name, 'LookUnderMasks', 'all',...
                'FollowLinks','on',...
				'BlockType', 'SubSystem');	

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
                        'message','Class of TL_Inport/TL_Outport have to FCN_ARG/FCN_REF_ARG');
                    
    for i = 1 : length(cs_blocks) % loop over to-be-checked blocks

        b=cs_blocks{i}; % the current block

        b_cancel=mes_progress(b);    % send progress-info to GUI and check for cancel message from GUI
        if b_cancel
            break
        end
        bh=get_param(b,'Handle'); % get block handle
    %____________________________________________________________ start of own function
		y=size(1);
		
		
		
		if strcmp(get_param(b,'Linkstatus'),'resolved')
			A=findstr(get_param(b,'ReferenceBlock'),'dSPACE logo');
			B=findstr(get_param(b,'ReferenceBlock'),'Function');
			C=findstr(get_param(b,'ReferenceBlock'),'Autodoc');
			a=isempty(A);
			x=isempty(B);
			c=isempty(C);
			if (a+x+c==3)
				Name=get_param(b,'Name');								% linked blocks with TL Ports
				Ports=get_param((b),'Portconnectivity');
				TL_Ports = find_system(b,'FollowLinks','on','Type','Block');
				Pcounter=0;
				for x=1:length (TL_Ports)
					if strcmp((get_param((TL_Ports{x}),'MaskType')),'TL_Inport')	%  search for a TL_Inport in the linked block 
						if ~strcmp(tl_get(TL_Ports{x},'output.class'),'FCN_ARG')	% if class is not FCN_ARG a rule violation appears
								bh=get_param(TL_Ports{x},'Handle');
								% hilite_system(bh,'user1')
								% build check item structure for current rule violation:
								it=mxam_newcritem(default_item,...
								'message','Class have to be FCN_ARG',...
								'handle',bh,...
								'path',mes_cleanpathname(bh));
								cr_items{end+1} = it; % add new check item to result list
						end;
					end;
					if strcmp((get_param((TL_Ports{x}),'MaskType')),'TL_Outport')	%  search for a TL_Outport in the linked block 
						if ~strcmp(tl_get(TL_Ports{x},'output.class'),'FCN_REF_ARG')	% if class is not FCN_REF_ARG a rule violation appears
								bh=get_param(TL_Ports{x},'Handle');
								% hilite_system(bh,'user1') highlights the blocks with
                                % errors 
                                
								% build check item structure for current rule violation:
								it=mxam_newcritem(default_item,...
								'message','Class have to be FCN_REF_ARG',...
								'handle',bh,...
								'path',mes_cleanpathname(bh));
								cr_items{end+1} = it; % add new check item to result list
						end;
					end;
				end;                 
			end;
		end;
    %____________________________________________________________ end of own function
	end;

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