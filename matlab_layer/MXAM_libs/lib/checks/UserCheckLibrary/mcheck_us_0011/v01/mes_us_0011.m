%% mcheck_us_0011 - mes_us_0011
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
% Checks the linked block`s port about lsb, type or scaling.
%
% Pass-Fail Criteria:
% Linked block`s port has not the same lsb, type or scaling than the outer
% linked port. 
% -------------------------------------------------------------------------

%% IMPLEMENTATION
function [result,cr_items,r_stats]=mes_us_0011(system,cmd_s)						% type before the id the keyword mes_
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0011'); 									% Type the right id there,get defaults from db

% For MXAM Drive 3.3 required:
reg.license='';
%

% Add custom information to the check info structure:
reg.version_id = '1.0';																% add version id check_infos
reg.filename = mfilename;															% add filename to check_infos
reg.functionhandle = 0;																% clear invalid function handle for ModelAdvisor

% r_myscheme.HiliteType='user1';														% Hilighte schema
% r_myscheme.ForegroundColor='blue';
% r_myscheme.BackgroundColor='magenta';
% set_param(0, 'HiliteAncestorsData', r_myscheme)

%% STEP 2: Validate input arguments and initialize variables
 
d_nargin = nargin;
mes_preprocess;																		% check arguments, preset defaults
if done==1
    return
end

try
    %% STEP 3: YOUR CUSTOM CODE PART STARTS HERE...
    % Find the blocks the check should investigate:																		% find all blocks in the model, 
    cs_blocks = find_system(model_name, 'LookUnderMasks', 'all',...
                'FollowLinks','on',...
				'BlockType', 'SubSystem');											%After 'BlockType' the searched block can be entred
																					% filter irrelevant blocks, apply ignorelists, update statistics:
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
    % define default fields for check item struct, returned by this check																				%The message which is printet if if a fault is found
    default_item=struct('result','faulty','qualifier','block','linkaction','hilite',...
                        'message','Linked block`s port has not the same lsb, type or scaling than the outer linked port');
                    
	for i = 1 : length(cs_blocks) 													% loop over to-be-checked blocks

		b=cs_blocks{i}; 															% the current block
		b_cancel=mes_progress(b);    												% send progress-info to GUI and check for cancel message from GUI
		if b_cancel
			break
		end
		bh=get_param(b,'Handle'); 													% get block handle
%**************************************************************************************************************************************
																					% Start of own function
		y=size(1);
		K=1;
		N=1;
		if strcmp(get_param(b,'Linkstatus'),'resolved')								% Search after linked blocks
			A=findstr(get_param(b,'ReferenceBlock'),'dSPACE logo');
			B=findstr(get_param(b,'ReferenceBlock'),'Function');
			C=findstr(get_param(b,'ReferenceBlock'),'Autodoc');
			a=isempty(A);
			x=isempty(B);
			c=isempty(C);
			if (a+x+c==3)															% sorting method
				Name=get_param(b,'Name');											% Thats one of the linked blocks
				Ports=get_param((b),'Portconnectivity');							% get the portconectivity
				TL_Ports = find_system(b,'FollowLinks','on','Type','Block');		% Find all blocks of the linked block
				Pcounter=0;
				for x=1:length (TL_Ports)											% Loop over the blocks
					if strcmp((get_param((TL_Ports{x}),'MaskType')),'TL_Inport')	% Search for TL_Inports
						Pcounter=Pcounter+1;
						P=getfield(Ports(Pcounter),'SrcBlock');						% Get the SrcBlock (front block)
						if strcmp(get_param(P,'BlockType'),'DataTypeConversion')	% Check for conversion block
							var=get_param(P,'Portconnectivity');					% if there is one get the Scr block of the convert block
							var1 = getfield(var(1),'SrcBlock')
							P =var1;
						end;
						if ~(strcmp(get_param(P,'MaskType'),'TL_Outport'))			% Control the src block 
							if ~(strcmp(get_param(P,'MaskType'),'TL_Inport'))		% No check if the SrcBlock is a TL_Outport or TL_Inport
								I_Block = find_system(P,'FollowLinks','on','Type','Block');	% Get the blocks in the src linked library
								for l=1:length (I_Block)									%loop
									Bl=I_Block(l);
									if strcmp((get_param((Bl),'MaskType')),'TL_Outport')	% Search for TL_Outports
										if(N==1)											% Counter for securing that the names of the ports are same
										N=2;
										end
										K=K+1;
										N=N+1;
										if strcmp(get_param(Bl,'Name'),get_param(TL_Ports{x},'Name'))	% check the names
										K=1000;															% If the name is ok the counter is set to a high value
												if ~(tl_get(Bl,'Output.lsb')==tl_get(TL_Ports{x},'Output.lsb'))	% check the lsb of the ports
												%given code block for found rule injury
													bh=get_param(TL_Ports{x},'Handle');
													% hilite_system(bh,'user1')
													% build check item structure for current rule violation:(predefined start)
													it=mxam_newcritem(default_item,...
													'message','In-OutPorts LSB of linked library are not same',...	%Error Message
													'handle',bh,...
													'path',mes_cleanpathname(bh));
													cr_items{end+1} = it; % add new check item to result list(predefined end)
												%so far
												end;															% end of lsb check
												if ~strcmp(tl_get(Bl,'Output.Type'),tl_get(TL_Ports{x},'Output.Type'))	% check the type of the ports
												%given code block for found rule injury
													bh=get_param(TL_Ports{x},'Handle');
													% hilite_system(bh,'user1')
													% build check item structure for current rule violation:(predefined start)
													it=mxam_newcritem(default_item,...
													'message','In-OutPorts Type of linked library are not same',...	%Error Message
													'handle',bh,...
													'path',mes_cleanpathname(bh));
													cr_items{end+1} = it; % add new check item to result list(predefined end)
												%so far
												end;																	% end of type check
												if ~strcmp(tl_get(Bl,'Output.Scaling'),tl_get(TL_Ports{x},'Output.Scaling'))	% check the scaling of the ports
												%given code block for found rule injury
													bh=get_param(TL_Ports{x},'Handle');
													% hilite_system(bh,'user1')
													% build check item structure for current rule violation:(predefined start)
													it=mxam_newcritem(default_item,...
													'message','In-OutPorts Scaling of linked library are not same',...	%Error Message
													'handle',bh,...
													'path',mes_cleanpathname(bh));
													cr_items{end+1} = it; % add new check item to result list(predefined end)
												%so far
												end;																			% end of scaling check
										end;
									end;
								end;
							end;
							if(N>K)																% Check of names of the ports
							%given code block for found rule injury
								bh=get_param(TL_Ports{x},'Handle');
								% hilite_system(bh,'user1') highlights the blocks with
                                % errors 
                    
								% build check item structure for current rule violation: (predefined start)
								it=mxam_newcritem(default_item,...
								'message','Ports Name are not same',...
								'handle',bh,...
								'path',mes_cleanpathname(bh));
								cr_items{end+1} = it; % add new check item to result list (predefined end)
							%so far
							end;																% end of name check
							K=1;
							N=1;
						end;
					end;
				end;
			end;
		end;
	end;

%******************************************************************************************************************************************
% end of own function
catch % error handling
    lem=lasterror;
    mes_progress('/full:'); % clean-up progressbar
    result = ['error in ' mes_shortErrorLocationString(lem,1)];
    
    %% STEP 7: Post-processing: Complete statistics and clean-up
    mes_postprocess;
    return
end

mes_progress('/full:'); % finally, show full progressbar
mes_postprocess; % clean up and report results
end % end of function