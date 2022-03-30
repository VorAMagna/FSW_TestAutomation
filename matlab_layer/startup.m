% Used in FSW_TestAutomation to get all the matlab processes going
% Adds everything local recursively to path
% and iterates over eval strings supplied elsewhere from 
% the matlab_eval.json file
dspacerc;
addpath(genpath(pwd))
disp_pid();
eval_string = fileread('matlab_eval.json');
eval_config = json_decode(eval_string);
% Evaluates all the expressions given
for eval_config_iter = 1:numel(eval_config.evals)
    eval(eval_config.evals{eval_config_iter})
end
