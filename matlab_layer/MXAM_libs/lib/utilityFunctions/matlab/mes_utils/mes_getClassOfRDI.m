%Get the class property of the variable that is replaceable data item
%If a replaceable variable is used in a block, the class property can not
%be obtained by tl_get. This replaceable variable is then replaced by a
%variable in the /pool/variables, the mapping info may exist in
%/Pool/DataitemMappings, if no mapping for this replaceable variable exits,
%assume the class is 'Global'(this is defined by the TL code Generator,
%refer to the help doc for replaceableitem)
%Before use this function, the property hasreplaceabledataitem must be
%checked.
%Syntax
%======
%s_class=mes_getClassOfRDI(s_rdi_var)
% INPUT ARGUMENTS:
% ================
% - s_dri_var       string, the replaceable variable
% RETURN VALUES:
% ==============
% s_class           string, the class of the actual used variable class

function s_class=mes_getClassOfRDI(s_rdi_var)



























