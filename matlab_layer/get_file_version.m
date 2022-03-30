
function wrk_rev_ver = get_file_version(full_path, man)
if nargin<2
    man=1;
end
file = full_path;
file1 = regexp(full_path, '\', 'split');
file1 = file1{end};
file1 = regexp(file1, '\.', 'split');
file1 = file1{1};

info = '';
workingMDLRev = '';
workingDDRev = '';
wrk_rev_ver='';

ext=file(end-3:end);
if strcmpi(ext,'.slx')
    EXT='SLX';
else
    EXT='MDL';
end
% for i=1:3
%     disp(' ');
% end
%disp(['*************************' file1 '*************************'])
try
    ServerStat = 0; %checkMKSConnection;
    if ServerStat == 0
        build = checkBuild(file);
        if build == 0
            if exist(file,'file')
                [~,info] = dos(['si rlog --noheaderformat --fields=workingrev  ', file]);
                workingMDLRev = strtok(info);
            else
                workingMDLRev = '';
                disp(['File ', file, ' does not exist!']);    
            end
            if exist(strrep(file,ext,'.dd'),'file')
                [~,info] = dos(['si rlog --noheaderformat --fields=workingrev  ', strrep(file,ext,'.dd')]);
                workingDDRev = strtok(info);
            else
                workingDDRev = '';
                disp(['File ', strrep(file,ext,'.dd'), ' does not exist!']);    
            end
            info = [EXT ': ' workingMDLRev ', DD: ' workingDDRev];
            s1=strcat(EXT,workingMDLRev);
            s2=strcat('_DD',workingDDRev);
            wrk_rev_ver=strcat(s1,s2);
        else
            wrk_rev_ver='Build';
        end
    else
        info = 'Connection to MKS server failed!';
        if strcmp(wrk_rev_ver,'MDLThe_DDThe')||strcmp(wrk_rev_ver,'MDLThe_DD')||...
                strcmp(wrk_rev_ver,'SLXThe_DDThe')||strcmp(wrk_rev_ver,'SLXThe_DD')
            wrk_rev_ver='';
        end  

        if isempty(wrk_rev_ver)
            if man==1
                wrk_rev_ver=setManually;
%                 msgbox('Working file revision must be set manually! See Command Window below!');
% %                 for i=1:2
% %                     disp(' ');
% %                 end
%                 disp('SET THE FILE REVISION VERSION MANUALLY!');
%                 prompt = 'What is the MDL version? 1.';
%                 workingMDLRev=input(prompt,'s');
%                 prompt = 'What is the DD version? 1.';
%                 workingDDRev=input(prompt,'s');
%                 s1=strcat('MDL1.',workingMDLRev);
%                 s2=strcat('_DD1.',workingDDRev);
            end
        end
    end
%     wrk_rev_ver=strcat(s1,s2);
        %disp(['"' file1 '" version: ' wrk_rev_ver]);
catch
    disp(['Error when reading Revision Information of file ', file]);  
end
end

function build=checkBuild(build)
    %it seems to be a problem with Build sandboxes and should be set
    %manually
    build=split(build, '\');
    build=build{3};
    build=strfind(build, 'Build');
    build1=strfind(build, 'build');
    if isempty(build)
        build=0;
    end
    if isempty(build1)
        build1=0;
    end
    build=build+build1;
    if build > 0
        build = 1;
    else
        build = 0;
    end
end

function wrk_rev_ver=setManually
%     msgbox('Working file revision must be set manually! See Command Window below!');
%     for i=1:2
%         disp(' ');
%     end
    disp('SET THE FILE REVISION VERSION MANUALLY!');
    prompt = 'What format is it? (1.MDL, 2.SLX):';
    format=input(prompt,'s');
    if format==1
        prompt = 'What is the MDL version? 1.';
        workingMDLRev=input(prompt,'s');
        s1=strcat('SLX1.',workingMDLRev);
    elseif format==2
        prompt = 'What is the SLX version? 1.';
        workingMDLRev=input(prompt,'s');
        s1=strcat('MDL1.',workingMDLRev);
    end
    prompt = 'What is the DD version? 1.';
    workingDDRev=input(prompt,'s');
    s2=strcat('_DD1.',workingDDRev);
    wrk_rev_ver=strcat(s1,s2);
end
