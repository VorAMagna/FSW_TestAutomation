configuration_string = fileread(MXAM_MXRAY_BATCHCONFIG_FILEPATH);

addpath(genpath(fileparts(which('mxam_execute_batch_tests'))))
configuration = json_decode(configuration_string);
mxray_path = configuration.mxray_path;

addpath(mxray_path);
fieldnames_artifacts = fieldnames(configuration.artifacts);
load_required_data_dict(configuration.data_dictionary_path)

for index = 1:numel(fieldnames(configuration.artifacts));
    spec_artifact = configuration.artifacts.(char(fieldnames_artifacts(index)));
    eval(spec_artifact.mxray_eval_string)
end

disp('done')
