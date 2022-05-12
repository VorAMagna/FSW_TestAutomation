%% mcheck_us_0004 - mes_us_0004
%
% -------------------------------------------------------------------------
% Author: Uemit Yasar
% Date: 23rd March, 2015
%
% Adaption:
%   Author: Raoul Beermann-Steger
%   Date: 18th November, 2016
%
% Description:
% Checks the LUT Block LSB.
%
% Pass-Fail Criteria:
% LUT Block LSB, type or min/max values are not identical.
% -------------------------------------------------------------------------

%% IMPLEMENTATION
function [result,cr_items,r_stats]=mes_us_0004(system,cmd_s)			% type before the id the keyword mes_
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0004'); 						% get checkinfo from Database

% For MXAM Drive 3.3 required:
reg.license='';
%

% Add custom information to the check info structure:
reg.version_id = '1.0'; 												% add version id check_infos
reg.filename = mfilename; 												% add filename to check_infos

reg.functionhandle = 0; 												% clear invalid function handle for ModelAdvisor
r_myscheme.HiliteType='user1';
r_myscheme.ForegroundColor='blue';
r_myscheme.BackgroundColor='magenta';
set_param(0, 'HiliteAncestorsData', r_myscheme)

%% STEP 2: Validate input arguments and initialize variables
 
d_nargin = nargin;
mes_preprocess; 														% sets done =1 when immediate return is required
if done==1																%mes_preprocess detected reason for not executing check?
    return																%then return here
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
        mes_progress('please wait...',length(cs_blocks),mesvar_PBStep,reg.check_id,0); % init progress bar
    
    %% STEP 5: Peri-processing: Apply ignorelist and update statistics.
    % filter irrelevant blocks, apply ignorelists, update statistics:
        [cs_blocks,r_stats] = mes_periprocess(cs_blocks,r_peri_ops);
    
    %% STEP 6: Check and optionally fix block parameters
    % define default fields for check item struct, returned by this check
    default_item=struct('result','faulty','qualifier','block','linkaction','hilite',...
        'message','LSB,type or min max values are not identical');	%given error message if a violate found
    for i = 1 : length(cs_blocks)	% loop over to-be-checked blocks
        b=cs_blocks{i}; 			% the current block
        b_cancel=mes_progress(b);	% send progress-info to GUI and check for cancel message from GUI
        if b_cancel					% if there is a error
            break					%break
        end
        bh=get_param(b,'Handle'); % get block handle
        type1 = tl_get(bh,'output.type');
        type2 = tl_get(bh,'table.type');
        a = 1;
        if isempty(type1)
            type1 = tl_get(bh,'input.type');
            type2 = tl_get(bh,'index.type');
            a = 2;
        end
        %____________________________________________________________ start of own function
        Name=get_param(cs_blocks{i},'Name');
        if a == 1
            if ~(tl_get(bh,'output.lsb')==tl_get(bh,'table.lsb'))			%controll of the values (if true rule violation)
                %hilite_system(bh,'user1') %highlights the blocks with
                %             errors
                %             build check item structure for current rule violation: (predefined start)
                it=mxam_newcritem(default_item,...
                    'message','LSB values are not identical',...
                    'handle',bh,...
                    'path',mes_cleanpathname(bh));
                cr_items{end+1} = it; 										% add new check item to result list (predefined end)
            end
        end
        
        F=strcmp(type1,type2); 	%controll of the values (if F==0 rule violation)
        if (F==0)
            if a==1
                %hilite_system(bh,'user1') %highlights the blocks with
                %errors
                %build check item structure for current rule violation:(predefined start)
                it=mxam_newcritem(default_item,...
                    'message','Output type and table type of the LookupTable are not identical',...
                    'handle',bh,...
                    'path',mes_cleanpathname(bh));
                cr_items{end+1} = it; 	% add new check item to result list (predefined end)
            elseif a==2
                %hilite_system(bh,'user1') %highlights the blocks with
                %errors
                %build check item structure for current rule violation:(predefined start)
                % Following check does not make sense because index is
                % normally a uint data type and input is something physical
%                 it=mxam_newcritem(default_item,...
%                     'message','Axis type and index type of the PreLookupTable are not identical',...
%                     'handle',bh,...
%                     'path',mes_cleanpathname(bh));
%                 cr_items{end+1} = it; 	% add new check item to result list (predefined end)
            end
        end
        
        if a == 1
            omin=isnan (tl_get(bh,'output.min'));
            omax=isnan (tl_get(bh,'output.max'));
            tmin=isnan (tl_get(bh,'table.min'));
            tmax=isnan (tl_get(bh,'table.max'));
            if (~isempty(omin)&&~isempty(omax)&&~isempty(tmin)&&~isempty(tmax))
                
                if~(omin||omax||tmin||tmax)							%controll of the values (if true rule violation)
                    if ~(omin==tmin||omax==tmax)
                        if (omin > tmin||omax < tmax)
                            %hilite_system(bh,'user1') %highlights the blocks with
                            %errors
                            %build check item structure for current rule violation: (predefined start)
                            it=mxam_newcritem(default_item,...
                                'message','Output Range smaller than table range ',...
                                'handle',bh,...
                                'path',mes_cleanpathname(bh));
                            cr_items{end+1} = it;						% add new check item to result list(predefined end)
                        else
                            %hilite_system(bh,'user1') %highlights the blocks with
                            %errors
                            %build check item structure for current rule violation: (predefined start)
                            it=mxam_newcritem(default_item,...
                                'message','Output Range larger than table range ',...
                                'handle',bh,...
                                'path',mes_cleanpathname(bh));
                            cr_items{end+1} = it;						% add new check item to result list(predefined end)
                        end
                    end
                else
                    %hilite_system(bh,'user1') %highlights the blocks with
                    %errors
                    %build check item structure for current rule violation: (predefined start)
                    it=mxam_newcritem(default_item,...
                        'message','Min or max values are not given',...
                        'handle',bh,...
                        'path',mes_cleanpathname(bh));
                    cr_items{end+1} = it;									% add new check item to result list(predefined end)
                end
            end
        end
    end
    %_______________________________________________________________end of own function
catch lem															% error handling
    mes_progress('/full:'); % clean-up progressbar
    result=['error in ' mfilename ': ',lem.message];
    
    %% STEP 7: Post-processing: Complete statistics and clean-up
    mes_postprocess;
    return
end
mes_progress('/full:'); % finally, show full progressbar
mes_postprocess; % clean up and report results

end % end of function