%% mcheck_us_0009 - mes_us_0009
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
% Checks the linked block`s port type.
%
% Pass-Fail Criteria:
% Linked block`s port has not the same type than the outer port.
% -------------------------------------------------------------------------

%% IMPLEMENTATION
function [result,cr_items,r_stats]=mes_us_0009(system,cmd_s)			% type before the id the keyword mes_
%% STEP 1: Pre-processing: Getting check info (assumes that check description is available)
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0009');  					% get defaults from db

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
        'message','Linked block`s port has not the same type than the outer port');
    
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
            if (a+x+c==3)												% If statement not true next block
                Name=get_param(b,'Name');            					% linked blocks with TL Ports
                Ports=get_param((b),'Portconnectivity');
                TL_Ports = find_system(b,'FollowLinks','on','Type','Block');
                Pcounter=0;
                for x=1:length (TL_Ports)
                    if strcmp((get_param((TL_Ports{x}),'MaskType')),'TL_Inport')	%  search for a TL_Inport in the linked block
                        Pcounter=Pcounter+1;
                        OutsideInport=Ports(Pcounter);
                        OutsideInportHandler = getfield(OutsideInport,'SrcBlock');	% search the connected port to the TL_Inport
                        if strcmp(get_param(OutsideInportHandler,'BlockType'),'DataTypeConversion')
                            var=get_param(OutsideInportHandler,'Portconnectivity');
                            var1 = getfield(var(1),'SrcBlock');
                            OutsideInportHandler =var1;
                        end;
                        OutsideInportConnect= get_param(OutsideInportHandler,'Portconnectivity');
                        if(size(OutsideInportConnect)==y)
                            if~strcmp(tl_get(OutsideInportHandler,'Output.Type'),tl_get(TL_Ports{x},'Output.Type'))	% if Type not same a rule violation appears
                                bh=get_param(TL_Ports{x},'Handle');
                                % hilite_system(bh,'user1')
                                % build check item structure for current rule violation:
                                it=mxam_newcritem(default_item,...
                                    'message','Input Type is not simular to the outer input Type',...
                                    'handle',bh,...
                                    'path',mes_cleanpathname(bh));
                                cr_items{end+1} = it; % add new check item to result list
                            end;
                        end;
                    end;
                    if strcmp((get_param((TL_Ports{x}),'MaskType')),'TL_Outport')	%  search for a TL_Inport in the linked block
                        Pcounter=Pcounter+1;
                        if Pcounter <= length(Ports)
                            OutsideOutport=Ports(Pcounter);
                            OutsideOutportHandler = getfield(OutsideOutport,'DstBlock');	% search the connected port to the TL_Outport
                            if strcmp(get_param(OutsideOutportHandler,'BlockType'),'DataTypeConversion')
                                var=get_param(OutsideOutportHandler,'Portconnectivity');
                                var1 = getfield(var(2),'DstBlock');
                                OutsideOutportHandler =var1;
                            end;
                            OutsideOutportConnect = get_param(OutsideOutportHandler,'Portconnectivity');
                            if(size(OutsideOutportConnect)==y)
                                if~strcmp(tl_get(OutsideOutportHandler,'Output.Type'),tl_get(TL_Ports{x},'Output.Type'))	% if Type not same a rule violation appears
                                    bh=get_param(TL_Ports{x},'Handle');
                                    % hilite_system(bh,'user1') highlights the blocks with
                                    % errors
                                    
                                    % build check item structure for current rule violation:
                                    it=mxam_newcritem(default_item,...
                                        'message','Output Type is not simular to the outer output Type',...
                                        'handle',bh,...
                                        'path',mes_cleanpathname(bh));
                                    cr_items{end+1} = it; % add new check item to result list
                                end;
                            end;
                        end
                    end;
                end;
            end;
        end;
        %____________________________________________________________ end of own function
    end;
    
catch % error handling
    lem=lasterror;
    mes_progress('/full:'); % clean-up progressbar
    result = ['error in ' mes_shortErrorLocationString(lem,1)];
    mes_postprocess;
    return
end

mes_progress('/full:'); % finally, show full progressbar
mes_postprocess; % clean up and report results
end % end of function
