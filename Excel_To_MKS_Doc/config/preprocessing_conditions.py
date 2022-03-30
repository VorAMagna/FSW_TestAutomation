"""The preprocessing of the previously imported excel values gets defined
here"""

# Substrings in export item properties that will be replaced
ILLEGAL_SUBSTRINGS = [
    # OLD / NEW Value
    ("ö", "oe"),
    ("Ö", "Oe"),
    ("ü", "ue"),
    ("Ü", "Ue"),
    ("ä", "ae"),
    ("Ä", "Ae"),
    ("ß", "ss"),
    ("ẞ", "Ss"),
    ("°", "deg"),
    (r"'", r'"')
]


#Datatype to data record lenght translation table
# (datatype, byte length of type)
datatype_length = [
('uint8', "1"),
('uint16', "2"),
('uint32', "4"),

('sint8', "1"),
('sint16', "2"),
('sint32', "4"),

('float', "4"),
('bcd', "1"),
('ascii', "1"),
('bytefield', "1-83"),
('boolean', "1"),
# BMW:
("unsigned char", "1"),
("int", "1"),
("unsigned int", "1"),
("string", "1"),
("string[12]", "12"),
("string[11]", "11"),
("string[18]", "18"),
("string[46]", "46"),
("data", "1"),
("data[1]", "1"),
("data[2]", "2"),
("data[3]", "3"),
("data[4]", "4"),
("data[10]", "10"),
("data[16]", "16"),
("data[max=83]", "83"),
("long", "8"),
("unsigned long", "1"),
("char", "1")

]



# Specific unwanted values in properties of export items
#   if you add something here it should probably also be added in datatype_length[]
#    VALUE KEYWORD                   UNWANTED VALUE   CHANGED VALUE
UNWANTED_VALUES = [
    ('DiagServiceSpec_Datatype', ("unsigned char", "uint8")),
    ('DiagServiceSpec_Datatype', ("int", "sint8")),
    ('DiagServiceSpec_Datatype', ("unsigned int", "uint8")),
    ('DiagServiceSpec_Datatype', ("string", "bytefield")),
    ('DiagServiceSpec_Datatype', ("string[12]", "bytefield")),
    ('DiagServiceSpec_Datatype', ("string[11]", "bytefield")),
    ('DiagServiceSpec_Datatype', ("string[18]", "bytefield")),
    ('DiagServiceSpec_Datatype', ("string[46]", "bytefield")),
    ('DiagServiceSpec_Datatype', ("data", "bytefield")),
    ('DiagServiceSpec_Datatype', ("data[1]", "bytefield")),
    ('DiagServiceSpec_Datatype', ("data[2]", "bytefield")),
    ('DiagServiceSpec_Datatype', ("data[3]", "bytefield")),
    ('DiagServiceSpec_Datatype', ("data[4]", "bytefield")),
    ('DiagServiceSpec_Datatype', ("data[10]", "bytefield")),
    ('DiagServiceSpec_Datatype', ("data[16]", "bytefield")),
    ('DiagServiceSpec_Datatype', ("data[max=83]", "bytefield")),
    ('DiagServiceSpec_Datatype', ("long", "sint32")),
    ('DiagServiceSpec_Datatype', ("unsigned long", "uint8")),
    ('DiagServiceSpec_Datatype', ("char", "uint8"))
]




# PREPROCESSING FUNCTIONS which are to be used on a single export
# item (while its still in a raw dictionary)


def preprocess_remove_illegal_substrings(item: dict):
    """Removes the illegal substrings from all fields of an item"""
    for key_iter in item:
        for illegal_str, replace_str in ILLEGAL_SUBSTRINGS:
            if isinstance(item[key_iter], str):
                item[key_iter] = item[key_iter].replace(
                    illegal_str, replace_str)


def preprocess_add_bytelenght(item: dict):
    """Adds the data record lenght to the item if it doesn't exist.
        Needs to run before preprocess_change_unwanted_values
    """
    flag = False  # flag to see if datatype exists in datatype_lenghts list
    if not ("DiagServiceSpec_Argument Length (byte)" in item):
        for datatype in datatype_length:
            if item["DiagServiceSpec_Datatype"]==datatype[0]:
                item["DiagServiceSpec_Argument Length (byte)"] = datatype[1]
                flag = True
                break
    if not flag:
        item["DiagServiceSpec_Argument Length (byte)"] = "-"

def preprocess_change_unwanted_values(item: dict):
    """Searches vor unwanted values in unwanted keywords and changes them to the
    desired value"""
    for unwanted_value_iter in UNWANTED_VALUES:
        unwanted_keyword = unwanted_value_iter[0]
        unwanted_value = unwanted_value_iter[1][0]
        new_value = unwanted_value_iter[1][1]
        if unwanted_keyword in item and \
                item[unwanted_keyword] == unwanted_value:
            item[unwanted_keyword] = new_value


def preprocess_add_summary(item: dict):
    """Adds the summary to the item if it doesn't exist"""
    if not ("Summary" in item):
        if item['TEMP_XID-NAME']:
            item["Summary"] = "{} - {}".format(
                item['TEMP_XID-NAME'],
                item['DiagServiceSpec_Symbolic Argument Name'])
        else:
            item["Summary"] = item['DiagServiceSpec_Symbolic Argument Name']


def preprocess_pop_temp_values(item: dict):
    """Pops all temp values in the export items"""
    iter_item = item.copy()
    for key in iter_item:
        if key.startswith("TEMP_"):
            item.pop(key)


# list of functions which will be used on export list items
preprocess_list = [preprocess_remove_illegal_substrings,
                   preprocess_add_summary,
                    preprocess_add_bytelenght,
                   preprocess_change_unwanted_values,
                   preprocess_pop_temp_values,
                   ]
