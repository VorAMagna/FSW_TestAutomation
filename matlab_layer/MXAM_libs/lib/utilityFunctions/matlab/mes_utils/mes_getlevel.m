% Returns hierarchical level of block/signal in the model.
%
% SYNTAX:
% =======
% n_level = mes_getlevel(block)
% 
% INPUT ARGUMENT:
% ===============
% - block: handle or namestring of simulink object (block,signal,subsystem)
%
% RETURN VALUE:
% =============
% - n_level (integer), level of block or -1 if block does not exist
%           notes: level of modelroot (bdroot) = 0
%                  blocks at root level return 1
%
% EXAMPLES:
% ========
% mes_getlevel(bdroot)
% ans = 0
%
% mes_getlevel('mymodel/subsys')
% ans = 2
%
%
% mes_getlevel(gcb)-mes_getlevel(gcs)
% ans = 1

function n_level = mes_getlevel(block)





























































