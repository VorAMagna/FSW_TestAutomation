%% mcheck_us_0034 - mes_us_0034
%
% -------------------------------------------------------------------------
% Author: Erik Hechtl
% Date: 18th October 2018
%
% Description:
% Checks if the parameters in the data dictionary are used in the
% corresponding model
%
% Pass-Fail Criteria:
% A dd-parameter does not occur as a block name in the model
% -------------------------------------------------------------------------

% function[result,cr_items,r_stats]=mes_us_0034(system,cmd_s)			% type before the id the keyword mes_
% [reg,s_regerr]=mxam_getCheckInfoFromDB('us_0034');  					% get defaults from db
% 
% % For MXAM Drive 3.3 required:
% reg.license='';
% %
% 
% % Add custom information to the check info structure:
% reg.version_id = '1.0'; 												% add version id check_infos
% reg.filename = mfilename;												% add filename to check_infos
% 
% % reg.functionhandle = 0; 												% clear invalid function handle for ModelAdvisor
% % r_myscheme.HiliteType='user1';
% % r_myscheme.ForegroundColor='blue';
% % r_myscheme.BackgroundColor='magenta';
% % set_param(0, 'HiliteAncestorsData', r_myscheme);
% 
% %% STEP 2: Validate input arguments and initialize variables
%  
d_nargin = nargin;
% mes_preprocess; 														% check arguments, preset defaults
% if done==1
%     return
% end
% 
% try
model_name = bdroot;
    %% STEP 3: YOUR CUSTOM CODE PART STARTS HERE...
    % Find the blocks the check should investigate:
    
    cs_blocks = find_system(model_name, 'LookUnderMasks', 'all',...
        'FollowLinks','on');
    
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
    
    % Find all the variables in the dd
    h_model = dsdd('Find','/Pool/Variables','ObjectKind','VariableGroup','Name',model_name);
    h_vars = dsdd('Find',h_model,'ObjectKind','Variable');
    varData.name = cell(numel(h_vars),1);
    varData.handle = zeros(numel(h_vars),1);
    i2 = 0;
    for i1=1:numel(h_vars)
        if isempty(dsdd('Get',h_vars(i1),'EnumRef'))
            varName = dsdd('GetAttribute',h_vars(i1),'Name');
            varExclude = dsdd('Get',h_vars(i1),'ExcludeFromMXAMCheck');
            
            % The stExclude property was added because for some signals this
            % is needed because the signal is not used in the related model
            % itself but in others.Particulary this can be seen for the 1SPD
            % and 2SPD modules in CC (for example: CalC02 and
            % ITCCalC02).
            if ~strcmp(varExclude,'yes')
                i2 = i2 + 1;
                % Delete last 2 letters, if variable ends with _y or _x or
                % _z
                % This is because the variable will be compared with the block name
                if ~isempty(regexp(varName(end-1:end),'_y|_x|_z'))
                    varData.name{i2} = varName(1:end-2);
                else
                    varData.name{i2} = varName;
                end
                varData.handle(i2) = h_vars(i1);
            end
        end
    end
    varData.name = varData.name(1:i2);
    varData.handle = varData.handle(1:i2);
    
    % List all the block names in the system
    Variable = cell(length(cs_blocks),1);
    for i1 = 1:length(cs_blocks)
        b = cs_blocks{i1}; % the current block
        bh = get_param(b,'Handle'); % get block handle
        Name = get_param(bh,'Name');
        Variable{i1} = Name;
        
%         b_cancel=mes_progress(b);    % send progress-info to GUI and check for cancel message from GUI
%         if b_cancel
%             break
%         end
    end
    
    % Also look for stateflow constants and local variables if the variable
    % is used there.
    rt = sfroot;
    modelRef = rt.find('-isa', 'Simulink.BlockDiagram', '-and', 'Name', model_name);
    sfConstants = modelRef.find('-isa', 'Stateflow.Data', 'Scope', 'Constant');
    sfLocals = modelRef.find('-isa', 'Stateflow.Data', 'Scope', 'Local');
    
    % Compare the two lists
    % If a parameter of the short list (dd-parameters) is not part of the long
    % list (model-parameters), an error is thrown
    bh1 = get_param(cs_blocks{1},'Handle');
    for i1 = 1 : length(varData.name)
        var_ok = false;
        for j = 1 : length(Variable)
            if strcmp(varData.name{i1},Variable{j})
                var_ok = true;
            end
        end
        if ~var_ok
            varNameShort = strrep(varData.name{i1},[model_name,'_'],'');
            if ~isempty(sfConstants.find('Name',varData.name{i1}))
                var_ok = true;
            elseif ~isempty(sfConstants.find('Name',varNameShort))
                var_ok = true;
            elseif ~isempty(sfLocals.find('Name',varData.name{i1}))
                var_ok = true;
            elseif ~isempty(sfLocals.find('Name',varNameShort))
                var_ok = true;
            end
        end
        
        if ~var_ok
            varClass = dsdd('Get',varData.handle(i1),'Class');
            
            switch varClass
                case 'MERGEABLE_CAL'
                    if strcmp(varData.name{i1}(1:2),'L_')
                        varType = 'LUT';
                    elseif strcmp(varData.name{i1}(1:2),'P_')
                        varType = 'parameter';
                    elseif strcmp(varData.name{i1}(1:2),'C_')
                        varType = 'constant';
                    end
                case 'MERGEABLE_DISP'
                    varType = 'signal';
                otherwise
                    varType = 'variable';
            end
            message = ['The ',varType,' "',varData.name{i1},'" is not used in the model! ',...
                'Please check your model if the ',varType,' is used and the block names',...
                ' fit to the ',varType,'s or delete the ',varType,' from Data Dictionary.'];
            disp(message);
        end
    end
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









