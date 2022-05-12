%% mcheck_us_misra_0001 - mes_us_misra_0001
%
% -------------------------------------------------------------------------
% Author: Raoul Beermann-Steger
% Date: 17th April 2019
%
% Description:
% Adapted version of the MISRA-check misra_tl_3_3.
% The check was adapted in the way that if the limits are not directly
% defined in the calibratable min/max properties but defined via referenced
% type defintion (e.g. TLT_prc for percent variables) this shall not lead
% to a fail.
% Furthermore, the LUT limits are not checked, because this will be done
% by the user check mcheck_us_0004.
%
% GUIDELINE:
% ==========
% (original requirement of MISRA TL guideline 3.3)
% - Use of calibration constants -
% Upper and lower constraints must be supplied for
% calibration constants. The preferred method is to define the
% constraints with the symbol definition in the Data Dictionary.
%
% The MISRA requirements are adapted as following:
%
% Calibratable...
%   1) output.variables of TargetLink constant blocks,
%   2)  table.variables of TargetLink lookup table blocks and
%                   and of TargetLink interpolation blocks and
%   3) variables underlying stateflow constants
% should be linked to
%  a) variables held in the TargetLink data dictionary, having
%  b) defined Min and Max values.
%
% PASS/FAIL CRITERIA
% ==================
% 1) TargetLink constants fail, whose property output.class is not empty and
% not 'default' and the property 'info' of the class is neither 'none'
% nor 'readonly' (it is then calibratable), and its' output.variable is
% linked to a DD variable, but the Min and/or Max property of the DD variable
% is not defined.
% 2) Lookup tables and interpolation blocks fail, if their table.class is
%    a calibratable class, and their table.variable is a DD variable but
%    its min and max are not defined,
% 3) DD variables fail, it they are connected to a Stateflow constant and
%    belong to a calibratable class, but their Min and/or Max is not defined
% All other constants pass.
%
% Note: The check misra_tl_3_3 does not inspect calibratable constants which
% are not linked to the DD. For this check, see MXAM check misra_tl_3_2.
% -------------------------------------------------------------------------

%
% function[result,cr_items,r_stats]=mes_us_misra_0001(system,cmd_s)			% type before the id the keyword mes_
% [reg,s_regerr]=mxam_getCheckInfoFromDB('us_misra_0001');  					% get defaults from db
model_name = gcs;
mfilename = strrep(mfilename,'_test','');

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

% %% STEP 2: Validate input arguments and initialize variables
%  
d_nargin = nargin;
mes_preprocess; 														% check arguments, preset defaults
% if done==1
%     return
% end

% try
%% STEP 3: YOUR CUSTOM CODE PART STARTS HERE...
% Find the blocks the check should investigate:
cs_blocks = find_system(model_name,'LookUnderMasks','all','FollowLinks','on',...
    'MaskType','TL_Constant');
cs_blocksSF = cs_blocks;
rt = sfroot;
modelRef = rt.find('-isa', 'Simulink.BlockDiagram', '-and', 'Name',model_name);
chartRef = modelRef.find('-isa','Stateflow.Chart');
stateflows = chartRef.get('Path');
if ~isempty(stateflows)
    if ~iscell(stateflows)
        stateflows = {stateflows};
    end
    for i1 = 1 : length(stateflows)
        sfLocals = tl_get_sfobjects(stateflows{i1},'SFLocal');
        sfConsts = tl_get_sfobjects(stateflows{i1},'SFConstant');
        cs_blocksSF = [cs_blocksSF;num2cell(sfLocals);num2cell(sfConsts)]; %#ok<AGROW>
    end
end

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
for i1 = 1 : length(cs_blocksSF)
    if ischar(cs_blocksSF{i1})
        % TL-block-constants:
        bh = get_param(cs_blocksSF{i1},'handle');
        bVar = tl_get(bh,'output.variable');
        if ~isempty(bVar)
            bMin = tl_get(bh,'output.min');
            bMax = tl_get(bh,'output.max');
            bTyp = tl_get(bh,'output.type');
        end
    else
        % TL-Stateflow-constants:
        bh = cs_blocksSF{i1};
        bVar = tl_get(bh,'variable');
        if ~isempty(bVar)
            bMin = tl_get(bh,'min');
            bMax = tl_get(bh,'max');
            bTyp = tl_get(bh,'type');
        end
    end
    
    if ~isempty(bVar)
        if length(bMin) > 1 || length(bMax) > 1
            bMin = bMin(1);
            bMax = bMax(1);
        end
        if isempty(bMin) || isnan(bMin) || isempty(bMax) || isnan(bMax)
            k = strfind(bTyp,'/');
            if ~isempty(k)
                type.path = ['/Pool/Typedefs/',bTyp(1:k(1)-1)];
                type.name = bTyp(k(1)+1:end);
                type.handle = dsdd('Find',type.path,'Name',type.name);
                baseType = dsdd('Get',type.handle,'BaseType');
                if strcmp(baseType,'Bool')
                    bMax = 1;
                    bMin = 0;
                else
                    children = dsdd('GetChildren',type.handle);
                    if ~isempty(children)
                        if isempty(bMax) || isnan(bMax)
                            type.max = dsdd('Get',children(1),'Max');
                            bMax = type.max;
                        end
                        if isempty(bMin) || isnan(bMin)
                            type.min = dsdd('Get',children(1),'Min');
                            bMin = type.min;
                        end
                    end
                end
            end
        end
        if ischar(cs_blocksSF{i1})
            testname=['MXAM_',mfilename];
            [BlockIsExcluded,blkExcludeFdbk]=isMxamExcludedBlock(testname,cs_blocksSF{i1});
            
            if ~BlockIsExcluded
                if isempty(bMin) || isnan(bMin)
                    disp(['Property ''Min'' of variable ' ,bVar,...
                        ' is not defined.',blkExcludeFdbk]);
                    %             it=mxam_newcritem(default_item,...
                    %                 'message',['Property ''Min'' of variable' ,bVar,...
                    %                 ' is not defined.',blkExcludeFdbk],...
                    %                 'handle',bh,...
                    %                 'path',mes_cleanpathname(bh));
                    %             cr_items{end+1} = it; % add new check item to result list
                end
                if isempty(bMax) || isnan(bMax)
                    disp(['Property ''Max'' of variable ' ,bVar,...
                        ' is not defined.',blkExcludeFdbk]);
                    %             it=mxam_newcritem(default_item,...
                    %                 'message',['Property ''Max'' of variable' ,bVar,...
                    %                 ' is not defined.',blkExcludeFdbk],...
                    %                 'handle',bh,...
                    %                 'path',mes_cleanpathname(bh));
                    %             cr_items{end+1} = it; % add new check item to result list
                end
            else
                disp(['Exclude option for ',bVar,' was used!']);
            end
        end
        
        
    end
end

% catch lem % error handling
%     mes_progress('/full:'); % clean-up progressbar
%     result=['error in ' mfilename ': ',lem.message];
%
%     %% STEP 7: Post-processing: Complete statistics and clean-up
%     mes_postprocess;
%
%     return
% end
%
% mes_progress('/full:'); % finally, show full progressbar
% mes_postprocess; % clean up and report results
% end % end of function