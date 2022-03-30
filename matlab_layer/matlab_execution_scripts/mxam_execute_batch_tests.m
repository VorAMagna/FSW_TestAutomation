function mxam_execute_batch_tests(config_json)
% Executes batch tests mxam style
% :param config_json: a json formatted string containing the configuration

% add everything in the local path
addpath(genpath(fileparts(which('mxam_execute_batch_tests'))))

configuration = json_decode(config_json);

fieldnames_artifacts = fieldnames(configuration.artifacts);

mxam_drive_path = configuration.mxam_drive_path;
addpath(genpath(mxam_drive_path));

artifacts = {};

for index = 1:numel(fieldnames(configuration.artifacts));
    spec_artifact = configuration.artifacts.(char(fieldnames_artifacts(index)));
    r_exec_opts(index) = mxamapi_execution_options;
    r_exec_opts(index).cs_guidelines = spec_artifact.mxam_guidelines;
    r_exec_opts(index).cs_artifacts = spec_artifact.source_dir;
    r_exec_opts(index).b_create_report = false;
    r_exec_opts(index).b_keep_open = false;
   % r_exec_opts(index).s_mode = 'headless';
    r_exec_opts(index).s_project = configuration.mxam_project_path;

    
    for report_index = 1:numel(spec_artifact.mxam_report_types)
        r_exec_opts(index).r_reports(report_index) =...
         struct(...
        's_directory',spec_artifact.result_dir, ...
        's_name', spec_artifact.report_filename_mxam,...
        's_format', spec_artifact.mxam_report_types{report_index},...
        's_detail', 'FULL');
    end

end



% add the mxam program to the path
% add fsw_tools to the path
addpath(genpath(configuration.fsw_tools_path))

% load dependent data dictionaries and models
load_required_data_dict(configuration.data_dictionary_path)
load_required_models(configuration.magnalib_path)
load_required_ddparams(configuration.modelparam_path)


mxamapi_start_batch_execution(r_exec_opts);

return

end

function load_required_data_dict(data_dictionaries)
% loads the data dictionareies specified
% :param data_dictionaries: the data dictionaries to be loaded
% :type data_dictionaries: cell array or character array
if isa(data_dictionaries, 'char')
    data_dictionaries = {data_dictionaries};
end

for data_dictionary = data_dictionaries
    try
        [errorCode,hDDObject] = dsdd('AutoLoad', data_dictionary);
    catch
        error(['Could not load the data dictionary at' data_dictionary]);
    end
end

end

function load_required_models(models)
% loads additional models (adds them to the path)
    for model = models
        addpath(genpath(char(model)));
    end

end

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