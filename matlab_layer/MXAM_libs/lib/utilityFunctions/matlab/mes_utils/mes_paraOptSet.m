% Create/alters OPTions structure for parameter SETtings
%
% This function creates or alters options structures.
% It can be used for:
%  - creating a new complete options structure, all values set to defaults
%  - create a new partial options structure with given properties
%  - combine two or more predefined options structures into one
%  - change given properties of a options structure
% The function also returns a second structure of similar shape
%    with numbers indicating the source of each option.
% 
% The Example section below provides examples for all these possibilities.
% 
% Syntax:  [paraopt,sources] = mes_paraOptSet(definition, P1, P2, P3, P4, ...)
%
% Input arguments:
%    definition: 2 x 1 cell array defining names, types, default values and ranges
%                of the paraopt struct. 
%         fields are:
%         definition(1): cell n x 6 cell array defining all (currently 6) properties 
%                        of each of the n defined parameters. 
%                        Parameter properties are:
%                        1) name (string)
%                        2) type (1: positive integer
%                                 2: positive scalar
%                                 3: string
%                                 4: scalar
%                                 5: all)
%                        3) default value (type as defined in 2)
%                        4) range (min and max of allowed values, for numeric params only)
%                        5) multiple values (1: just one, 2: multiple number, 3: multiple)
%                      [ 6) optional source index (integer>0, referring to some definition file)]
%        definition(2): vector of positive integers to map the data in the definition to the
%                      properties as listed above. In most cases,use [1 2 3 4 5]
%                      or [1 2 3 4 5 6], if source indices are provided.
%        Example: to define a numeric and a string parameter var1 and var2,use:
%            definition{1}=[ {'ivar'}, {1}, {1},     {[0 Inf]},{0} {1}; ...
%                            {'svar'}, {3}, {'test'},{[0 Inf]},{0} {1} ]
%            definition{2}=[1 2 3 4 5 6];
%
%    P1,P2,...: parameters, either as paraopt structs, or as name-value pairs.
%               All paraopt structs must precede the first name-value pair.
%               Only parameters defined in the definition argument will be processed
%    
%    See examples below for a description of possible input types and their 
%    corresponding functionality.
%
% Return variables:
%    paraopt - Structure with newly defined options
%    sources - Structure with source indices for each of the returned
%              option. Source indices either refer to the ith Parameter P1,..P4
%              or, if no parameter is specified, are taken from the
%              provided definition argument. To distinguish these two cases, 
%              source indices referring to the parameter arguments are returned
%              as negative numbers: -1 refers to P1, -2, to P2, and so forth.
%              If parameters are given as name-value pairs, the names
%              index of the value is returned, E.g. mes_paraOptSet(definition,'var1',value1)
%              will return source index = -2
%
% Examples:
% 
%  mes_paraOptSet(definition) 
%     Called with only a definition cell and with no output arguments, 
%     all property names and their possible values given in the definition, 
%     including the default values are displayed on the command line.
%
%  [paraopt_full,sources] = mes_paraOptSet(definition)
%     Called with the definition cell only, mes_paraOptSet returns a paraoptions structure
%     with all defined property names set to their default value and a
%     structure with the respective source indices.
%
%  [paraopt_part,sources] = mes_paraOptSet(definition, 'name1', value1, 'name2', value2, ...) 
%     Creates a partial paraoptions structure in which the given 
%     properties are set to the specified values. It is sufficient to 
%     type only the leading characters that uniquely identify the property.
%     Case is ignored for the property names, for example:
%     paraopt_part = mes_paraOptSet(definition, 'Mutation.Name', 'mutint', 'Mutation.Range', 0.1)
%     The structure paraopt_part contains just the fields 'Mutation.Name'
%     and 'Mutation.Range' set to the specified values.
%
%  [paraopt,sources] = mes_paraOptSet(definition,paraoptold, 'name1', value1, ...) 
%     Alters an existing paraoptions structure paraoptold using the given
%     properties, for example:
%     paraopt_new = mes_paraOptSet(definition, paraopt_part, 'Recombination.Name',...
%                              'recdis', Mutation.Name', 'mutreal')
%     The structure paraopt_part defined in the previous example is extended 
%     with the property 'Recombination.Name'. The property 'Mutation.Name' 
%     is set to a new value.
%
%  [paraopt,sources] = mes_paraOptSet(definition,paraoptold, paraoptnew) 
%     Combines an existing paraoptions structure paraoptold with a new 
%     paraoptions structure paraoptnew. Any new properties overwrite 
%     corresponding old properties, for example:
%     [paraopt_all,sources] = mes_paraOptSet(mes_paraOptSet, paraopt_new)
%        The full and default structure returned by mes_paraOptSet (see second 
%        example above) is redefined with the properties from paraopt_new, 
%        which was preset in the examples above.
%
%  [paraopt,sources] = mes_paraOptSet(definition,paraoptcheck)
%     When called with just one paraoptions structure as input parameter, the values 
%     of the parameters are adjusted to the given boundaries and data types  
%     as defined in definition, (when multi strategy - then the number of values
%     is set to the number of subpopulations and so on).
%     For options, not specified in paraoptcheck but defined in definition,
%     the default value is returned. 
%     Options provided in paraoptcheck but not defined in defintion are ignored.
%     

function [paraopt,paraoptsources] = mes_paraOptSet(PARAOPTDEF, varargin)

















































































































































































































































































































































































































































