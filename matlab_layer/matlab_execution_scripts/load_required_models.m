function load_required_models(models)
% loads additional models (adds them to the path)
    for model = models
        addpath(genpath(char(model)));
    end

end
