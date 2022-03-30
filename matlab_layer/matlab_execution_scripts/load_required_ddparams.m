function load_required_ddparams(param_paths)
% loads parameter files
% :param param_paths: list of param paths as single char array or as a cell
% array
demopath= fullfile(tl_get_specialfolder('TLInstallation'),...
    'Demos', 'tl', 'ML_ImportExport','');  
addpath(demopath)
addpath(char(param_paths))                     
dsdd_mlie_import('VarGroup','','File','param.m','Synchronize','yes');   
end