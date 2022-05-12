%% mcheck_us_misra_0004 - mes_us_misra_0004
%
% -------------------------------------------------------------------------
% Author: Raoul Beermann-Steger
% Date: 22nd May 2019
%
% Description:    
% Avoidance of volatile variables in logical expressions 
%
% MES CHECK: 
% ==========
% misra_tl_7_8:	Avoidance of volatile variables in logical expressions 
% [TL_RULE_VARIABLES_VOLATILE_VARS_LOGIC] 
%
% PASS/FAIL CRITERIA
% ==================
% 1.) No volatile variable shall be directly connected to a logical
% operator (except for the first input it is allowed) --> output of a 
% relational operator shall be used instead. 
% 2.) For relational operators connected to logical operators the variable
% class at the output shall be set to non-erasable attribute
% (NON_ERASABLE_LOCAL).
%
% FIX ACTION:
% ================ 
% 1.) Use an additional relational operator instead of the volatile 
% variable.
% 2.) Set the output class to NON_ERASABLE_LOCAL.
% -------------------------------------------------------------------------
clc;
model_name = bdroot;

% function[result,cr_items,r_stats]=mes_us_misra_0002(system,cmd_s)			% type before the id the keyword mes_
% [reg,s_regerr]=mxam_getCheckInfoFromDB('us_misra_0002');  					% get defaults from db

% For MXAM Drive 3.3 required:
% reg.license='';
%

% Add custom information to the check info structure:
% reg.version_id = '1.0'; 												% add version id check_infos
% reg.filename = mfilename;												% add filename to check_infos

% reg.functionhandle = 0; 												% clear invalid function handle for ModelAdvisor
% r_myscheme.HiliteType='user1';
% r_myscheme.ForegroundColor='blue';
% r_myscheme.BackgroundColor='magenta';
% set_param(0, 'HiliteAncestorsData', r_myscheme);

%% STEP 2: Validate input arguments and initialize variables
%  
d_nargin = nargin;
mes_preprocess; 														% check arguments, preset defaults
% if done==1
%     return
% end
% 
% try
    %% STEP 3: YOUR CUSTOM CODE PART STARTS HERE...
    % Add FSW-Tools to the current path if necessary for the usage of external 
    % scripts or functions:  
    fileFullPath = mfilename('fullpath');
    fswToolsPath = regexp(fileFullPath,'.*FSW_Tools','match');
    if exist('FSW_Tools','dir') == 0 && ~isempty(fswToolsPath)
        addpath(genpath(fswToolsPath));
    end
    
    % Find the blocks the check should investigate:
    cs_blocks = find_system(model_name,'LookUnderMasks','all','FollowLinks','on',...
    'MaskType','TL_LogicalOperator');
%     %% STEP 4 : Initialize Progress Bar
%     % Init progress bar (for GUI), needs to be done before calling mes_periprocess.
%     % Set argument 2 (imax) to 0, if the number of items is not known yet.
%     % The progressbar will be updated in mes_periprocess and check_param.
%     % init progress bar
%     mes_progress('please wait...',length(cs_blocks),mesvar_PBStep,reg.check_id,0); % init progress bar
%     
%     %% STEP 5: Peri-processing: Apply ignorelist and update statistics.
%     % filter irrelevant blocks, apply ignorelists, update statistics:
%     [cs_blocks,r_stats] = mes_periprocess(cs_blocks,r_peri_ops);
%     
%     %% STEP 6: Check and optionally fix block parameters
%     % define default fields for check item struct, returned by this check
%     % define default fields for check item struct, returned by this check
%     default_item=struct('result','faulty','qualifier','block','linkaction','hilite',...
%         'message','The output class of the LUT is not NOPT_LOCAL.');
    
    for i1 = 1 : length(cs_blocks)
        bh = get_param(cs_blocks{i1},'handle');
        bName = get(bh,'Name');
        
        portCon = get(bh,'PortConnectivity');
        
        for i2 = 1 : length(portCon)
            if ~isempty(portCon(i2).SrcBlock) && i2 > 1
                [pBlock, isSfObj] = getPreviousTlBlock(bh,i2);
                
                if ~isSfObj
                    maskType = get(pBlock,'MaskType');
                    [isVolatile,outputClass] = checkIfBlockClassPropIsVolatile(pBlock);
                    if isVolatile
                        disp(['Error: at the source port ',num2str(i2),' of the logical block ',bName,...
                            ' a DD-variable is linked with the class ',outputClass,' where the property volatile is set to on!',...
                            ' Block path:',cs_blocks{i1}]);
                    end
                    
                    if strcmp(maskType,'TL_RelationalOperator')
                        relOpHdl = pBlock;
                        relOpName = get(relOpHdl,'Name');
                        relOpPath = get(relOpHdl,'Path');
                        [pBlock, isSfObj] = getPreviousTlBlock(relOpHdl,2);
                        [isVolatile,~] = checkIfBlockClassPropIsVolatile(pBlock);
                        
                        if isVolatile
                            outputClass = tl_get(relOpHdl,'output.class');
                            if ~strcmp(outputClass,'NON_ERASABLE_LOCAL')
                                disp(['Error: the output class of the relational operator ',relOpName,...
                                    ' is not NON_ERASABLE_LOCAL!',...
                                    ' Block path:',relOpPath]);
                            end
                        end
                    end
                end
            end
        end
    end

    
%     
% catch lem % error handling
%     mes_progress('/full:'); % clean-up progressbar
%     result=['error in ' mfilename ': ',lem.message];
%     
%     %% STEP 7: Post-processing: Complete statistics and clean-up
%     mes_postprocess;
%     return
% end

% mes_progress('/full:'); % finally, show full progressbar
% mes_postprocess; % clean up and report results
% end % end of function