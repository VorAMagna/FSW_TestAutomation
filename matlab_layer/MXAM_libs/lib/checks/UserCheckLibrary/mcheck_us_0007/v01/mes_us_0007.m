%% mcheck_us_0007 - mes_us_0007
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
% Checks the connection of constant with relational operator.
%
% Pass-Fail Criteria:
% Constant is not connected to the second port of the relational operator.
% -------------------------------------------------------------------------

%% IMPLEMENTATION
function [result,cr_items,r_stats]=mes_us_0007(system,cmd_s)			% type before the id the keyword mes_
%% STEP 1: Pre-processing: Getting check info (assumes that check description is available)
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0007'); 						% get defaults from db

% For MXAM Drive 3.3 required:
reg.license='';
%

% Add custom information to the check info structure:																		% add all necessary information here:
reg.version_id = '1.0'; 												% add version id check_infos
reg.filename = mfilename; 												% add filename to check_infos
reg.functionhandle = 0; 												% clear invalid function handle for ModelAdvisor

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
        'BlockType', 'RelationalOperator');
    
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
    %The Message which is given if the rule violation appears
    default_item=struct('result','faulty','qualifier','block','linkaction','hilite',...
        'message','Constant is not connected to the second port');
    %____________________________________________________________ start of own function
    for i = 1 : length(cs_blocks) 										% loop over to-be-checked blocks
        
        b=cs_blocks{i}; 												% the current block
        
        b_cancel=mes_progress(b);    % send progress-info to GUI and check for cancel message from GUI
        if b_cancel
            break
        end
        bh=get_param(b,'Handle'); 										% get block handle
        
        % The block which is connectet to the port 1 of the RelationalOperator is searched
        ports=get_param(b,'Portconnectivity');
        port1=ports(1);
        port2=ports(2);
        pBlock1=getfield(port1,'SrcBlock');								%get block handler.
        pBlock2=getfield(port2,'SrcBlock');
        
        if ishandle(pBlock1) && ishandle(pBlock2)
            Name1=get_param(pBlock1,'Name');

            Block1isConst = strcmp(get_param(pBlock1,'Blocktype'),'Constant');
            Block2isConst = strcmp(get_param(pBlock2,'Blocktype'),'Constant');

            if ~(Block1isConst && Block2isConst)

                F=(Block1isConst && not(strncmp(Name1,'P_',2)));	% If the block is a constant F is set to 1

                if (F==1) % if true a rule viloation appears.
                    % hilite_system(bh,'user1') highlights the blocks with errors

                    % build check item structure for current rule violation: (predefined start)
                    it=mxam_newcritem(default_item,...
                        'message','Constant is not connected to the second port',...
                        'handle',pBlock1,...
                        'path',mes_cleanpathname(pBlock1));
                    cr_items{end+1} = it; % add new check item to result list (predefined end)
                end
            end
        end
    end
    %____________________________________________________________ end of own function
catch 																	% error handling
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