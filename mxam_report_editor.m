function mxam_report_editor(mode)
if nargin==0
    mode=0; % 1-version, 2-collect, 3-full report check
end
path_of_modules=pwd;
[~,comp,~]=fileparts(pwd);
modules = find_all_models(path_of_modules);
global str;
str='';
msg=['==================' comp '=================='];
print(msg)
for idx=1:numel(modules)
    module=modules(idx);
    path_of_report = find_report(path_of_modules, module);
    switch mode
        case 0
            disp([module{1}]);
            check_reports(module, path_of_report, mode);
        case 1
            get_version(module, path_of_report);
        case 2
            collect_reports(module, path_of_report);
        case 3
            disp([module{1}]);
            check_reports(module, path_of_report, mode);
        otherwise
            disp('Wrong mode selected!')
    end
end
if numel(modules)==0
    disp('WRONG FOLDER!');
else
    if mode==2
        file=[path_of_report.cmppath '\labels.txt'];
        fid = fopen(file,'wt');
        fprintf(fid, str);
        fclose('all');
        try
            zip_file(path_of_report);
        catch
            disp('Cannot create zip file!');
        end
    end
end

function check_reports(module, path_of_report, mode)
try
    % Test status in column B, search for aborted status (only for
    % User_checks currently)
    % TODO: implement for all checks
    spreadsheet={'Only_User_Checks', 'MISRA_TL_Selected_Checks', 'ISO26262_Selected_Checks'};
    if mode==0
        spreadsheet={'Only_User_Checks'};
    end
    for idx=1:numel(spreadsheet)
        i=2;
        cntPassed=0;
        cntFailed=0;
        cntInfo=0;
        cntAborted=0;
        cntOther=0;
        while 1
            B=['B' num2str(i)];
            [~,x,~]=xlsread(path_of_report.mxam,spreadsheet{idx},B);
            try
                x=x{1};
            catch
                disp(x)
            end
            %disp(x)
            if isempty(x)
                break;
            elseif ~isempty(strfind(x,'Passed'))
                cntPassed=cntPassed+1;
            elseif ~isempty(strfind(x,'Failed'))
                cntFailed=cntFailed+1;
            elseif ~isempty(strfind(x,'Info'))
                cntInfo=cntInfo+1;
            elseif ~isempty(strfind(x,'Aborted'))
                cntAborted=cntAborted+1;
            else           
                cntOther=cntOther+1;
            end
            i=i+1;
            if mode==0 % Fast Pass check, if one check fails stop 
                if cntAborted>0
                    disp('     \---X---> Aborted');
                else
                    disp('     \-------> OK');
                end
                break;
            end
        end
        if mode~=0
            if cntAborted>0
                status=['     \---X---> Aborted: ' num2str(cntAborted)];
            else
                status='     \-------> OK';
            end
            disp([status ...
                    ', Passed: ' num2str(cntPassed) ...
                    ', Failed: ' num2str(cntFailed) ...
                    ', Info: ' num2str(cntInfo) ...
                    ', Other: ' num2str(cntOther) ...
                    ',--[' spreadsheet{idx} ']']);
        end
    end
catch
    disp(['ERROR: ' module]);
end

function get_version(module, path_of_report)
try
    if exist(path_of_report.slx)>0
        model=path_of_report.slx;
    else
        model=[path_of_report.slx(1:end-3) 'mdl'];
    end
    wrk_rev_ver = get_file_version(model);
    [~,x,~]=xlsread(path_of_report.mxam,'Overview','B3');
    x=x{1};
    if ~isempty(strfind(x,'TEST'))
        disp(['->' module{1} ' ' wrk_rev_ver]);
    else
        disp([module{1} ' ' wrk_rev_ver]);
    end
    ver=regexp(wrk_rev_ver,'_','split');
    ver1{1}=['''' ver{1}(4:end)];
    ver2{1}=['''' ver{2}(3:end)];
    [st1,msg]=xlswrite(path_of_report.mxam,ver1,'Overview','B1');
    [st2,msg]=xlswrite(path_of_report.mxam,ver2,'Overview','B2');
%     if st1&&st2
%     else
%         disp('Excel not written!');
%     end
catch
    disp(['ERROR: ' module]);
end

function collect_reports(module, path_of_report)
err=0;
try
    [~,ver]=xlsread(path_of_report.mxam,'Overview','B1:B2');
catch
    disp('Error: Cannot read xlsx file!');
end
try
    copyfile(path_of_report.mxam, path_of_report.reports_mxam,'f')
catch
    disp(['Error: MXAM report for ' module{1} ' cannot be collected!']);
    err=1;
end
try
    copyfile(path_of_report.mxray, path_of_report.reports_mxray,'f')
catch
    disp(['Error: MXRAY report for ' module{1} ' cannot be collected!']);
    err=1;
end
if err==0
    if exist(path_of_report.slx)>0
        slx='SLX';
    else
        slx='MDL';
    end
    msg=[module{1} ' reports for ' slx ' ' ver{1} ' and DD ' ver{2}];
    print(msg);
end

function zip_file(path_of_report)
name=[path_of_report.path '\MXAM_MXRAY_Reports_[' path_of_report.component...
    ']_' path_of_report.project '.7z'];
PWD=pwd;
cd(path_of_report.cmppath);
command=['7z a ' path_of_report.cmppath ' -pmpt '];
[status, out]=system(command)
zip=[path_of_report.path '\' path_of_report.component '_Reports.7z'];
delete(name)
copyfile(zip, name);
delete(zip);
cd(PWD);

function modules = find_all_models(path_of_modules)
all_modules=dir(path_of_modules);
idx=1;
modules='';
for i=3:numel(all_modules)
    if all_modules(i).isdir==1 && ~isempty(str2num(all_modules(i).name(end)))
        modules{idx}=all_modules(i).name;
        idx=idx+1;
    end
end
modules=modules';

function print(msg)
global str
disp(msg);
str=[str msg char(10)];

function path_of_report = find_report(path_of_modules, module)
path=strcat(path_of_modules, '\', module);
path=path{1};
component=regexp(path_of_modules, '\', 'split');
project=regexp(path_of_modules, 'Development', 'split');
project=project{1};
proj=component{3};
component=component{6};
files=dir(path);
if strcmp(component,('VC'))
    product_group=strrep(path_of_modules, proj, 'Product_Group');
    product_group=strcat(product_group, '\SWC_VC_VehDynCtrlV10\', module);
    product_group=product_group{1};
else
    product_group=strrep(path, proj, 'Product_Group');
end
num_of_dd_files=0;
for i=3:numel(files)
    file=files(i).name;
    if strcmp(file(end-2:end), '.dd')
        if num_of_dd_files==0
            name=file(1:end-3);
        end
        num_of_dd_files=num_of_dd_files+1;
    end
end
if ~exist('name')
    name=module;
end
if num_of_dd_files>1
    disp(['WARNING: More than one dd file! ' name]);
elseif num_of_dd_files==0
    disp(['WARNING: No DD file: ' file]);
end
report_dir=[project 'Reports\' component '_Reports'];
if ~exist(report_dir,'dir')
    mkdir(report_dir);
end
path_of_report.path=[project 'Reports\'];
path_of_report.cmppath=report_dir;
path_of_report.project=proj;
path_of_report.component=component;
path_of_report.slx=[path '\' name '.slx'];
% path_of_report.dd=[path '\' name '.dd'];
path_of_report.mxam=[path '\MXAM-Report_' name '.xlsx'];
path_of_report.mxray=[path '\MXRAY-Report_' name '.xlsx'];
path_of_report.reports_mxam=[path_of_report.cmppath '\MXAM-Report_' name '.xlsx'];
path_of_report.reports_mxray=[path_of_report.cmppath '\MXRAY-Report_' name '.xlsx'];


