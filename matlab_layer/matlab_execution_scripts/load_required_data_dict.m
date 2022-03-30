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
