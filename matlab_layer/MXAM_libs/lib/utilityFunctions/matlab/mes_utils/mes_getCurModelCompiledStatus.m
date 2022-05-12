% function compiledStatus = mes_getCurModelCompiledStatus( model_name,flag,last_compiledStatus )
%
% get the last model compiled mode or save the last compiled mode to this
% function. If the model is changed, the next call to this function will
% get 0 which means the model is new and has not tried to compile it.
%
% Input arguments
%  model_name--name of current model
%  flag      -- 1: get the last compiled mode; 2: save the current mode to
%  this function
%  last_compiledStatus-- last compiled mode to be saved 0: not
%  tryed,1=compileable,2=not compileable
% Output argument
% compiledStatus: 0: not tryed,1=compileable,2=not compileable
% 
% Usage:
% before try to compile the model, call this function to get the
% compileStatus:
% last_compileStatus=mes_getCurModelCompiledStatus(hBlock,1);
% If the return value last_compileStatus is not 2, then try to compile the
% model, then save the compileStatus to this function, you can use code like
%     if last_compileStatus~=2
%         res=mes_setmode(bdroot(hBlock),'c');
%         if ~strcmpi(res,'ok')
%             mes_getCurModelCompiledStatus(hBlock,2,2);
%         end
%     end
%   
%

function compiledStatus = mes_getCurModelCompiledStatus( model_name,flag,last_compiledStatus )














































































