configuration_string = fileread(MODELS_TO_EXCEPT_FILEPATH);

addpath(genpath(fileparts(which('mxam_execute_batch_tests'))))



configuration_post_mxray = json_decode(configuration_string);

configuration_post_mxray_batches = configuration_post_mxray.batches;
fieldnames_batches = fieldnames(configuration_post_mxray_batches);


limits_to_export = struct;


for index_batch = 1:numel(fieldnames(configuration_post_mxray_batches))
    
    batch_configuraiton = configuration_post_mxray_batches.(fieldnames_batches{index_batch});
    batch_limits = struct;
    fieldnames_artifacts = fieldnames(batch_configuraiton.artifacts);
    load_required_data_dict(batch_configuraiton.data_dictionary_path)

    load_required_data_dict(batch_configuraiton.data_dictionary_path)
    for index_artifact = 1:numel(fieldnames(batch_configuraiton.artifacts))
        spec_artifact =...
            batch_configuraiton.artifacts.(char(fieldnames_artifacts(index_artifact)));
        %open_system(spec_artifact.source_file);
        spec_artifact.limits = get_limits(spec_artifact);
        
        batch_configuraiton.artifacts.(char(fieldnames_artifacts(index_artifact))) = ...
            spec_artifact;
    end
    x = dsdd('Close');
    
    configuration_post_mxray_batches.(fieldnames_batches{index_batch}) = ...
        batch_configuraiton;
    
    %limits_to_export.(fieldnames_batches{index_batch}) = batch_limits;
    
end
export_string = json_encode(configuration_post_mxray_batches);
fileID = fopen(configuration_post_mxray.limit_result_file ,'w');
fprintf(fileID, '%s\n', export_string);
fclose(fileID);
disp('done')
