function [limits] = get_limits(spec_artifact)
% gets limtis of a given system
% :param spec_artifact a specific isolated artifact:

open_system(spec_artifact.source_file)
limits = struct;

limits_index = 1;

relevant_variables = {'CyclomaticComplexityLimit', 'MxrayComplexityLimit',...
    'LevelLimit', 'MeetingID'};

found_blocks = find_system(spec_artifact.model_name, 'LookUnderMasks', 'all',...
    'FollowLinks', 'on', 'MaskType', 'MXRAYLimits');

for index_outer = 1:numel(found_blocks)
    limits_name_str = ['limit' num2str(limits_index)];
    found_block = found_blocks{index_outer};
    limits.(limits_name_str).simulink_path = found_block;
        for index = 1:numel(relevant_variables)
            relevant_variable = relevant_variables{index};
            found_handle = get_param(found_block,'Handle');
            limits.(limits_name_str).(relevant_variable) = str2double(get(found_handle,...
                relevant_variable));
        end
        limits_index = limits_index + 1;
end

close_system(spec_artifact.source_file);
end

