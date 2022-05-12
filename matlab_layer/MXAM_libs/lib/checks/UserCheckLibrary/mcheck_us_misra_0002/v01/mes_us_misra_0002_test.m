%% mcheck_us_misra_0002 - mes_us_misra_0002
%
% -------------------------------------------------------------------------
% Author: Raoul Beermann-Steger
% Date: 17th April 2019
%
% Description:    
% Every block except input/output signals and watch blocks has to use the
% macro $S_$B. For input/output signals and watch blocks it shall be the
% macro $B. 
% Furthermore, for all input/output signals and constants the block name 
% shall be the same as the name from the linked variable. 
%
% MES CHECK: 
% ==========
% misra_tl_2_2:	Avoidance of Identical Identifier Names
% [TL_RULE_SWDESIGN_AVOID_OVERLAPPING_NAMES]  
%
% PASS/FAIL CRITERIA
% ==================
% Every block except input/output signals and watch blocks has to use the
% macro $S_$B. For input/output signals it is $D (can't be changed) and for 
% watch blocks it shall be the macro $B. 
% Furthermore, for all input/output signals and constants the block name 
% shall be the same as the name from the linked variable. 
%
% FIX ACTION:
% ================ 
% Set the right macro.
% Set the right block name.
% -------------------------------------------------------------------------
clc;
model_name = bdroot;

% function[result,cr_items,r_stats]=mes_us_misra_0002(system,cmd_s)			% type before the id the keyword mes_
% [reg,s_regerr]=mxam_getCheckInfoFromDB('us_misra_0002');  					% get defaults from db

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
%  
d_nargin = nargin;
mes_preprocess; 														% check arguments, preset defaults
% if done==1
%     return
% end
% 
% try
    %% STEP 3: YOUR CUSTOM CODE PART STARTS HERE...
    % Find the blocks the check should investigate:
    startTime = now;
    cs_blocks = find_system(model_name,'LookUnderMasks','all','FollowLinks','on',...
    'Type','Block');
    
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
%         'message','The name and constant of this Block is not the same');
    
    tlExc = {'TL_Autodoc','TL_Function','TL_ToolSelector'}; % TargetLink exceptions
    tlNameExc = {'TL_Inport','TL_Outport','TL_Constant'};
    blkTlProps = {'output','index','fraction','gain'};
    
    set(0,'units','pixels')
    Pix_SS = get(0,'screensize');
    waitbarLength = 275;
    % Display waitbar:
    h = waitbar(0,'','Name','Please wait...','Position',...
        [uint16((Pix_SS(4)/2.5)) uint16((Pix_SS(3)/5)) uint16(waitbarLength) ...
        uint16(80)]);

    for i1 = 1 : length(cs_blocks)
        bh = get_param(cs_blocks{i1},'handle');
        bType = get(bh,'BlockType');
        mType = get(bh,'MaskType');
        bName = get(bh,'Name');
        maskValStr = get(bh,'MaskValueString');
        bCntErr = 0;
        
        if ishandle(h)
            timeDiff = (now-startTime)*10^5;
            waitbar(i1/length(cs_blocks),h,['Please wait...',...
                char(10),'Elapsed time: ',num2str(timeDiff),' s',...
                char(10),num2str((i1*100)/length(cs_blocks)),'%']);
        end
        
        for i2 = 1 : length(blkTlProps)
            blkTlProp.var = tl_get(bh,[blkTlProps{i2},'.variable']);
            blkTlProp.name = tl_get(bh,[blkTlProps{i2},'.name']);
            blkTlProp.class = tl_get(bh,[blkTlProps{i2},'.class']);
            
            if ~ischar(blkTlProp.var) || ~ischar(blkTlProp.name) || ~ischar(blkTlProp.class)
                continue
            end

            if ~isempty(mType)
                if strcmp(mType(1:3),'TL_')
                    % TL-blocks:
                    if sum(strcmpi(mType,tlExc)) == 0
                        % Not excluded TL-blocks:
                        if sum(strcmpi(mType,tlNameExc)) == 0 && isempty(blkTlProp.var)
                            if ~strcmp(blkTlProp.class,'DISP')
                                % Normal TL-blocks:
                                k = strfind(blkTlProp.name,'$S_$B');
                                if isempty(k)
                                    disp([bName,': Error the name doesn''t contain the expression $S_$B.']);
                                    bCntErr = bCntErr + 1;
                                end
                            else
                                % Watch blocks:
                                if ~strcmp(blkTlProp.name,'$B')
                                    disp([bName,': Error the name of the watch block is not $B.']);
                                    bCntErr = bCntErr + 1;
                                end
                            end
                        else
                            % All TL-blocks which have a linked variable or 
                            % inports, outports and constants without linked
                            % variables: 
                            if ~isempty(blkTlProp.var)
                                if ~strcmp(blkTlProp.name,'$D') && ~strcmp(blkTlProp.class,'default')
                                    disp([bName,': Error - please check the current ',mType,'. A DD-variable is linked but the ',blkTlProps{i2},' name is not $D.']);
                                    bCntErr = bCntErr + 1;
                                end
                            else
                                if ~strcmp(blkTlProp.name,'$S_$B') && ~strcmp(blkTlProp.class,'default')
                                    disp([bName,': Error - please check the current ',mType,'.  No DD-variable is linked but the ',blkTlProps{i2},' name is not $S_$B.']);
                                    bCntErr = bCntErr + 1;
                                end
                            end
                            if sum(strcmpi(mType,tlNameExc)) == 1 && strcmp(blkTlProps{i2},'output')
                                k = strfind(blkTlProp.var,'/');
                                if ~isempty(k)
                                    varName = blkTlProp.var(k(end)+1:end);
                                    if ~strcmp(bName,varName)
                                        disp(['Error: the block name ',bName,...
                                            ' isn''t the same as the linked variable ',varName,'!']);
                                        bCntErr = bCntErr + 1;
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        if bCntErr >= 1
            disp(['Check done for: ',cs_blocks{i1}]);
            disp('------------------------------------------------------');
        end
    end
    
    % Close waitbar:
    if ishandle(h)
        close(h);
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