%% mcheck_us_0006 - mes_us_0006
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
% Checks the saturate output values.
%
% Pass-Fail Criteria:
% Saturate output values are not in the range of limit values.
% -------------------------------------------------------------------------

%% IMPLEMENTATION
function [result,cr_items,r_stats]=mes_us_0006(system,cmd_s)			% type before the id the keyword mes_
%% STEP 1: Pre-processing: Getting check info (assumes that check description is available)
[reg,s_regerr]=mxam_getCheckInfoFromDB('us_0006'); 						% get defaults from db

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
    % --> find all Saturate blocks in the model
    cs_blocks = find_system(model_name, 'LookUnderMasks', 'all',...
                'FollowLinks','on',...
				'BlockType', 'Saturate');

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
                        'message','scaling are not similar');
    %____________________________________________________________ start of own function
    for i = 1 : length(cs_blocks) 										% loop over to-be-checked blocks

        b=cs_blocks{i}; 												% the current block

        b_cancel=mes_progress(b);    % send progress-info to GUI and check for cancel message from GUI
        if b_cancel
            break
        end
		bh=get_param(b,'Handle'); % get block handle
		C='NaN';
        %------------------------------------------------------------------
        % This was added on the 14th July from the developer Raoul
        % Beermann-Steger because of an error during the check execution:
		% outputmin={0};
        outputmin=0;
        outputmax=0;
        %------------------------------------------------------------------
        X=num2str(tl_get(bh,'output.min'));
        Y=num2str(tl_get(bh,'output.max'));
        if (strcmp(X,C)||strcmp(Y,C))
            Type=tl_get(bh,'output.type');
            LSB=tl_get(bh,'output.LSB');
            if(strfind(Type,'uint32'))
                outputmin=(0);
                outputmax=((2^32)*LSB);
            elseif(strfind(Type,'int32'))
                outputmin=(-((2^32)/2)*LSB);
                outputmax=(((2^32)/2)*LSB)-(1*LSB);
            elseif(strfind(Type,'uint16'))
                outputmin=(0);
                outputmax=((2^16)*LSB);
            elseif(strfind(Type,'int16'))
                outputmin=(-((2^16)/2)*LSB);
                outputmax=(((2^16)/2)*LSB)-(1*LSB);
            elseif(strfind(Type,'uint8'))
                outputmin=(0);
                outputmax=((2^8)*LSB);
			elseif(strfind(Type,'int8'))
                outputmin=(-((2^8)/2)*LSB);
                outputmax=(((2^8)/2)*LSB)-(1*LSB);
            end
            A=outputmin==str2double(get_param(bh,'lowerlimit'));	% Check parameter
            B=outputmax==str2double(get_param(bh,'upperlimit'));
		else
			A=tl_get(bh,'output.min')==str2double(get_param(bh,'lowerlimit'));	% Check parameter
			B=tl_get(bh,'output.max')==str2double(get_param(bh,'upperlimit'));
		end
		
		if ((A+B)~=2)													% If A+B not 2, rule violation
%             hilite_system(bh,'user1')
            % build check item structure for current rule violation: (predefined start)
            it=mxam_newcritem(default_item,...
                              'message','Output values are not equal to the Limit values',...
                              'handle',bh,...
                              'path',mes_cleanpathname(bh));
            cr_items{end+1} = it; % add new check item to result list (predefined end)
        end
    end
	%____________________________________________________________ end of own function
catch
    le = lasterror;
    result = ['error in : ',mes_shortErrorLocationString(le,1)];
    %% STEP 7: Post-processing: Complete statistics and clean-up
    mes_postprocess;
end
mes_progress('/full:'); % finally, show full progressbar
mes_postprocess; % clean up and report results
end % end of function

