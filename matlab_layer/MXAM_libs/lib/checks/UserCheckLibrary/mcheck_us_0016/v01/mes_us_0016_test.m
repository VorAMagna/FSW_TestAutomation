%% mcheck_us_0016 - mes_us_0016
%
% -------------------------------------------------------------------------
% Author: Uemit Yasar
% Date: 23rd March, 2015
%
% Adaption:
%   Author: Raoul Beermann-Steger
%   Date: 25th April, 2017
%
% Description:
% Checks the LSB or the type of a LUT.
%
% Pass-Fail Criteria:
% The LSB or the type of a LUT and the previous block are not identical.
% -------------------------------------------------------------------------

%% IMPLEMENTATION
% function [result,cr_items,r_stats]=mes_us_0016(system,cmd_s)			% type before the id the keyword mes_
% %% STEP 1: Pre-processing: Getting check info (assumes that check description is available)
% [reg,s_regerr]=mxam_getCheckInfoFromDB('us_0016'); 						% get checkinfo from Database
% 
% % For MXAM Drive 3.3 required:
% reg.license='';
% %
% 
% % Add custom information to the check info structure:
% reg.version_id = '1.0'; 												% add version id check_infos
% reg.filename = mfilename; 												% add filename to check_infos
% 
% % reg.functionhandle = 0; 												% clear invalid function handle for ModelAdvisor
% % r_myscheme.HiliteType='user1';
% % r_myscheme.ForegroundColor='blue';
% % r_myscheme.BackgroundColor='magenta';
% % set_param(0, 'HiliteAncestorsData', r_myscheme)
% 
% %% STEP 2: Validate input arguments and initialize variables
%  
d_nargin = nargin;
% mes_preprocess; 														% sets done =1 when immediate return is required
% if done==1																%mes_preprocess detected reason for not executing check?
%     return																%then return here
% end
% try
model_name = bdroot;
    %% STEP 3: YOUR CUSTOM CODE PART STARTS HERE...
    % Find the blocks the check should investigate:
    cs_blocks = find_system(model_name,...
        'LookUnderMasks', 'all',...
        'FollowLinks','on',...
        'Regexp', 'on', 'MaskType','\S+Look\S+');% find all Look-Up tables in the model
    
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
%     default_item=struct('result','faulty','qualifier','block','linkaction','hilite',...
%         'message','The LSB or the type of the LUT and the previous block are not identical');	%given error message if a violate found
    
    maxLoopNum = 100;
    for i = 1 : length(cs_blocks)	% loop over to-be-checked blocks
        b=cs_blocks{i}; 			% the current block
%         b_cancel=mes_progress(b);	% send progress-info to GUI and check for cancel message from GUI
%         if b_cancel					% if there is a error
%             break					%break
%         end
        bh=get_param(b,'Handle'); 	% get block handle
        %____________________________________________________________ start of own function
        %         Name=get_param(cs_blocks{i},'Name');
        saveOutport = bh;
        ports = get_param(b,'Portconnectivity');
        port1 = ports(1);
        pBlock = port1.SrcBlock;
        pBlockLast = pBlock;
        pBlockPreLast = bh;
        pBlockNotFound = 0;
        portNumber = 1;
        inportName = 'notDefined';
        
        for iL = 1 : maxLoopNum
            % Check if the previous block is a subsystem:
            resultSubSys = subSystem(pBlock);
            % Get the data type of the previous block:
            resultDatTyp = dataType(pBlock);
            TL_Inport=~strcmp(get_param(pBlock,'MaskType'),'TL_Inport');
            if ~isempty(TL_Inport)
                if((strcmp(get_param(pBlock,'BlockType'),'Inport'))&&TL_Inport)
                    inportName = get_param(pBlock,'Name');
                    portNumber=str2num(get_param(pBlock,'Port'));
                    parent=get_param(pBlock,'Parent');
                    parentBlock=get_param(parent,'Handle');
                    % The block which is connected to the inport of the LUT
                    % is searched:
                    pPorts=get_param(parentBlock,'Portconnectivity');
                    pPort=pPorts(portNumber);
                    pBlock=pPort.SrcBlock;	%get block handler.
                    saveOutport = parentBlock;
                    %------------------------------------------------------
                    % FROM-BLOCK:
                elseif strcmp(get_param(pBlock,'BlockType'),'From')
                    TAG=get_param(pBlock,'GotoTag');
                    parentBlockGOTO=get_param(pBlock,'Parent');
                    parentBlockHGOTO=get_param(parentBlockGOTO,'Handle');
                    GOTOSYS=find_system(parentBlockHGOTO,'SearchDepth','1','BlockType','Goto');
                    for y=1:length(GOTOSYS)
                        if strcmp(get_param(GOTOSYS(y),'GotoTag'),TAG)
                            GotoCon=get_param(GOTOSYS(y),'PortConnectivity');
                            portNumber = (GotoCon.SrcPort + 1);
                            pBlock=GotoCon.SrcBlock;
                            saveOutport = GOTOSYS(y);
                            break;
                        end
                    end
                    %------------------------------------------------------
                    % SUBSYSTEM:
                elseif resultSubSys
                    stateFlowDet = 0;
                    portsInSubsys = find_system(pBlock,'SearchDepth','1','FollowLinks','on','BlockType','Outport');
                    if numel(portsInSubsys)==0
                        portsInSubsys=get_param(pBlock,'Portconnectivity');
                        subSysOutPort = portsInSubsys;
                        for i2 = 1 : length(portsInSubsys)
                            if ~isempty(portsInSubsys(i2).DstBlock)
                                portsInSubsys = portsInSubsys(i2).DstBlock;
                            end
                        end
                        if numel(portsInSubsys)==0
                            break;
                        else
                            % Stateflow:
                            breakForL = 0;
                            parentPBlock = get_param(get_param(pBlockPreLast,'Parent'),'Handle');
                            searchElement = {pBlockPreLast, parentPBlock, saveOutport, bh};
                            blockNames = get_param(pBlock,'Blocks');
                            % Find the right port number:
                            for i1 = 1 : length(searchElement)
                                for i2 = 1 : length(subSysOutPort)
                                    for i3 = 1 : length(subSysOutPort(i2).DstBlock)
                                        if subSysOutPort(i2).DstBlock(i3) == searchElement{i1}
                                            pBlock = subSysOutPort(i3).SrcBlock;
                                            stateFlowIn = blockNames{i3};
                                            breakForL = 1;
                                            break
                                        end
                                    end
                                    if breakForL
                                        break
                                    end
                                end
                                if breakForL
                                    break
                                end
                            end
                            if breakForL == 1
                                stateFlowDet = 1;
                            else
                                break
                            end
                        end
                    end
                    
                    if stateFlowDet == 0
                        % If there is only one outport then the search for the
                        % previous block is continued:
                        if length (portsInSubsys) == 1
                            port=get_param(portsInSubsys,'Portconnectivity');
                            pBlock=port.SrcBlock;
                            saveOutport = portsInSubsys;
                        else
                            % Get the Portconnectivity to find all outports:
                            subSysOutPort=get_param((pBlock),'Portconnectivity');
                            if strcmp(get_param(pBlockPreLast,'BlockType'),'SubSystem')
                                outPorts = find_system(pBlockPreLast,'SearchDepth',1,'BlockType','Outport');
                                if ~isempty(outPorts)
                                    pBlockPreLast = outPorts(portNumber);
                                end
                            end
                            
                            if strcmp(get_param(pBlockPreLast,'BlockType'),'BusCreator')
                                portNumber = 0;
                                for i2 = 1 : length(subSysOutPort)
                                    for i3 = 1 : length(subSysOutPort(i2).DstBlock)
                                        if subSysOutPort(i2).DstBlock(i3) == pBlockPreLast
                                            portNumber = str2num(subSysOutPort(i2).Type);
                                            break
                                        end
                                    end
                                    if portNumber ~= 0
                                        outPorts = find_system(pBlock,'SearchDepth',1,'BlockType','Outport');
                                        outPortName = get_param(outPorts(portNumber),'Name');
                                        k1 = strfind(outPortName,'_');
                                        if ~isempty(k1)
                                            outPortName = outPortName(1:k1(1)-1);
                                        end
                                        % Compare inportName with
                                        % outPortName:
                                        k2 = strfind(inportName,outPortName);
                                        k3 = strfind(outPortName,inportName);
                                        if ~isempty(k2) || ~isempty(k3)
                                            break
                                        end
                                    end
                                end
                            else
                                portNumber = 0;
                                parentPBlock = get_param(get_param(pBlockPreLast,'Parent'),'Handle');
                                searchElement = {pBlockPreLast, parentPBlock, saveOutport, bh};
                                breakForL = 0;
                                % Find the right port number:
                                for i1 = 1 : length(searchElement)
                                    for i2 = 1 : length(subSysOutPort)
                                        for i3 = 1 : length(subSysOutPort(i2).DstBlock)
                                            if subSysOutPort(i2).DstBlock(i3) == searchElement{i1}
                                                portNumber = str2num(subSysOutPort(i2).Type);
                                                break
                                            end
                                        end
                                        if portNumber ~= 0 && strcmp(get_param(searchElement{i1},'BlockType'),'SubSystem')
                                            outPorts = find_system(pBlock,'SearchDepth',1,'BlockType','Outport');
                                            outPortLineHandles = get_param(outPorts(portNumber),'LineHandles');
                                            pBlockTry = get_param(outPortLineHandles.Inport,'SrcBlockHandle');
                                            portCon = get_param(pBlockTry,'PortConnectivity');
                                            
                                            for i3 = 1 : length(portCon)
                                                if ~isempty(portCon(i3).DstBlock)
                                                    for i4 = 1 : length(portCon(i3).DstBlock)
                                                        outPortName = get_param(portCon(i3).DstBlock(i4),'Name');
                                                        k1 = strfind(outPortName,'_');
                                                        if ~isempty(k1)
                                                            outPortName = outPortName(1:k1(1)-1);
                                                        end
                                                        for i5 = 1 : length(searchElement)
                                                            
                                                            % Check if a
                                                            % stateflow
                                                            % variable exist:
                                                            if exist('stateFlowIn','var') && (i5 == 1)
                                                                searchElementName = stateFlowIn;
                                                            else
                                                                searchElementName = get_param(searchElement{i5},'Name');
                                                            end
                                                            
                                                            % Compare the names of
                                                            % the searchElements
                                                            % with the oupPortName:
                                                            k2 = strfind(searchElementName,outPortName);
                                                            k3 = strfind(outPortName,searchElementName);
                                                            if ~isempty(k2) || ~isempty(k3)
                                                                breakForL = true;
                                                                if exist('stateFlowIn','var')
                                                                    clear('stateFlowIn');
                                                                end
                                                                break
                                                            end
                                                        end
                                                        if breakForL
                                                            break
                                                        end
                                                    end
                                                end
                                                if breakForL
                                                    break
                                                end
                                            end
                                            if breakForL
                                                break
                                            end
                                        end
                                    end
                                    if portNumber ~= 0
                                        break
                                    end
                                end
                            end
                            outPorts = find_system(pBlock,'SearchDepth',1,'BlockType','Outport');
                            if (portNumber ~= 0) && (length(outPorts) >= portNumber)
                                outPortLineHandles = get_param(outPorts(portNumber),'LineHandles');
                                pBlock = get_param(outPortLineHandles.Inport,'SrcBlockHandle');
                            else
                                break
                            end
                        end
                    end
                    %------------------------------------------------------
                    % DATA TYPE CONVERSION:
                elseif resultDatTyp
                    errorOcc = 0;
                    % Check if the data type conversion is a TargetLink block
                    % or not:
                    try
                        tl_get(pBlock,'output.lsb');
                    catch
                        errorOcc = 1;
                        port=get_param(pBlock,'Portconnectivity');
                        pBlock=port.SrcBlock;
                    end
                    if errorOcc == 0
                        break
                    end
                    
                    %------------------------------------------------------
                    % BUS SELECTOR:
                elseif strcmp(get_param(pBlock,'BlockType'),'BusSelector')
                    parent=get_param(pBlock,'Parent');
                    parentBlock=get_param(parent,'Handle');
                    saveOutport = parentBlock;
                    pBlockInfo = get(pBlock);
                    outSigName = pBlockInfo.OutputSignalNames;
                    
                    if strcmp(inportName,'notDefined')
                        allInputs = get_param(bh,'InputSignalNames'); %pBlock
                        inportName = allInputs{1};
                    end
                    
                    for i1 = 1:length(outSigName)
                        if strfind(outSigName{i1},inportName)
                            if strfind(outSigName{i1},'<')
                                inportName = outSigName{i1}(2:end-1);
                            else
                                inportName = outSigName{i1};
                            end
                            portPos = i1;
                            break
                        end
                    end
                    busInportName = inportName;
                    %portCon = get_param(pBlock,'Portconnectivity');
                    
                    pBlock = get_param(pBlockInfo.LineHandles.Inport,'SrcBlockHandle');
                    %------------------------------------------------------
                    % BUS CREATOR:
                elseif strcmp(get_param(pBlock,'BlockType'),'BusCreator')
                    if exist('busInportName')
                        inportName = busInportName;
                    end
                    saveOutport = get_param(pBlock,'Handle');
                    allInputs = get_param(pBlock,'InputSignalNames');
                    portNumber = 0;
                    for i1 = 1:length(allInputs)
                        k = strfind(allInputs{i1},['_',inportName]);
                        
                        if strcmp(allInputs{i1},inportName) || ~isempty(k)
                            portNumber = i1;
                            break
                        end
                    end
                    inportName = findShortName(inportName);
                    portCon = get_param(pBlock,'Portconnectivity');
                    if portNumber == 0
                        for i1 = 1 : length(portCon)
                            if strcmp(get_param(portCon(i1).SrcBlock,'BlockType'),'Inport')
                                if strcmp(get_param(portCon(4).SrcBlock,'Name'),inportName)
                                    pBlock = portCon(4).SrcBlock;
                                    break
                                end
                            else
                                outPorts = find_system(portCon(i1).SrcBlock,'SearchDepth',1,'BlockType','Outport');
                                for i2 = 1 : length(outPorts)
                                    if strcmp(get_param(outPorts(i2),'Name'),inportName)
                                        pBlock = portCon(i1).SrcBlock;
                                        portNumber = i2;
                                        break
                                    end
                                end
                            end
                            if portNumber ~= 0
                                break
                            end
                        end
                    else
                        pBlock = portCon(portNumber).SrcBlock;
                    end
                    
                    if ~strcmp(get_param(pBlock,'BlockType'),'Inport')
                        if portNumber == 0
                            break
                        end
                    end
                else
                    break;
                end
            else
                break
            end
            if pBlockLast == pBlock
                pBlockNotFound = 1;
                break
            end
            pBlockPreLast = pBlockLast;
            pBlockLast = pBlock;
        end
        
        %----------------------------------------------------------------------
        % Check if evaluation for the current block should be started or not:
        
        skipEvaluation = 0;
        if exist('PortsInSubsys')~=0 %#ok<*EXIST>
            if numel(PortsInSubsys)==0
                skipEvaluation = 1;
            end
        end
        
        % Check if the previous block was a constant or a S-Function and if the
        % class is 'default':
        if ~isempty(pBlock)
            if strcmp(get_param(pBlock,'BlockType'),'Constant') || ...
                    strcmp(get_param(pBlock,'BlockType'),'S-Function')
                if strcmp(tl_get(pBlock,'output.class'),'default')
                    skipEvaluation = 1;
                end
            end
        end
        
        % If the previous block couldn't be found out, then a error message
        % should be given:
        if pBlockNotFound == 1
            disp(pBlock);
            disp('The previous block couldn''t be found. Please check this manually.');
%             it=mxam_newcritem(default_item,...
%                 'message','The previous block couldn''t be found. Please check this manually.',...
%                 'handle',bh,...
%                 'path',mes_cleanpathname(bh));
%             cr_items{end+1} = it; % add new check item to result list (predefined end)
        end
        
        
        %----------------------------------------------------------------------
        % Start of evaluation for the current block:
        if skipEvaluation == 0 && pBlockNotFound == 0
            pBlockName = [get_param(pBlock,'Parent'),'/',get_param(pBlock,'Name')];
            
            % Get the right input data from the LUT:
            inputError = 0;
            try
                inputLSB = tl_get(bh,'input.lsb');
                inputType = tl_get(bh,'input.type');
                if isempty(inputLSB) && isempty(inputType)
                    inputLSB = tl_get(bh,'row.lsb');
                    inputType = tl_get(bh,'row.type');
                end
                if isempty(inputLSB)
                    inputError = 1;
                    if ~isempty(inputType)
                       baseType = dsdd('Get',['/Pool/Typedefs/',inputType],'BaseType');
                       k = strfind(baseType,'Float');
                       if ~isempty(k)
                           inputError = 0;
                       end
                    end
                end
            catch
                inputError = 1;
            end
            
            % Blocks of type "Reference" shall be excluded from the test
            BlockStruct = get(pBlock);
            if ~isempty(BlockStruct)
                if ~strcmp(BlockStruct.BlockType,'Reference')
                    if ~(inputLSB==tl_get(pBlock,'output.lsb')) % control of the values (if true rule violation)
                        % hilite_system(bh,'user1')
                        % build check item structure for current rule violation: (predefined start)
                        disp(['The LSB is not identical to the previous block LSB. Previous block: ',pBlockName]);
%                         it=mxam_newcritem(default_item,...
%                             'message',['The LSB is not identical to the previous block LSB. Previous block: ',pBlockName],...
%                             'handle',bh,...
%                             'path',mes_cleanpathname(bh));
%                         cr_items{end+1} = it; % add new check item to result list (predefined end)
                    end
                    if inputError == 0
                        F = isEqualDataTypes(inputType,tl_get(pBlock,'output.type')); % check of the values (if F==0 rule violation)
                    else
                        inputTypes = {'uint8','uint16','uint32'};
                        for i1 = 1 : length(inputTypes)
                            k = strfind(tl_get(pBlock,'output.type'),inputTypes{i1}); % check of the values (if F==0 rule violation)
                            F = ~isempty(k);
                            if F == 1
                                break
                            end
                        end
                    end
                    if (F==0)
                        % hilite_system(bh,'user1')
                        % build check item structure for current rule violation: (predefined start)
                        disp(inputType);
                        disp(tl_get(pBlock,'output.type'));
                        disp(['The type is not identical to the previous block type. Previous block: ',pBlockName]);
%                         it=mxam_newcritem(default_item,...
%                             'message',['The type is not identical to the previous block type. Previous block: ',pBlockName],...
%                             'handle',bh,...
%                             'path',mes_cleanpathname(bh));
%                         cr_items{end+1} = it; % add new check item to result list (predefined end)
                    end
                end
            end
        end
    end %_______________________________________________________________end of own function
% catch lem % error handling
%     mes_progress('/full:'); % clean-up progressbar
%     result = ['error in ' mes_shortErrorLocationString(lem,1)];
%     
%     %% STEP 7: Post-processing: Complete statistics and clean-up
%     mes_postprocess;
%     return
% end
% mes_progress('/full:'); % finally, show full progressbar
% mes_postprocess; % clean up and report results


function rSubSystem = subSystem(Handler)
% Check if the given handler belongs to a subystem:
if strcmp((get_param(Handler,'BlockType')),'SubSystem')
    rSubSystem = 1;
    return
end
rSubSystem = 0;
return
end


function rDataType = dataType(Handler)
% Check if the given handler belongs to a data type conversion:
if strncmp((get_param(Handler,'BlockType')),'DataType',8)
    rDataType = 1;
    return
end
rDataType = 0;
return
end


function inportName = findShortName(inportNameOld)
% Adapt the old inport name by deleting the pre information and the
% endings. Therefore, only the signal name is exported as inportName:
startElements = {'P_','V_','W_'};
k = {};
for i1 = 1 : length(startElements)
    if strfind(inportNameOld(1:2),startElements{i1})
        k = strfind(inportNameOld(3:end),'_');
        if ~isempty(k)
            inportName = inportNameOld(k+3:end);
            break
        end
    end
end
if isempty(k)
    inportName = inportNameOld;
end
end



% Compares if two datatype strings are equal,
% also evaluates the base data types
function isEqual=isEqualDataTypes(type1,type2)
try
    isEqual=true;
    if ~isempty(type1) && ~isempty(type2)
        if strcmp(type1,type2)
            isEqual=true;
            return;
        else
            hDDObjects1 = dsdd('Find','/Pool/Typedefs','name',type1);
            hDDObjects2 = dsdd('Find','/Pool/Typedefs','name',type2);
            for lv1=1:length(hDDObjects1)
                for lv2=1:length(hDDObjects2)
                    basetype1=dsdd('Get',hDDObjects1(lv1),'BaseType');
                    basetype2=dsdd('Get',hDDObjects2(lv2),'BaseType');
                    if ~strcmp(basetype1,basetype2)
                        isEqual=false;
                        return
                    end
                end
            end
        end
    end
    return
catch
    isEqual=false;
    return;
end
end