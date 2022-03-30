function revision=getWorkingRevision(file)
% file='C:\Sandbox\Product_Group\SW\Development\HG\HG_Composition\HG_Modules\HistogramH10\HistogramH10.mdl'
cd(fileparts(file));
[~,info] = dos(['si rlog --noheaderformat --fields=workingrevdelta  ', file]);
revision.delta=str2double(strtok(info));
% if str2double(delta)
[status,info] = dos(['si rlog --noheaderformat --fields=workingrev  ', file]);
revision.version=strtok(info);
if strcmp(revision.version(1:2), '1.')||status==0
    revision.status='valid';
else
    revision.status='invalid';
end