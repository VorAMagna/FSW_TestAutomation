configuration_string = fileread(MXAM_MXRAY_BATCHCONFIG_FILEPATH);
% Executes batch tests mxam style
% :param config_json: a json formatted string containing the configuration

% add everything in the local path
addpath(genpath(fileparts(which('mxam_execute_batch_tests'))))

configuration = json_decode(configuration_string);

fieldnames_artifacts = fieldnames(configuration.artifacts);

mxam_drive_path = configuration.mxam_drive_path;
addpath(genpath(mxam_drive_path));

artifacts = {};


rP = 1;

for index = 1:numel(fieldnames(configuration.artifacts));
    spec_artifact = configuration.artifacts.(char(fieldnames_artifacts(index)));

    if rP == 1
        r_exec_opts = mxamapi_execution_options;
        r_exec_opts.s_project = configuration.mxam_project_path;
        r_exec_opts.b_create_report = false;
        r_exec_opts.b_keep_open = false;
        % %                 r_exec_opts.cs_callback_params = {'start'};
        % %                 r_exec_opts.s_mode = 'headless';
        r_exec_opts.cs_artifacts = {spec_artifact.source_file};
        r_exec_opts.cs_checks = {'mcheck_mes_color_001'};
        rP = 2;
    end
    
    
    r_exec_opts(rP) = mxamapi_execution_options;
    r_exec_opts(rP).cs_guidelines = spec_artifact.mxam_guidelines;
    r_exec_opts(rP).cs_artifacts = {spec_artifact.source_file};
    r_exec_opts(rP).b_create_report = false;
    r_exec_opts(rP).b_keep_open = false;
    % r_exec_opts(index).s_mode = 'headless';
    r_exec_opts(rP).s_project = configuration.mxam_project_path;
    
    for report_index = 1:numel(spec_artifact.mxam_report_types)
        r_exec_opts(rP).r_reports(report_index) =...
            struct(...
            's_directory',spec_artifact.result_dir, ...
            's_name', spec_artifact.report_filename_mxam,...
            's_format', spec_artifact.mxam_report_types{report_index},...
            's_detail', 'FULL');
    end
    
    rP = rP + 1;
end



% add the mxam program to the path
% add fsw_tools to the path
addpath(genpath(configuration.fsw_tools_path))

% load dependent data dictionaries and models
load_required_data_dict(configuration.data_dictionary_path)
load_required_models(configuration.magnalib_path)
load_required_ddparams(configuration.modelparam_path)


mxamapi_start_batch_execution(r_exec_opts);


