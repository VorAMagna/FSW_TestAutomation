%% mcheck_us_0028 - mes_us_0028
%
% -------------------------------------------------------------------------
% Author: Raoul Beermann-Steger
% Date: 19th December, 2016
%
% Adaption:
%   Author: Raoul Beermann-Steger
%   Date: 12th April, 2017
%
% Description:
% For LookUp-tables: Compare the block name with table name.
%
% Pass-Fail Criteria:
% Block name and table name are not identical.
% -------------------------------------------------------------------------

%% IMPLEMENTATION
% Template for a standard mes check, save in the check directory.
function [result,cr_items,r_stats] = mes_us_0028(system,cmd_s)			% type before the id the keyword mes_
%% STEP 1: Pre-processing: Getting check info (assumes that check description is available)
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0028');  					% get defaults from db

% For MXAM Drive 3.3 required:
reg.license='';

% Add custom information to the check info structure																		% add all necessary information here:
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
    cs_blocks = find_system(model_name,...
        'FollowLinks','on',...
        'Regexp', 'on', 'MaskType','\S+Look\S+');% find all Look-Up tables in the model
    
    %% STEP 4 : Initialize Progress Bar
    % Init progress bar (for GUI), needs to be done before calling mes_periprocess.
    % Set argument 2 (imax) to 0, if the number of items is not known yet.
    % The progressbar will be updated in mes_periprocess and check_param.
    % init progress bar
    mes_progress('please wait...',length(cs_blocks),mesvar_PBStep,...
        reg.check_id,0);
    
    %% STEP 5: Peri-processing: Apply ignorelist and update statistics.
    % filter irrelevant blocks, apply ignorelists, update statistics:
    [cs_blocks,r_stats] = mes_periprocess(cs_blocks,r_peri_ops);
    
    %% STEP 6 : Check and optionally fix block parameters
    % define default fields for check item struct, returned by this check
    default_item=struct('result','faulty','qualifier','block',...
        'linkaction','hilite','message',...
        'The name and constant of this Block ist not the same');
    
    for i = 1 : length(cs_blocks)	% loop over to-be-checked blocks
        b = cs_blocks{i}; 			% the current block
        b_cancel=mes_progress(b);    % send progress-info to GUI and check
        % for cancel message from GUI
        if b_cancel
            break
        end
        bh = get_param(b,'Handle'); 	% get block handle
        
        % Get block name:
        Name = get_param(b,'Name');
        % Get the table path:
        try
            whTableValue = get_param(bh,'Table');
            tabExists=1;
        catch
            tabExists=0;
        end
        
        if tabExists
            
            tabValueFound = 1;
            
            k1 = strfind(whTableValue,'/');
            k2 = strfind(whTableValue,'_y');
            k3 = strfind(whTableValue,'_x');
            k5 = strfind(whTableValue,'_z');
            k4 = strfind(whTableValue,''')');
            
            % Cut the table path to get the table name:
            if ~isempty(k1) && ~isempty(k2)
                tableValue = whTableValue(k1(end)+1:k2(end)-1);
            elseif ~isempty(k1) && ~isempty(k3)
                tableValue = whTableValue(k1(end)+1:k3(end)-1);
            elseif ~isempty(k1) && ~isempty(k5)
                tableValue = whTableValue(k1(end)+1:k5(end)-1);
            elseif ~isempty(k1) && ~isempty(k4)
                tableValue = whTableValue(k1(end)+1:k4(end)-1);
            else
                tabValueFound = 0;
            end
            
            testname=['MXAM_',mfilename];
            [BlockIsExcluded,blkExcludeFdbk]=isMxamExcludedBlock(testname,cs_blocks{i});
            
            if tabValueFound == 1
                if (~strcmp(Name,tableValue) && ~BlockIsExcluded)
                    errMess = ['The block name ',Name,' is not the same as the',...
                        ' table name ',tableValue,'.',blkExcludeFdbk];
                    % build check item structure for current rule violation:
                    it = mxam_newcritem(default_item,...
                        'message',errMess,...
                        'handle',bh,...
                        'path',mes_cleanpathname(bh));
                    cr_items{end+1} = it; % add new check item to result list
                end
            end
        end
    end
    
    
catch lem
    % If an error occurs during check execution report this in the catch block.
    mes_progress('/full:'); % clean-up progressbar
    result=['error in ' mfilename ': ',lem.message];
    %% STEP 7: Post-processing: Complete statistics and clean-up
    mes_postprocess;
    return
end

mes_progress('/full:'); % finally, show full progressbar
mes_postprocess; % clean up and report results
end % end of function